## Objective of the RICT project
The objective of the RICT (Representation Information CiTy) project is to design and realize 
  * a backend: 
     - an infrastructure enabling the storage of city related data,
     - an infrastructure for hosting and executing computational models (using the local backend data as well as online open data).  
  * a frontend: 
     - a simple interactive visualizer of the backend data
     - a computational model treatment handler (configure, trigger, explore results of a treatment)

We believe that in order to succeed with data usage one must not separate data concerns (information models, database infrastructure) from the offered tools, treatment process and the associated methodology. Questions like how to migrate a database when the information model changes (e.g. from CityGML version 2 to version 3), how to deal with information model modularity and extensions, what are the interactions between data and their treatment or how does one hangle data storage and computation scale up, must be dealt at first. RICT will try to propose good practices for doing so.  

## Description of the needs
We collect [use case oriented early descriptions of the needs](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/EarlyNeeds.md). 
Prior to any particular technical choice, this description of needs can help to
 * structure/organise the various involved roles
 * decompose the processes in atomic tasks and describe assembled processes
Eventually this structured description can 
 * lead to/orient good practices 
 * influence/structure the main architecture of components

## Developers
 * [https://github.com/MEPP-team/RICT/blob/master/Doc/DevelopersCentral.md](Gateway for RICT developers).
 * [Meeting minutes, technology surveys...](https://github.com/MEPP-team/RICT/wiki)

## Seeked backend/frontend features
### Aimed backend features
The aimed backend features could be:
 * offer some [ETL tools](https://en.wikipedia.org/wiki/Extract,_transform,_load) starting from standard (or de facto standards used by mainstream crowd sourcing site like [OpenStreetMap](https://en.wikipedia.org/wiki/OpenStreetMap)) of City related data   
 * distributed logical data (?)
 * abstract level data access (i.e. use accessor API that are directly derived out of [UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language) expressed [information models](https://en.wikipedia.org/wiki/Information_model)  
 * computational model execution engine
 
 ### Aimed frontend features
 The aimed frontend features could be:
   * 3D visualization of a territory
   * Use the [iTowns](http://www.itowns-project.org/) JS/WEBGL component (?)
