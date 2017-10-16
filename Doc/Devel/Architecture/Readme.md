## Hot to improve this page
Move (some of) the content (at least diagrams) from the following document within the current page:
 - [Bottom page architecture notes](https://github.com/MEPP-team/RICT/blob/master/Install.md#architecture-notes)
 
## Components names
 * [UDV (Urban Data Viewer)](https://github.com/MEPP-team/UDV) : client side
   * [UDV/EarlyPrototype](https://github.com/MEPP-team/UDV/tree/master/EarlyPrototype) holds the first prototype version
   * UDV/FabPat: an application dedicated to "FABrique du PATrimoine"
   * [UDV/Vilo3D](https://github.com/MEPP-team/UDV/tree/master/Vilo3D) ([tag](https://github.com/MEPP-team/UDV/releases/tag/Vilo3D-Demo-1.0): an demo application for the [Vilo3D project](http://imu.universite-lyon.fr/projet/vilo-3d-la-fabrique-urbaine-des-processus-a-leurs-representations-3d/)
   * [UDV/UDV-Core](https://github.com/MEPP-team/UDV/tree/master/UDV-Core): a component for applications to share core client code
 * [iTowns](https://github.com/iTowns/itowns)
 * [building-server](https://github.com/MEPP-team/building-server/) : a fork of [Oslandia's building-server](https://github.com/Oslandia/building-server/)
 * [py3dtiles](https://github.com/MEPP-Team/py3dtiles/) : a fork of [Oslandia's py3dtiles](https://github.com/Oslandia/py3dtiles/)
 * LibCityProcess:
   * a library [repackaging 3DUse filters](https://github.com/MEPP-team/3DUSE/issues/39) as a separate component.

## Architecture

Architecture information is organized as follow:
  * [Application.md](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Architecture/Application.md) containing the architecture and related diagrams regarding the whole application.
  * [UDV](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Architecture/UDV.md) for ressources regarding UDV.
  * [Itowns](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Architecture/Itowns.md) for ressources regarding iTowns inner architecture.
  * [Server.md](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Architecture/Server.md) for ressources about server components (currently for py3dtiles and building-server).
  * [3DCityDB.md](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Architecture/3DCityDB.md) for ressources regarding 3DCityDB and its enhancement.

## Other

### People
 * [Tatjana Kutzner (from TUM)](https://www.gis.bgu.tum.de/unser-team/lehrstuhlangehoerige/dr-tatjana-kutzner/)
    - Defines [ADE (network among others)](https://github.com/TatjanaKutzner/CityGML-UtilityNetwork-ADE) 
    - [Tatjana Kutzner's thesis (chapter 4.1 p63)](https://mediatum.ub.tum.de/doc/1341432/1341432.pdf) states that the key point is the ATL (Transformation Language) availability. In chapter 4.3.2 three tools are mentions FME (proprietary), Go Publisher (proprietary) and HALE (open-source).
 * [Kanishk Chaturvedi](https://github.com/kanishk-chaturvedi/CityGML-3.0) from [TUM](https://www.gis.bgu.tum.de/unser-team/lehrstuhlangehoerige/kanishk-chaturvedi/)
 
### Tools
 * [Enterprise Architect](http://www.sparxsystems.com/products/index.html#ult)
    - [OSX-Wine install](https://github.com/MEPP-team/VCity/wiki/OSX_Instal_Enterprise_Architect_-_2017_06_08)
    - [ShapeChange trial](https://github.com/MEPP-team/VCity/wiki/EA_and_ShapeChange_trial_-_2017_06_22)
    - EA automation:
      * [Java](https://exploringea.com/2013/12/11/ea-automation-with-java/)
      * [JavaScript](http://www.sparxsystems.com/enterprise_architect_user_guide/10/automation_and_scripting/the_scripter_window.html)
 * [OBEO designer](https://www.obeodesigner.com/en/) and [UML designer](http://www.umldesigner.org/) 
   - [Obeo Designer Academic Program](https://www.obeodesigner.com/en/academic-program) is available for research or educational purposes.
   - [Sirius community](https://www.eclipse.org/forums/index.php?t=thread&frm_id=262) (pointed [here](https://www.obeodesigner.com/en/resources))
   - See also [Importing CityGML trial](https://github.com/MEPP-team/VCity/wiki/Obeo_designer_trial_-_2017_06_22/_edit)     
 * [MEGA UML](http://www.mega.com/en/resource/mega-uml-hopex) by [MEGA](http://www.mega.com/en)
 * Generate postgresql database tables diagram with  
    - [schemaspy](https://stackoverflow.com/questions/3223770/tools-to-generate-database-tables-diagram-with-postgresql) looked promising but couldn't make it work. Whatever arguments you provide for host, port, password it will generate something in `./schemapy/index.html` instead of complaining about wrong authentication (or could it be that is a social engineering scam to obtain the access codes?)
    - Note: Mysql-workbench only works with MySQL...

### References
  * [Software architecture](http://ftacademy.org/sites/ftacademy.org/files/materials/fta-m11-soft_arch-pre.pdf) by Bijlsma, Heerendr, Roubtsova, Stuurman
  * [A Reminder On Three/MultiTier Layer Architecture Design](https://www.hanselman.com/blog/AReminderOnThreeMultiTierLayerArchitectureDesignBroughtToYouByMyLateNightFrustrations.aspx) (by Scott Hanselman): **"If you are designing a layer, know your in's and out's and for Goodness' Sake know your responsibility.  If you don't, back to the drawing board until you do."**
  * [Difference between CRUD and REST](https://softwareengineering.stackexchange.com/questions/120716/difference-between-rest-and-crud): [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) means the basic operations to be done in a data repository. [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) operates on resource  representations (complex objects abstractions), each one identified by an URL. In short: **same thing, different layers** (CRUD falls within the Data Access layer while REST fits in the Business layer).
  * [Stateless vs Stateful](https://en.wikipedia.org/wiki/Stateless_protocol) protocols: there can be **complex interactions between stateful and stateless protocols** among **different protocol layers**. For example, HTTP is an example of a stateless protocol layered on top of TCP, a stateful protocol, which is layered on top of IP, another stateless protocol, which is routed on a network that employs BGP, another stateful protocol. Note: REST**ful** is state**less**.
