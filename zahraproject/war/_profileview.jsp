
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
<%! DatastoreService ds9 = DatastoreServiceFactory.getDatastoreService(); %>


<%! String uid6=null; %>
<%! String weight9="", country9="",  dob9="",  email9="",  datereg9="",  age9="",  appearance9="",  bestFeature9="",  birthdate9="",  birthdate_day9="",  birthdate_month9="",  birthdate_year9="",  blobkey9="",  bodyArt9="",  bodyStyle9="",  childrenHave9="",  childrenNumber9="",  childrenOldest9="",  childrenWant9="",  childrenYoungest9="",  cityLive9="",  complexion9="",  countryLive9="",  drink9="",  education9="",  employmentStatus9="",  englishAbility9="",  ethnicity9="",  eyeColor9="",  eyeWear9="",  facialHair9="",  firstName9="",  firstname9="",  gender9="",  hairColor9="",  hairLength9="",  hairType9="",  height9="",  homeType9="",  incomeBracket9="",  incomeCurrency9="",  languageSpoken9="",  lastName9="",  lastname9="",  livingSituation9="",  maritalStatus9="",  mobileno9="",  nationality9="",  occupation9="",  password9="",  petsHave9="",  polygamy9="",  profilebtn9="",  profileid9="",  religion9="",  relocate9="",  resetCurrency9="",  smoke9="",  starSign9="",  stateLive9="",  tribe9="",  userid9="",  username9=""; %>


<% // Get Entity
if(session.getAttribute("uid") != null) { uid6 = session.getAttribute("uid").toString(); }


if(request.getParameter("pid") != null) {
	int pid = Integer.parseInt(request.getParameter("pid"));
	
	try { Query q1 =  new Query("PROFILE");
	q1.addFilter("userid", Query.FilterOperator.EQUAL, pid);
	PreparedQuery pq = ds9.prepare(q1);
	Entity pn  = pq.asSingleEntity();
	profileid9 = pn.getKey().getId()+"";
	userid9 = pn.getProperty("userid").toString();

	blobkey9 = pn.getProperty("blobkey").toString();
	hairType9 = pn.getProperty("hairType").toString();
	eyeWear9 = pn.getProperty("eyeWear").toString();
	appearance9 = pn.getProperty("appearance").toString();
	weight9 = pn.getProperty("weight").toString();
	//userid9 = pn.getProperty("userid").toString();
	lastname9 = pn.getProperty("lastname").toString();
	hairColor9 = pn.getProperty("hairColor").toString();
	education9 = pn.getProperty("education").toString();
	maritalStatus9 = pn.getProperty("maritalStatus").toString();
	password9 = pn.getProperty("password").toString();
	//profileid9 = pn.getProperty("profileid").toString();
	religion9 = pn.getProperty("religion").toString();
	facialHair9 = pn.getProperty("facialHair").toString();
	username9 = pn.getProperty("username").toString();
	height9 = pn.getProperty("height").toString();
	polygamy9 = pn.getProperty("polygamy").toString();
	englishAbility9 = pn.getProperty("englishAbility").toString();
	drink9 = pn.getProperty("drink").toString();
	livingSituation9 = pn.getProperty("livingSituation").toString();
	gender9 = pn.getProperty("gender").toString();
	bodyStyle9 = pn.getProperty("bodyStyle").toString();
	occupation9 = pn.getProperty("occupation").toString();
	tribe9 = pn.getProperty("tribe").toString();
	childrenHave9 = pn.getProperty("childrenHave").toString();
	firstname9 = pn.getProperty("firstname").toString();
	complexion9 = pn.getProperty("complexion").toString();
	homeType9 = pn.getProperty("homeType").toString();
	smoke9 = pn.getProperty("smoke").toString();
	petsHave9 = pn.getProperty("petsHave").toString();
	mobileno9 = pn.getProperty("mobileno").toString();
	country9 = pn.getProperty("country").toString();
	hairLength9 = pn.getProperty("hairLength").toString();
	//profilebtn9 = pn.getProperty("profilebtn").toString();
	email9 = pn.getProperty("email").toString();
	eyeColor9 = pn.getProperty("eyeColor").toString();
	dob9 = pn.getProperty("dob").toString();
	languageSpoken9 = pn.getProperty("languageSpoken").toString();
	ethnicity9 = pn.getProperty("ethnicity").toString();
	employmentStatus9 = pn.getProperty("employmentStatus").toString();


	} catch(Exception e) { System.out.println("e="+e); }



}

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
String [] pn5 = {"appearance", "dob", "bodyStyle", "childrenHave", "complexion",  "drink", "education", "employmentStatus", "englishAbility", "ethnicity", "eyeColor", "eyeWear", "facialHair", "firstname", "gender", "hairColor", "hairLength", "hairType", "height", "homeType", "languageSpoken",  "lastname", "livingSituation", "maritalStatus", "mobileno", "country", "occupation", "password", "petsHave", "polygamy", "religion", "smoke", "userid", "username", "weight"};


for(String s: pn5) {
	Entity e1 = null;
	String pv = "";
	int ui2 = Integer.parseInt(uid6);
	try {
		Query q1 =  new Query("PROFILE");
		q1.addFilter("userid", Query.FilterOperator.EQUAL, uid6);
		PreparedQuery pq = ds9.prepare(q1);
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