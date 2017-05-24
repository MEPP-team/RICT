## What the project needs (fuzzy/early description)
Consider an organization developing Computational Models (CM aka Filter) working on city related data. Such an organization is facing different challenges:
   
### Challenge 2: abstracting the CM/DR IO interface (API)?
The CM type signature says nothing about (doesn't require) the implementation details of the CM (e.g. in C/C++ think of the the distinction between the [function prototype](https://en.wikipedia.org/wiki/Function_prototype) and the function definition/body). 
Yet, a concrete CM implementation not only relies on its input/output data models but it also relies on the behavior ([accesors/mutators](https://en.wikipedia.org/wiki/Mutator_method)) as well as data structure means for traversal/walk (e.g. [graph traversal](https://en.wikipedia.org/wiki/Graph_traversal) or [tree traversal](https://en.wikipedia.org/wiki/Tree_traversal)) or the DR (Data Repository). 
Additionally this says nothing of possible behaviors attached/associated with such data models: 
 * the behavior associated to the data structure when one does numerical simulations  
 * or more simply of behavioral decoration (e.g. with the [visitor technique](https://en.wikipedia.org/wiki/Visitor_pattern)). 
   
The concern of the CM producer is to **interface, through some data access API, with the data at an abstraction level that enables code recycling**. For example it shouldn't be the CM provider concern:
 * to deal with the data repository specifics/details belonging to data logical or even physical model
 * to hardwire in the CM code some given database query language requests (e.g. `SQL` and/or "spatial SQL"). 

### Chalenge 4: from treatment data model to data bindings
A CM specifier will express the needs in terms of data elements (entities with attributes) and data structure (relationships between the entities) for the CM to be effective. The CM specifier will also need the such an [abstract data model](https://en.wikipedia.org/wiki/Conceptual_schema) in order to specify the output of the CM. A some point of the concrete realization workflow of that CM, an implementation will have to be produced. A component of that implementation will be the concrete implementation of the specified data structure (possibly enriched with implementation details: going from the [CIM](https://en.wikipedia.org/wiki/Model_Driven_Interoperability) (Computational Independent Model) to the [Platform Model](http://www.theenterprisearchitect.eu/blog/2008/01/16/mda-model-driven-architecture-basic-concepts/) (software)) as well as the associated I/O mechanisms in order to offer a [data binding](https://en.wikipedia.org/wiki/Data_binding) software component.

When following the [Model Driven Architecture](https://en.wikipedia.org/wiki/Model-driven_architecture) the chain of model transformations might use partially automated production tools that might avoid tedious manual implementations. In the case of VCity the goal is to avoid having to maintain a libCityGML C++ (in case this is the target language )library as well as the XML data bindings. Among those tools explore:
 * Google [Protocol Buffers](https://developers.google.com/protocol-buffers/docs/overview)
 * [Protocol buffers and Hadoop/Spark usage](http://stackoverflow.com/questions/34487996/how-can-i-use-proto3-with-hadoop-spark)
 * At the stage of code generation the [mixins technique](https://en.wikipedia.org/wiki/Mixin#Programming_languages_that_use_mixins) ) are the occasion of blending CityGML data model with ADE data model extensions together with Treatment technical needs (e.g. traces mechanisms for logs/debug).

## What the project doesn't need

### Dropped-challenge 1: data volume doesn't require scaling up
Although city data volumes are ramping up (new acquisition techniques, censors...):
  - their global volume for a given city (2 To) still remain "within reach" for HPC high memory nodes (currently 512Go and moving to 1To as for 2017),
  - the geographical layout (modeled as some coordinate system) offers a natural ordering (think of latitude/longitude) that offer a simple occasion for domain decomposition through [tiling](https://en.wikipedia.org/wiki/Uniform_tiling).

### Dropped-challenge 2: computational needs can be considered as bounded
We can consider that we set aside the scale up of the computational demand (due to both the data size and the treatment inherent [computation al complexity](https://en.wikipedia.org/wiki/Analysis_of_algorithms) because of the following remarks:
  - Domain decomposition (tiling) allows the usage of [grid computing](https://en.wikipedia.org/wiki/Grid_computing)
  - the project is at the research level where the goal of the prototypes is to illustrate feasibility and understand its limitations. Batch computational jobs are thus OK and user driven interactive delay constraints of production can be set aside.

In other terms if some considered CM takes an hour of elapsed time to be executed, then consider a smaller tile size of accept to wait for an hour delay...

## References
 * Chapter 1.1 p. 15 of [3DCityDB](http://www.3dcitydb.org/3dcitydb/fileadmin/downloaddata/3DCityDB_Documentation_v3.3.pdf) decribes its feature list. 
