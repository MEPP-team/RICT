## How to install demos out of their integrated components<a name="top"></a>
The [UD-SV web based online demos](http://rict.liris.cnrs.fr/index.html) regroup a set of specific demos that illustrate various visualizations/applications on top city related data. Each such demo is achieved by integrating some ad-hoc subset of [free and open available software components](../Tools/Readme.md) (refer to the [architecture](../UD-Doc/Architecture/Readme.md)).

The following documentation considers each specific demo and for each one explains
  - **which required components** should be installed: **don't install all the components** but stick to the _SUBSET_ required for the demo you are trying to replicate (taken among [all the available components](../Tools/Readme.md))
  - **how to install such components** and
  - **how to assemble/integrate such components** in order to obtain a fully functionnal demo

Once your chosen demo is installed feel free to experiment with it, extend it and/or customize it to suit your needs.

## Installing demos
### <a name="install-demo-udv-front-end"></a>[UD-Viz front end](../Tools/Readme.md#ComponentUD-Viz) (and no back end component)
 * What you get: something similar to [this demo of the UD-Viz front end](http://rict.liris.cnrs.fr/UDVDemo/UDV/UDV-Core/examples/DemoFull/Demo.html) that illustrates enables you to discover the front end features (e.g. [UD-Viz/Geocoding](../Tools/Readme.md#ComponentUD-VizGeocoding)). However, because you are not (yet) installing any of server-side components, you will **not** be able to use the features requiring some server-side document management (e.g. [Guided Tour](../Tools/Readme.md#ComponentUD-VizGuidedTour) or [Authentication](../Tools/Readme.md#ComponentUD-VizAuthentication)).
  * [Installation notes](https://github.com/MEPP-team/UD-Viz/blob/master/install.md)
  
### UD-Viz (front end) together with [UD-Serv/API_Enhanced_City](../Tools/Readme.md#ComponentUD-ServAPIEnhancedCity) (back-end)
 * What you get: 
   - you can [run demo this demo](http://rict.liris.cnrs.fr/UDVDemo/UDV/UDV-Core/examples/DemoFull/Demo.html) on your desktop i.e. you will be able to run **both client-side and server-side locally** (on your desktop) as opposed to the [UD-Viz front end previous install demo](#install-demo-udv-front-end) where only the client-side was deployed locally (and the server side was running online on UD-SV's demo server)
   - note that the server-side component uses a [PostGreSQL database](https://en.wikipedia.org/wiki/PostgreSQL) used to power components like Consult documentation, Guided Tour, Authentification, Documents to validate and Document Links_.
 * Installation: 
    - first follow [UD-Viz front end install notes](#install-demo-udv-front-end)
    - then [UD-Serv/API_Enhanced_City install notes](Readme.md#backend-udv-serverapi_enhanced_city-install-notes) that enable you to install some of the server-side components on your computer. 

---- FIXME
This step can be considered as a prerequisite for the next one.
Indeed, at this point, you have on your computer an infrastructure enabling you to run UD-Viz full demo, with the possibility to have a 3D view with documents (which should be added to your local database of course) etc.

However, you cannot visualize your own 3D objects yet.

To do so, you must begin with installing on your server, a specific database for 3D objects using the [PostGIS technology](https://postgis.net/). This database will enable you to store 3D data respecting the [_CityGML_](http://www.citygml.org/) format.

[Here](Install3DCityDB.md) is where you can find instructions for setting up the database and importing CityGML data into it. 

During your database setup, you might choose to use docker. 

For more information about [Docker](https://en.wikipedia.org/wiki/Docker_(software)) concepts, you can either have a look at the official website [here](https://www.docker.com/resources/what-container), or watch [this](https://www.youtube.com/watch?v=JSLpG_spOBM&t=328s) short youtube video.
---- FIXME

### Computing 3DTiles tilesets and web visualize them: 
[installation notes](InstallDemo3dTilesLyonViewer.md)
### Computing 3DTiles **temporal** tilesets and web visualize them:
[installation notes](InstallDemo3dTilesTemporalLyonViewer.md)
### [TBD](https://en.wikipedia.org/wiki/TBD_(disambiguation))
How to install (document) Enhanced City demo

## Installing [components](../Tools/Readme.md) 
 * Frontend 
   - [UD-Viz](../Tools/Readme.md#ComponentUD-Viz) web client: [install notes](https://github.com/MEPP-team/UD-Viz/blob/master/install.md) ([associated demos](http://rict.liris.cnrs.fr/UDVDemo-2/UDV/UDV-Core/))
 * Backend
   - [3DCityDB](../Tools/Readme.md#ComponentUD-Serv3DCityDB): [install notes](Install3DCityDB.md#top).
   - [CityTiler](../Tools/Readme.md#ComponentUD-ServCityTiler): [install notes](https://github.com/MEPP-team/py3dtiles/blob/Tiler/Tilers/CityTiler/Install.md) 
   - [UD-Serv/API_Enhanced_City](../Tools/Readme.md#ComponentUD-ServAPIEnhancedCity): [install notes](https://github.com/MEPP-team/UD-Viz-server/blob/master/API_Enhanced_City/INSTALL.md) 
   - [3DTiles Samples](../Tools/Readme.md#Component3DTilesSamples)(server):
     * <a name="backend-3dtiles-web-server-desktop-developing-context"></a>[DESKTOP developing context install notes](Install3dTilesNodeBasedWebServer.md) or 
     * <a name="backend-3dtiles-web-server-operations-stable-server-context"></a>[OPERATIONS (stable server) context install notes](InstallDebianApacheServer.md) ([Apache](https://en.wikipedia.org/wiki/Apache_HTTP_Server) http server based install notes).

