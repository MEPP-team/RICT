## Install iTowns
 
After you install iTowns go on the file pointsCloud.js

## How to import data in iTowns

We take an example the island of Zanzibar, data from a drone.
you can download this [here](www.google.com)

We have 3 types of data 
 - Points Cloud in multiple [.las](http://desktop.arcgis.com/en/arcmap/10.3/manage-data/las-dataset/what-is-a-las-dataset-.htm) 
 - Orthophoto: multi image in .tif with .tfw for information
 - Elevation: multi image in .tif with .tfw for information
 

### Points Cloud 

  You have to install [Potree Converter](https://github.com/potree/PotreeConverter), when you have this 
create a new folder, put the folder point_cloud from Zanzibar file (*.las) .

Write this in the new folder in your console:
```` PotreeConverter Zanzibar/Las/* -o Zanzibar/ --material RGB ````
(It can take time like ~2 3 min)

Now in your folder you should have that: (the format potree) 

<img src="../Image/tutoOpenData_folder.png" width="645" height="100" />

Copy the folder data temp cloud.js and sources.json in 3d-tiles-sample/tileset/Zanzibar/

In iTowns: 

Open the pointcloud.html, change the url [here](https://github.com/iTowns/itowns/blob/master/examples/pointcloud.html#L105)
with
````http://localhost:8003/tilesets/Zanzibar/cloud.js ````

Now you should have that: 

<img src="../Image/ZanzibarPointCloud.png"/>

### Orthophoto and Elevation

#### Geoserver 

[install geoserver](http://docs.geoserver.org/stable/en/user/installation/linux.html) 

If it's not working try with this command:

````GEOSERVER_HOME=/usr/share/geoserver````
 
After that, go on this file /usr/share/geoserver/geoserver-2.11.2/webapps/geoserver/WEB-INF/
you should have web.xml, open this and change 
````
<!-- Uncomment following filter to enable CORS -->
<filter>
  <filter-name>cross-origin</filter-name>
     <filter-class>org.eclipse.jetty.servlets.CrossOriginFilter</filter-class>
  </filter>
````

and

````
<!-- Uncomment following filter to enable CORS -->
<filter-mapping>
    <filter-name>cross-origin</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
````


#### iTowns




