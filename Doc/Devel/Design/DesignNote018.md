# Design note of [need 18](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need018.md)

## General informations

### Related software components

This need will be answered by modifying Oslandia's [building-server](https://github.com/Oslandia/building-server) and [py3dtiles](https://github.com/Oslandia/py3dtiles) components. We will first work on the forks of MEPP-Team organization of these components.

The current process for streaming the geometries to the server is:
* building-server receive a request from the client
* building-server fetches the requested geometries from the database
* building-server creates a [3d-tiles](https://github.com/AnalyticalGraphicsInc/3d-tiles) tileset
* py3dtiles creates each tile of the tileset

### Useful information about 3d-tiles and b3dm

In the 3d-tiles standard, a tile can represent different type of geometries and be in different formats (more information [here](https://github.com/AnalyticalGraphicsInc/3d-tiles#spec-status)). In our application, we mainly need stream geometries that will be converted into [Batched 3D Model](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/TileFormats/Batched3DModel/README.md) (*.b3dm) files to form tiles. Thus, we first focus on this format for adding the identifier of the geometries in the tiles. 

Important information from the [b3dm doc](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/TileFormats/Batched3DModel/README.md):

* [b3dm Layout](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/Batched3DModel#layout)
* Each geometry has a batchId attribute in the glTF section of the b3dm file which is an integer with values in [0, number of models in the batch - 1]. Here model is the same as what we call "geometry" in this document (it is also called "feature" in a b3dm file).
* Each b3dm file has a [batch table](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/Batched3DModel#batch-table) which contains per-model application-specific metadata, indexable by batchId.

We thus propose to use this batch table to stream the identifier of the geometries of the database from the database server to the client.

Additional documentation about the batch table can be found [here](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/BatchTable).

This documentation teaches us that:

* b3dm is not the only format using a batch table. There is also [Instanced 3D Model](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/TileFormats/Instanced3DModel/README.md) (i3dm), [Point Cloud](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/TileFormats/PointCloud/README.md) (pnts) and [Vector](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/TileFormats/VectorData/README.md) (vctr) which are formats supported by 3d-tiles standard. Using the batch table to transfer information linked to the geometry is thus not format dependant.

* [Different ways to use the batch table](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/BatchTable#layout). 

* There is an example with what we want to do (transfer an id). Related to design note 17, there is also examples with temporal information streamed this way. In [this example](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/BatchTable#json-header) it seems possible to stream a lot of semantic information which could be another way of doing this step: instead of only streaming the id of the geometries, we could stream all the semantic information in this batched table which would avoid more queries on the server. This is a design choice that needs to be discussed (maybe with JGA ?). How do other applications using 3d-tiles do ?

* There is the possibility of creating a [hierarchy in the metadata of the batch table](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/TileFormats/BatchTable#json-header) for complex cases. This might be useful in our case ?

## Proposition and Discussions

In order to provide access to semantic and hierarchical information of cityobjects client-side, there are two choices:
  * __Solution n°1:__ We transfer the id of the geometries of the database in the batch table, we store it on the client side and when some semantic or hirarchical information is needed client-side, we run queries in the database using this id.
  * __Solution n°2:__ We transfer all the semantic and hierarchical information of city objects to the client by using the method described in [Schi16], we store it in the client so we don't have to run queries every time we need semantic or hierarchical information.
     
**Inputs for choosing between the two solutions:**

 There is the technical freedom to leave any information associated to a geometry within the server (hierarchy, attributes, ADE...) or to transmsit it to the client. 
 
   * Is there additionnal criteria enabling to make a decision concerning the "optimal" tradeof ? Are there:
     * some use cases that will add some criteria ? (note that the experimental handling of hierarchies as done in [Schi16] does not add any constraint: when queried about a hierarchy of a geometrical object, we can request this hierarchy from the server)
     * some communication constraints ? (the server sends the information once and no further request shall be made)
     * some delay constraints ? (having to handle server querries when dealing with end-user interaction would introduce a delay that is not compatible with the expected fluidity of contemporary GUI)
     * ...
  * Search for feedback regarding the proposition of Schilling et al. in [Schi16]. (maybe from the 3d-tiles community or in other articles citing it).
  * Search for general criteria of decision in similar problems.
  * How does NSA manage the picking of one building or one roof or one wall from a tile ?
  * Look if other people had the same problem and justified their choices.

### Solution n°1 description:

If we choose this solution, we need to:

1. Modify the API of building-server in order to get the identifier of the geometries when fetching them.
2. Modify py3dtiles to add this identifier next to the geometries.
3. Modify the API of building-server to provide methods to retrieve semantic information from a list of geometries' ids.   


## References

[Schi16] Schilling, A., Bolling, J., & Nagel, C. (2016, July). Using glTF for streaming CityGML 3D city models. In Proceedings of the 21st International Conference on Web3D Technology (pp. 109-116). ACM.
