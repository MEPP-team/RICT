## Design note of [need 17](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need017.md)

We chose to contribute to 3dtiles standard because it:
 - is a promising emerging standard for streaming 3d urban data over the web  
 - has a strong community a
 - is efficient  
 - is implemented in iTowns (and our solution is based on iTowns framework for now).
 - is also used by Cesium.

The client/server workflow for displaying a city is described [here](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need021.md#notes). This design note answers parts 3 to 5 of this workflow that goes: 

````
3. the 3Dtiles-server forwards the request to a 3DBCity server
4. the 3DBCity server replies with a collection of a cityobjects 
   to the 3Dtiles-server
5. 3Dtiles-server packages the answer into a b3dm object that it 
   handles over to the iTowns framework
````

Note: The client (iTowns) only knows the hierarchy of the tiles and when it needs to display a region, it gets the geometries of the tiles that are in this region.

Each CityGML object natively has a `creationDate` and a `terminationDate` attribute as shown illustrated on the following diagram (extracted from CityGML 2.0 documentation):
![](images/CityGMLCore&ThematicModules.png)

There is not much precision about whether this dates reffers to [validTime](https://en.wikipedia.org/wiki/Temporal_database) or to [Transaction time](https://en.wikipedia.org/wiki/Temporal_database). In addition, some of the thematic modules (represented in blue in the UML diagram above) also have attributes linked to temporality: `yearOfConstruction` and `yearOfDemolition`. Their description in the CityGML 2.0 documentation is more detailed. Example for the building model:

"The year of construction (yearOfConstruction) and the year of demolition (yearOfDemolition) of the building or building part. These attributes can be used to describe the chronology of the building development within a city model. The points of time refer to real world time."

It seems that having two possible way of storing dates linked to objects is an issue of CityGML. We can either use `creationDate` and a `terminationDate` or `yearOfConstruction` and `yearOfDemolition`. In the following, we will use `yearOfConstruction` and `yearOfDemolition` (our datasets are constructed like this).

We have two solutions in order to use this temporal information:

1. Solution A: leave this information on the server side

   We leave the temporal information on the server side (the database). When the client wants to display a region at a date d, it requests the server for the tiles 
    - for this region 
    - fort this target date d 
    - and also provides the current display date (0 if not applicable). 
  
   To answer, the server computes the difference expressed in terms of city objects between the current display date and the target date d. For example this difference adds "new" buildings to the city state (i.e. buildings that are not present at current display data) and "removes" buildings from the city state (i.e. buildings that are present at current display date but not present anymore at the target date).
   
   Note: sending such a "city difference" requires the technical ability to specify city objects that are "removed" and thus should not be displayed anymore. In other terms using "city differences" requires a mean to distinguish addition from deletion when sending the city objects. Could this information be located in the metadata that b3dm can add to the Gltf geometries ? 

2. Solution B:
 
   We propose a 4D evolution of 3D-tiles (4D-tiles ?) : 3D-tiles + temporal. With this evolutoin, each tile has then a bounding volume as well as an additional temporal interval of existence (corresponding to `yearOfConstruction` and `yearOfDemolition` attributes). This requires to change the way tilesets are constructed in order to add the temporal information. Indeed, if we don't, we might have tiles with objects close to each other in the spatial dimension but existing on very disparate time periods. On the client side, we will choose if a tile is displayed not only based on its 3D bounding volume but also on its temporal existence. If a tile is displayed at a date d but a city object in the tile doesn't exist at this date d, then we will use culling process to not display this city object (kind of a temporal culling by city object).

We choose solution B because the temporal informations are needed for the visualisation process and thus leaving the intelligence server-side will require to run queries at every frame. Moreover, by choosing this solution, we use the same strategy for the geometry and the temporal information. More information [here](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Design/DesignNote027.md#thick---thin-client---server-strategy)

The workflow is detailed here:

![](images/Workflow_For_Temporal_Server_Side.png)

Currently, we know the valid period of each tile. This period begins at the earliest starting date among the city objects in the tile and end at the latest ending date among these. It might be possible that some objects don't exist at a certain date for which a tile is diplayed ( because the date is in the valid period of the tile but not in the valid period of the object).
The problem is that with the method proposed above, we don't know the valid period of a city object on the client side. For that, we propose the following method:
  
Currently, in the gltf file each geometry has an id named: batch_id. In the b3dm header there is metadata associated to each batch_id, we use these metadata to add the temporal information to the geometries.
In the client, we use these temporal information to know if a city object should be displayed or not. This comparison process is done in the shaders.

The explication of tile and b3dm:
![](images/B3dmExplication.png)


### Discussion of the 26/07/2017

What we need to do next:

  * In the database:
     * Fill the database with temporal CityGML examples (refer to the first task of [this issue](https://github.com/MEPP-team/RICT/issues/23))
  * In building-server:
     * Modify the API of building server to retrieve this temporal information from the database
     * Add their temporal interval of existence to the tiles
     * Modify the way tiles are created
  * In py3dtiles:
     * Add temporal interval of existence of each city object in the tiles: in the attributes of the b3dm linked to the batch_ids, add a temporal attribute having the corresponding value from the database

Each part is detailed below:
     
#### Fill the database with temporal CityGML examples

We create a dev database for answering the issues linked to adding a temporal dimension to our application. Then, we insert temporal CityGML files in it (provided by FPE).

#### Add their temporal interval of existence to the tiles

Each tile is composed of city objects which have a temporal interval of existence. The temporal interval of existence of a tile is starting at the earliest creationDate from its city objects and ending at the latest terminationDate of its city objects. The bounding volume of each tile (currently 3D) should be extended with this temporal interval. This should be done in [MEPP-team's fork of Oslandia's building-server](https://github.com/MEPP-team/building-server/tree/3dCityDB) on a to be created branch named 3dtiles-temporal based on 3dCityDB branch.

Like in this example: 

![](images/TileExample.png)

As for now, there is a pre-processing step on the server which creates a hierarchy of tiles (building-server-processdb.py) and store it in new tables of the database (see [here](https://github.com/MEPP-team/RICT/wiki/2017_06_29_-_3DCityDB_iTowns_adapter#server-workflow)). In the tatble tile, a bounding volume is associated to each tile. We will modify the script of building-server-processdb.py in order to add a column to store the creationDate of the tile and a column for the terminationDate of the tile. These dates will be computed using the creation dates and the destruction dates of the objects of the tiles. 
Then, we will modify the server API (particularly GetCity Method) in order to fetch this temporal time of existence of the tile and to add it into the 3dtiles tileset.

#### Modify the API of building server to retrieve this temporal information from the database

This should be done in [MEPP-team's fork of Oslandia's building-server](https://github.com/MEPP-team/building-server/tree/3dCityDB) on a to be created branch named 3dtiles-temporal based on 3dCityDB branch. We need to change the SQL queries allowing to retrieve the city objects of the tiles to also get the temporal information.

#### Add temporal interval of existence of each city object in the tiles

Changes should be made to [MEPP-team's fork of Oslandia's building-server](https://github.com/MEPP-team/building-server/tree/3dCityDB) on a to be created branch named 3dtiles-temporal based on 3dCityDB branch and to [MEPP-team's fork of Oslandia's py3dtiles](https://github.com/MEPP-team/py3dtiles) on a to be created branch named 3dtiles-temporal.

In building-server, the temporal information of each city object must be transferred to py3dtiles. In py3dtiles, the temporal information must be added in the [batch table](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/BatchTable) of the tile in which a batch_id will represent each feature of the gltf file.
Currently, the tiles are created with an empty batch table so we need to provide the feature of creating a batch table with the ids the features of the gltf file (or [other formats supported by 3d-tiles](https://github.com/AnalyticalGraphicsInc/3d-tiles#spec-status))

Technical note in [b3dm spec](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/Batched3DModel):
"The glTF asset must be 8-byte aligned so that glTF's byte-alignment guarantees are met. This can be done by padding the Feature Table or Batch Table if they are present."

#### Modify the way tiles are created

On the server, currently, there is a number of feature (geometric object, currently a building) per tile and a maximum tile size which can be configured in the file conf/building.yml. The tile hierarchy is a quadtree created using the extent of the city, and the two parameters abovementionned:
 * The root englobe all the scene
 * There is eventually "an intermediate level" which is a subdivision of the root in `n` part
 * Then, there one level of depth of the quadtree
 * If the number of feature in the tile of the previous level is higher than the configured number of feature per tile:
    - The tile is subdivided in subtiles. 
    - The tiles with the highest scores go into the parent tile and the ones with the lowest scores go into the children tiles.
  
More details about the tile creation process can be found in [Gai16].

**Design choice (refer to [GAi16])**
 - Sibling tiles can be geometrically overlapped ([example](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/figures/grid.png))
 - Nodes (of the hierarchy) can hold both features (references) and children sub-tiles.
 - Children-subtiles don't covert the parent tile geometry
 - Children sub-tiles are geometrically contained in their parent tile (geometrical nesting).

**Impact of temporality on the hierarchy creation process**
We must modify the hierarchy creation process in order to consider the temporal information.

FIXME questions:
 - the configuration file could hold: 
   * a maximum temporal interval of existence of a tile
   * the relative weights of temporal weight_function vs spatial weight_function
 - il va falloir clarifier la metrique sur le temps: c'est quoi une bonne métrique sur le temps.
 - il faut partir d'un exemple avec 5 features ou l'ordre pour chacun des poids change et ensuite voir comment on melange.
 - il se peut que l'on ne trouve pas de poids relatifs servant les use cases et il qu'il sortir de cette méthode
 - il se peut que la "bonne" (pour les use case) facon de faire soit d'avoir deux hierachies _jusqu'au bout_ (par opposition a une hiérarchie obtenue en pondérant deux métriques).
 - the weight function based on time intervals could use a metric different from the length of the interval and use more sophisticated metrics.

*Note: It might be a good idea to provide a schema illustrating this part.*

### Discussion of the 03/08/2017

#### In the data base, how we can do the communication between the cityobject and the building.

When we select the cityobject, we have to do a jointure between the table cityobject and the table building with the id of them. With that we can associte the date with the geometry.

## References

[Gai16] Gaillard, J., Peytavie, A., & Gesquière, G. (2016, October). A Data Structure for Progressive Visualisation and Edition of Vectorial Geospatial Data. In 3D GeoInfo (Vol. 2, pp. 201-209).
