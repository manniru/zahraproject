
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Cursor"%>
<%@page  import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>


<% // Get Entity
/**
if(request.getParameter("pid") != null) {
	int pid = Integer.parseInt(request.getParameter("pid"));
	
	try { Query q1 =  new Query("PROFILE");
	q1.addFilter("userid", Query.FilterOperator.EQUAL, pid);
	PreparedQuery pq = ds.prepare(q1);
	Entity pn  = pq.asSingleEntity();
	profileid = pn.getKey().getId()+"";
	userid = pn.getProperty("userid").toString();

	blobkey = pn.getProperty("blobkey").toString();
	hairType = pn.getProperty("hairType").toString();
	eyeWear = pn.getProperty("eyeWear").toString();
	appearance = pn.getProperty("appearance").toString();
	weight = pn.getProperty("weight").toString();
	//userid = pn.getProperty("userid").toString();
	lastname = pn.getProperty("lastname").toString();
	hairColor = pn.getProperty("hairColor").toString();
	education = pn.getProperty("education").toString();
	maritalStatus = pn.getProperty("maritalStatus").toString();
	password = pn.getProperty("password").toString();
	//profileid = pn.getProperty("profileid").toString();
	religion = pn.getProperty("religion").toString();
	facialHair = pn.getProperty("facialHair").toString();
	username = pn.getProperty("username").toString();
	height = pn.getProperty("height").toString();
	polygamy = pn.getProperty("polygamy").toString();
	englishAbility = pn.getProperty("englishAbility").toString();
	drink = pn.getProperty("drink").toString();
	livingSituation = pn.getProperty("livingSituation").toString();
	gender = pn.getProperty("gender").toString();
	bodyStyle = pn.getProperty("bodyStyle").toString();
	occupation = pn.getProperty("occupation").toString();
	tribe = pn.getProperty("tribe").toString();
	childrenHave = pn.getProperty("childrenHave").toString();
	firstname = pn.getProperty("firstname").toString();
	complexion = pn.getProperty("complexion").toString();
	homeType = pn.getProperty("homeType").toString();
	smoke = pn.getProperty("smoke").toString();
	petsHave = pn.getProperty("petsHave").toString();
	mobileno = pn.getProperty("mobileno").toString();
	country = pn.getProperty("country").toString();
	hairLength = pn.getProperty("hairLength").toString();
	//profilebtn = pn.getProperty("profilebtn").toString();
	email = pn.getProperty("email").toString();
	eyeColor = pn.getProperty("eyeColor").toString();
	dob = pn.getProperty("dob").toString();
	languageSpoken = pn.getProperty("languageSpoken").toString();
	ethnicity = pn.getProperty("ethnicity").toString();
	employmentStatus = pn.getProperty("employmentStatus").toString();


	} catch(Exception e) { System.out.println("e="+e); }



}
*/
%>
<script src="./profile_files/jquery.ui.core.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.ui.position.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.ui.widget.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.ui.dialog.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.ui.button.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.qtip.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.validate.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.jscrollpane.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.mousewheel.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.cookie.min.js" type="text/javascript"></script>

<script src="./profile_files/jquery.thickbox.js" type="text/javascript"></script>

<script src="./profile_files/profile.js" type="text/javascript"></script>

<script src="./profile_files/launchEmailWidget.js" type="text/javascript"></script>



<link type="text/css" rel="stylesheet" href="./profile_files/global.css">


		
<link rel="stylesheet" type="text/css" media="all" href="./profile_files/jquery.ui.all.css">

<link rel="stylesheet" type="text/css" media="all" href="./profile_files/jquery.ui.dialog.css">

<link rel="stylesheet" type="text/css" media="all" href="./profile_files/jquery.jscrollpane.css">

<link rel="stylesheet" type="text/css" media="all" href="./profile_files/jquery.thickbox.css">

<link type="text/css" rel="stylesheet" href="./profile_files/profile.css">





<script async="" type="text/javascript" src="./profile_files/pubads_impl_27.js"></script>


    <div id="main" class="clearfix"><div id="main2">
            <div class="inner">
             
<h1 class="title">Profile Page</h1>
<div class='tabs'><ul class='tabs primary'>
					<li><a href='?p=account'>My Account</a></li>
					<li><a href='?p=profileedit'>Profile Edit</a></li>
					<li class='active'><a href='?p=profileview'>Profile View</a></li>
					</ul></div>
					
<div class="profile2"><!--profileleft-->
	
	<div id="profile-main" style="display:block;">

		<div id="profiledetail">
			




<table width="100%" border="0" cellpadding="0" cellspacing="0" id="table">

<tbody>



				
<%


%>
<tr><td id="profiledetailhdr2" align="left" colspan="5"><em>Profile Information</em></td></tr>

<%


for(String s: pn2) {
	Entity e1 = null;
	String pv = "";
	int ui2 = Integer.parseInt(uid);
	try {
		Query q1 =  new Query("PROFILE");
		q1.addFilter("userid", Query.FilterOperator.EQUAL, uid);
		PreparedQuery pq = ds.prepare(q1);
		e1  = pq.asSingleEntity();			
				
	//Key ky = KeyFactory.createKey("PROFILE", 1);
	//e1 = ds.get(ky);
	//blobkey = e1.getProperty("blobkey").toString();

	} catch(Exception e) { System.out.println(e); }
	

		try { pv = e1.getProperty(s).toString(); } catch(Exception e4) { }
	//	}
	out.println("<tr><td id='td1' width='30%' align='left' class='beige'>"+s.toUpperCase()+":</td>"+
			"<td id='td1' width='50%' class='ag_23'>"+pv+"</td></tr>");
}
%>
					
                        
			</tbody></table>
			
			<div class="clear"></div>
		</div>
		<!--profiledetail-->
		<!--profiletext--><!--profiletext-->

		
	</div>
	<!--profiledetail-->
	
	
	

	
    
	<div class="clear"></div>
	
	<!--profiletext-->
	
</div>


</div>
    </div></div>