<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Map" %>

<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<%
/**
if(request.getParameter("upload") != null) {
	System.out.println("upload clicked!");
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	String uid = request.getParameter("uid");

    Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(request);
    BlobKey blobKey = blobs.get("myFile");
    
    
	Entity en = new Entity("USERS");
	en.setProperty("picid", "mm");
	ds.put(en);
	
  System.out.println(blobKey.getKeyString());

    if (blobKey == null) { response.sendRedirect("/"); } 
    else { response.sendRedirect("/serve?blob-key=" + blobKey.getKeyString()); }
	
}
*/
%>


<div id='main' class='clearfix'><div id='main2'>
            <div class='inner'>
               <h1 class='title'>User picture upload</h1>
                         

<form action='<%= blobstoreService.createUploadUrl("/upload?uid="+uid) %>' method='post' enctype='multipart/form-data'>
          <table width='451' border='1'>
            <tr><td>User ID:</td><td><input name='userid' type='text' id='userid' value='<%= uid %>'></td></tr>

            <tr>
              <td>&nbsp;</td>
              <td><input type='file' name='myFile'></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><input type='submit' name='upload' value='Upload'></td>
            </tr>
          </table>
        </form>
    </div>
    </div></div>