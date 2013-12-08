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

<%@ page import="org.joda.time.DateMidnight"%>
<%@ page import="org.joda.time.DateTime"%>
<%@ page import="org.joda.time.Years"%>

<%! String username1="", blobkey1="",dob1="",mobileno1="",gender1="",email1="",occupation1="",country1=""; %>
<%! String uid5=null; %>
<%! int age5=0; %>

<%! DatastoreService ds5 = DatastoreServiceFactory.getDatastoreService(); %>

<% if(session.getAttribute("uid") != null) { uid5 = session.getAttribute("uid").toString(); } %>

<%
out.println("<div style='margin-left:200px; '><h1 class='title'>Search Members</h1></div>");

if(request.getParameter("fl") != null && request.getParameter("w") != null) {
	String fl = request.getParameter("fl");
	String w = request.getParameter("w");
	
	//int pid = Integer.parseInt(request.getParameter("pid"));

		
	try { 
		Query q1 =  new Query("PROFILE");
		q1.addFilter(fl, Query.FilterOperator.EQUAL, w);
		PreparedQuery pq = ds5.prepare(q1);
		Entity e1  = pq.asSingleEntity();	
		
		//Key ky = KeyFactory.createKey("PROFILE", pid);
	//Entity e1 = ds.get(ky);
	username1 = e1.getProperty("username").toString();
	blobkey1 = e1.getProperty("blobkey").toString();
	dob1 = e1.getProperty("dob").toString();
	mobileno1 = e1.getProperty("mobileno").toString();
	gender1 = e1.getProperty("gender").toString();
	email1 = e1.getProperty("email").toString();
	occupation1 = e1.getProperty("occupation").toString();
	country1 = e1.getProperty("country").toString();
	
	String[] ag = dob1.split("/");
	int yr = Integer.parseInt(ag[2]);
	int mn = Integer.parseInt(ag[0]);
	int dy = Integer.parseInt(ag[1]);
	
	
	age5 = getAge2(yr, mn, dy);
	//out.println(dob);
	} catch(Exception e) { out.println(e); }
	
	
}

%>

















<head>







<title>KenyanCupid.com</title>
<link type="text/css" rel="stylesheet" href="search_list_files/global00.css">
            <link type="text/css" rel="stylesheet" href="search_list_files/memberco.css">
            <link type="text/css" rel="stylesheet" href="search_list_files/membercp.css">
            <link type="text/css" rel="stylesheet" href="search_list_files/memberhe.css">
            <link type="text/css" rel="stylesheet" href="search_list_files/memberla.css">
		


<link type="text/css" rel="stylesheet" href="search_list_files/searchre.css">




</head>
<body>
<script> 
				var chat_id = '207408'; 
				var chat_name = 'Muneer'; 
				var chat_avatar = 'http://cdn.kenyancupid.com/memphoto/Photo1/small/207408.jpg';
				var chat_link = '?p=profile/profileRedirect?memberid=207408'; 
				var chat_usergroup = '1';
				var chat_checksum = '999137CBD607AFD52C2C64056E5CDACF';
				var chat_lang = 'en';
			</script> 
			<link type="text/css" rel="stylesheet" href="search_list_files/277xcmcx.css">
			<script type="text/javascript" src="search_list_files/277xcmcx.js"></script>


			
			
			<div id="failedimmodal" style="display: none; margin:0px; padding:0px;"></div>
		

<script>dataLayer = [{
			'memberConversion': 'FALSE',
		
		'memberGender':'Male',
		'memberCountry':'157',
		'memberGrade':'Standard',
		'memberInDays':'26',
		'memberAge':'27',
		'memberEthnicity':'343',
	 	'memberID':'207408'
	}];</script>

<!-- Google Tag Manager include -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-8JZNN" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-8JZNN');</script>
<!-- End Google Tag Manager include -->












<div id="memberships" style="float:left;margin-right:2px;">
  <div class="standardview" style="width:300px">
<div class="standardinfo" style>
					
						<span class="memberpic">
					
	                        	<a href="?p=photoDisplay.cfm?mID=25333&amp;ph1=1&amp;ph2=1&amp;ph3=0&amp;ph4=0&amp;ph5=0&amp;searchposition=4&amp;searchtotal=11&amp;fname=Annie&amp;keepThis=true&amp;TB_iframe=true&amp;height=607&amp;width=700" name="Annie  -  30  -  Lagos, Nigeria" class="thickbox">
	                        
	                            <div class="photo">
                                   <p><%= uid5 %></p>
	                            </div>
	                    	</a>
	                    
	                        	<a href="?p=photoDisplay.cfm?mID=25333&amp;ph1=1&amp;ph2=1&amp;ph3=0&amp;ph4=0&amp;ph5=0&amp;searchposition=4&amp;searchtotal=11&amp;fname=Annie&amp;keepThis=true&amp;TB_iframe=true&amp;height=607&amp;width=700" name="Annie  -  30  -  Lagos, Nigeria" class="thickbox">
	                        
	                        <img src='/serve?blob-key=<%=blobkey1 %>' width='125px' height='136px' border='0' />
	                        </a>
						
					</span>
					<div class="text">
						<p class="hdg1">

	                    
	                    	<a href="?p=profile/showprofile/ID/25333?searchposition=4&amp;searchtotal=11"><%=username1%> (<%=age5%>)</a>
	                    
	                    </p>
				    <p>
				    	<strong>Country</strong> <%=country1 %><br>
					    <strong>Gender:</strong> <%=gender1 %><br>
				
					    <strong>Mobile No:</strong> <%=mobileno1 %><br>
					    <strong>Email:</strong> <%=email1 %><br>
					    <strong>Occupation:</strong> <%=occupation1 %><br>
					    
					    
					    
					    </p>
				      </div>
</div>
					</div>
  <div class="clear"></div>
</div>
</body>


</html>

<%! public int getAge2(int y, int m, int d) {
	DateMidnight birthdate = new DateMidnight(y, m, d);
	DateTime now = new DateTime();
	Years age = Years.yearsBetween(birthdate, now);		
	String ag = age+"";		
	int str = Integer.parseInt(ag.replaceAll("\\D+",""));		
	
	return str;
	
}
%>