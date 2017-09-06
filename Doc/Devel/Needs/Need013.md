
# Need 013: Visualization of documents within a 3D representation of the city

### User story
As a historian I want to visualize and locate documents (images, videos, text...) in the 3d representation of the city. I need a preview of what the document is, and a visual indication of its position in the scene.

### Beneficiary role: 

### Impact: 

### Maturity:

### Cost evaluation:

### Tags or keywords
Document Visualization

### Description
There are several ways by which documents can be displayed in a 3D scene. The need can be fulfilled by billboards [1] integrated in the 3d representation of the city, anchored to the city object which is the subject of the document. Filtering/culling of the billboards may be needed to avoid cluttering. However [1] has been tested in a desktop environment and we also need to test this in a web environment.

There are two important aspects to be considered for every document for document visualization (including billboard display):
* Position and orientation of the document: In billboard display[1], we placed the document (image or document preview) exactly over the concerned city object (non-document city objects). There are other options, like in case of photographs, position the document on the point where the photograph was taken. Other important questions concerning document position:
  * How to automatically obtain document position from document references?
  * What's the position of a document when it refers one or more document objects.
  * How to orient the documents? Always face the camera or maintain a fixed orientation. In billboard display[1], document always faced the user/camera. We also tried to maintain a fixed orientation for documents, but we only had a partial view or almost no view of the document as we move around the 3D scene.
* Position and orientation of the camera (quaternion): In billboard display[1], we tried different camera positions, from very far from the city for panoramic city photographs to very close view to display closer view of city objects.

### References:
1. Visualization of Documented 3D Cities, Clément Chagnaud, John Samuel, Sylvie Servigne, Gilles Gesquière, Eurographics Workshop on Urban Data Modelling and Visualisation, UDMV 2016, Liège, Belgium, Decembre 8, 2016

