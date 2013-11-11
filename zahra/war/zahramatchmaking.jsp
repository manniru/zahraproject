<script src="zahramatchmaking.js"></script>
<script type="text/javascript">
    function check_number()
    {
    var r_number = document.getElementById("code").value;
    var u_number =document.getElementById("userI").value;
    if(r_number==u_number)
    alert("Good!");
    else
    alert("no pal");
    }
    </script>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>


<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSetMetaData"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

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

<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.MalformedURLException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSetMetaData"%>

<%@ page import="org.joda.time.DateMidnight"%>
<%@ page import="org.joda.time.DateTime"%>
<%@ page import="org.joda.time.Years"%>


<%! public Connection cn = null; %>
<%
//Class.forName("org.apache.derby.jdbc.EmbeddedDriver").newInstance();
//try { cn = DriverManager.getConnection("jdbc:derby://localhost:1527/db", "admin", "13131"); } catch(SQLException e) { System.out.println(e); }
//try { cn = DriverManager.getConnection("jdbc:derby:db", "admin", "13131"); } catch(SQLException e) { System.out.println(e); }

%>

<%! String [] pn1 = {"userid", "username", "password", "firstname", "lastname", "mobileno", "gender", "age", "blobkey"}; 

String [] pn2 = {"appearance", "dob", "bodyStyle", "childrenHave", "complexion",  "drink", "education", "employmentStatus", "englishAbility", "ethnicity", "eyeColor", "eyeWear", "facialHair", "firstname", "gender", "hairColor", "hairLength", "hairType", "height", "homeType", "languageSpoken",  "lastname", "livingSituation", "maritalStatus", "mobileno", "country", "occupation", "password", "petsHave", "polygamy", "religion", "smoke", "userid", "username", "weight"};
%>

<%! String s_f="", s_w=""; //String profileid="", userid="", blobkey="", firstname="", gender="", lastname="", mobileno="", password="", username="", age="", photoid=""; %>
<%! String country="", dob="", email="", datereg="", age="", appearance="", bestFeature="", birthdate="", birthdate_day="", birthdate_month="", birthdate_year="", blobkey="", bodyArt="", bodyStyle="", childrenHave="", childrenNumber="", childrenOldest="", childrenWant="", childrenYoungest="", cityLive="", complexion="", countryLive="", drink="", education="", employmentStatus="", englishAbility="", ethnicity="", eyeColor="", eyeWear="", facialHair="", firstName="", firstname="", gender="", hairColor="", hairLength="", hairType="", height="", homeType="", incomeBracket="", incomeCurrency="", languageSpoken="", lastName="", lastname="", livingSituation="", maritalStatus="", mobileno="", nationality="", occupation="", password="", petsHave="", polygamy="", profilebtn="", profileid="", religion="", relocate="", resetCurrency="", smoke="", starSign="", stateLive="", tribe="", userid="", username="", weight=""; %>
<%! int age2=0; %>
<%! String path = "", date=""; %>
<% try { path = request.getParameter("p").substring(0, 8); } catch(Exception e1) { } %>

<%! String uid = null, user = null, srch = null, msg = ""; %>
<%! DatastoreService ds = DatastoreServiceFactory.getDatastoreService(); %>
<%! BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>
<%! String uploadurl = blobstoreService.createUploadUrl("/upload"); %>

<%! public String p = null; %><% if(request.getParameter("p") != null) {  p = request.getParameter("p"); } %>

<% 
Date dNow = new Date( ); 
SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/yyyy");
date = ft.format(dNow);
//System.out.println("date="+date);


if(session.getAttribute("uid") != null) { uid = session.getAttribute("uid").toString(); } 
if(session.getAttribute("user") != null) { user = session.getAttribute("user").toString(); }
if(request.getParameter("msg") != null ) { msg = request.getParameter("msg"); }
if(session.getAttribute("s_f") != null) { s_f = session.getAttribute("s_f").toString(); } 
if(session.getAttribute("s_w") != null) { s_w = session.getAttribute("s_w").toString(); } 
%>

<%! public String menus(String user) {
	//System.out.println("menus is "+ p);
	String a1="",a2="",a3="",a4="",a5="",a6="";
	if(p != null && p.equals("register")) { a1 = "class='menu active'"; }
	if(p != null && p.equals("members")) { a2 = "class='menu active'"; }
	if(p != null && p.equals("chatroom")) { a3 = "class='menu active'"; }
	if(p != null && p.equals("contactus")) { a4 = "class='menu active'"; }
	if(p != null && p.equals("aboutus")) { a5 = "class='menu active'"; }
	if(p == null) { a6 = "class='menu active'"; }
	String out = "<div id='primary'><ul class='links' id='navlist'>"+
			"<li  class='menu'><a href='?p=register' "+a1+" ><span>Registration</span></a></li>"+
			"<li  class='menu'><a href='?p=members' "+a2+"><span>Members</span></a></li>"+
			"<li  class='menu'><a href='?p=chatroom' "+a3+"><span>Chatroom</span></a></li>"+
			"<li  class='menu'><a href='?p=contactus' "+a4+"><span>Contact</span></a></li>"+
			"<li  class='menu'><a href='?p=aboutus' "+a5+"><span>About</span></a></li>"+
			"<li  class='last menu'><a href='/'  "+a6+"><span>Home</span></a></li>"+
			"</ul></div>";
			
	return out; }

%>

<%! public String loginblock(String user) {
	String out = "<div class='block2a'><div class='block2b'><div id='block-user-0' class='block block-user'><h2>User login</h2>"+
			"<div class='content'><form action='' method='post' id='user-login-form'>"+
			"<div class='form-item'><label>Username:</label><input type='text' name='user' id='user'  size='15' class='form-text' /></div>"+
			"<div class='form-item'><label>Password:</label><input type='password' name='pass' id='pass' size='15'  class='form-text' /></div>"+
			"<input type='submit' name='login' id='login' value='Log in'  class='form-submit' />"+
			"<div class='item-list'><ul><li><a href='?p=register'>Register new account</a></li>"+
			"</ul></div>"+
			"</form></div></div></div></div>";
			
	return out; }
%>

<%! public String navigation(String user) { String o1 = "";
	o1 +="<table>";
	Query q = new Query("USERS");
	PreparedQuery pq = ds.prepare(q); 
	int n=1;
    for (Entity result : pq.asIterable()) {
    	int id = Integer.parseInt(result.getKey().getId()+"");
       String username = (String) result.getProperty("username"); 
       String blobkey = "";
       try { blobkey = (String) result.getProperty("blobkey"); } catch(Exception e3) { System.out.println("navigation(): "+e3); }
      // System.out.println(id);
       o1 +="<tr><td><img src='/serve?blob-key="+blobkey+"' width='50' height='50' /></td></tr>"; 
       o1 +="<tr><td>"+username+"</td></tr>"; 
       n++;
	}
    o1 +="</table></div></div></div>";
    
	String out = "<div class='block2a'><div class='block2b'><div id='block-user-1' class='block block-user'>"+
"<h2>eMatchMaking</h2>"+
"<div class='content'>"+


"<table width='100%' border='1'>"+
"<tr align='center'><td colspan='5'><div id='d1'>Top 10 People Match Percent</div></td></tr><tr align='center'>";

int rn = (int)Math.floor(Math.random()*1000000000+1);
String rnn = rn+"";
String rp = rnn.substring(0, 4);
     
    // String str = "AMIT";  
     String [] ar = rp.split("");
     for(String s: ar) {
     	int nu = 1;
     	try {  nu = Integer.parseInt(s); } catch(Exception e) { }     	
    	String blobkey="";
    	try {
    	Key ky = KeyFactory.createKey("USERS", nu);
    	Entity en = ds.get(ky);
    	blobkey = en.getProperty("blobkey").toString();
    	
    	} catch(Exception e3) {  }
    	//System.out.println("bb="+blobkey);
    	//if(blobkey.equals("")) { }
    	//else {  }
    	//out +="<td><a href='?q=members/1'><img src='images/nophoto.jpg' width='50' height='50' /></a></td>";
    	out +="<td><img src='/serve?blob-key="+blobkey+"' width='50' height='50' /></td>";
     }



//for(int a=1;a<=5;a++) {

//}

		
out +="</tr>"+
///"<tr align='center'>"+
///"  <td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td>"+
///"</tr>"+
"<tr align='center'>";

//int rn2 = (int)Math.floor(Math.random()*10000+1);
//String rp2 = rn2+"";
 String rp2 = rnn.substring(4, 8);    
    // String str = "AMIT";  
     String [] ar2 = rp2.split("");
     for(String s: ar2) {
     	int nu = 1;
     	try {  nu = Integer.parseInt(s); } catch(Exception e) { }     	
    	String blobkey="";
    	try {
    	Key ky = KeyFactory.createKey("USERS", nu);
    	Entity en = ds.get(ky);
    	blobkey = en.getProperty("blobkey").toString();
    	} catch(Exception e4) { System.out.println(e4); }
    	out +="<td><img src='/serve?blob-key="+blobkey+"' width='50' height='50' /></td>";
     }		

		
out +="</tr>"+
///"<tr align='center'>"+
///"  <td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td>"+
///"</tr>"+
"</table>"+



"<ul class='menu'>"+
"</ul></div></div></div></div>"+

"<div class='block2a'><div class='block2b'><div id='block-user-3' class='block block-user'><h2>Search Member</h2>"+
"<div class='content'>There are currently <em>1 user</em> and <em>0 guests</em> online.<div class='item-list'>"+
"<h3>Online users</h3><ul><li>admin</li></ul></div></div>"+
"</div></div></div>";
			
	return out; }
%>

<%! public String homepage(String user) {
	String out = "<div id='main' class='clearfix'><div id='main2'><div class='inner'><h1 class='title'>Home</h1>"+
			"<div class='node'><div class='node2'><div class='taxonomy'></div></div><span class='clear'></span>"+
			"<div class='content'>"+
			"<p class='style7'>Welcome to On line Match Making System<br /> Centre for Social Networking and matrimonial Services.<br />"+
			"ematchmaking.com, the world's oldest and most successful matrimonial service, has been trusted since 1996 by people in nigeria to help them find their soulmates. Today, hundreds of thousands of people have met their life partners through our revolutionary matchmaking service and countless others have made some very special friends. Since then we have created a world renowned service that has touched the lives of millions of people all over the world. We have, however, never rested on our laurels.</p>"+
			"<p class='style4'><img src='p1_files/pic10000.jpg' width='644' height='319' /><br />"+
			"<img src='p1_files/pic20000.jpg' width='644' height='327' /></p></div>"+
			"</div></div></div></div>";
			
	return out; }
%>





<%! protected int count(String kind) { 
                Query query = new Query(kind); 
                PreparedQuery preparedQuery = ds.prepare(query); 
                return preparedQuery.countEntities(); 
        }
%>

<%! public String adminmenu(String user) {
	String out = "<div class='block2a'><div class='block2b'><div id='block-block-6' class='block block-block'>"+
			"<h2>eMatchMaking</h2><div class='content'>"+

			"<ul>"+
			  "<li><a href='?p=account'>My Account</a></li>"+
			  "<li><a href='?p=upload'>Upload Picture</a></li>"+
			 // "<li><a href='?p=profile'>Profile Registration</a></li>"+
			  "<li><a href='?p=search'>Search Users</a></li>"+
			  "<li><a href='members'>Members Records</a></li>"+
			  "<li><a href='#'>Settings</a></li>"+
			  "</li>"+
			"</ul>"+
			"<font color='white'><br>No. of Registered users:37<br>No. of users with pic:18<br>No. of users no pic:19 </font></div>"+
			"</div></div></div>";
			
	return out; }

%>

<%! public String usermenu(String user) { int uid2=1;
	try { uid2 = Integer.parseInt(uid); } catch(Exception e4) { }
	String username="", pword="", fname="", lname="", mobileno="", blobkey="";
	try {
	Key ky = KeyFactory.createKey("USERS", uid2);
	Entity en = ds.get(ky);
	username = en.getProperty("username").toString();
	pword = en.getProperty("password").toString();
	fname = en.getProperty("firstname").toString();
	lname = en.getProperty("lastname").toString();
	mobileno = en.getProperty("mobileno").toString();
	blobkey = en.getProperty("blobkey").toString();
	//System.out.println("ent="+en.getProperty("username"));
	} catch(Exception e) { System.out.println("e:usernamenu()"); }
	
	String out = "<div class='block2a'><div class='block2b'><div id='block-block-6' class='block block-block'>"+
			"<h2>Welcome "+user+"</h2><div class='content'>"+
			"<div align='center' ><img src='/serve?blob-key="+blobkey+"' width='130' height='150' /></div>"+
			"<ul>"+
			  "<li><a href='?p=account'>My Account</a></li>"+
			  "<li><a href='?p=upload'>Upload Picture</a></li>"+
			//"<li><a href='?p=profile'>Profile Registration</a></li>"+
			"<li><a href='?p=profileedit'>Edit Profile</a></li>"+
			"<li><a href='?p=profileview'>View Profile</a></li>"+
			"<li><a href='?p=search'>Search Users</a></li>"+
			"<li><a href='?p=videochat'>Video Chat</a></li>"+
			  "<li><a href='?p=logout'>Log out</a></li>"+
			  "</li>"+
			"</ul>"+
		//	"<font color='white'><br>No. of Registered users:37<br>No. of users with pic:18<br>No. of users no pic:19 </font>"+
			"</div></div></div></div>";
			
	return out; }

%>

<%! public String register(String user) {
	String out = "<div id='main' class='clearfix'><div id='main2'><div class='inner'>"+
			"<h1 class='title'>User Registration</h1>"+

			"<form action=''  accept-charset='UTF-8' method='post' id='user-register'>"+
			"<div class='form-item'><label>Username:</label><input type='text' name='username' id='username'  value='' class='form-text' /></div>"+
			"<div class='form-item'><label>Password:</label><input type='password' name='password' id='password' class='form-text' /></div>"+
			"<div class='form-item'><label>First Name:</label><input type='text' name='firstname' id='firstname'  value='' class='form-text' /></div>"+
			"<div class='form-item'><label>Last Name:</label><input type='text' name='lastname' id='lastname'  value='' class='form-text' /></div>"+
			"<div class='form-item'><label>Email Address:</label><input type='text' name='email' id='email'  value='' class='form-text' /></div>"+
			"<div class='form-item'><label>Mobile No:</label><input type='text' name='mobileno' id='mobileno'  value='' class='form-text' /></div>"+
			"<div class='form-item'><label>Date of Birth:</label><input type='text' name='dob' id='dob'  value='' class='form-text' /></div>"+
			"<div class='form-item'><input type='hidden' name='datereg' id='datereg'  value='"+date+"'/></div>"+
			"<div class='form-item'><label>Gender</label><select name='gender' id='gender'>"+
			"<option value='Male'>Male</option><option value='Female'>Female</option></select></div>";
	/**		
			"<div class='form-item'><label>Age</label><select name='age' id='age'>";
			for(int y=18;y<=100;y++) { out +="<option value='"+y+"'>"+y+"</option>"; }
			//"<option value='Male'>Male</option><option value='Female'>Female</option>"+
			
			out +="</select></div>";
	*/		
		    Random Generator = new Random();
		    int r = Generator.nextInt(10000);
		    
		    out +="<h3>Security code: "+r+"</h3><input id='code1' name='code1' type='hidden' value='"+r+"' />";
		    
		    out +="<div class='form-item'><label>Enter Code:</label><input type='text' name='code2' id='code2'  class='form-text' /></div>";
		    //out +="<input type='button' value='Check' onclick='check_number();' />";

			
			out +="<input type='submit' name='signup' id='signup' value='Create new account'  class='form-submit' />"+
			"</form></div></div></div>";
			
	return out; }
%>

<% // SIGNUP, LOGIN, LOGOUT
if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("logout")) {
	System.out.println("Logout cliked!");
	session.setAttribute("uid", null); session.setAttribute("user", null);
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "/");
}

if(request.getParameter("signup") != null) { int id=1;
String code1 = request.getParameter("code1");
String code2 = request.getParameter("code2");
if(code1.equalsIgnoreCase(code2)) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String mobileno = request.getParameter("mobileno");
	String gender = request.getParameter("gender");
	String dob = request.getParameter("dob");
	String datereg = request.getParameter("datereg");
	
	if(request.getParameter("userid") != null) { 
		String userid = request.getParameter("userid");
		id = Integer.parseInt(userid);
		}
	else { id = count("USERS")+1;} //System.out.println("Key="+id);
	Entity en = new Entity("USERS",id);
	en.setProperty("username", username);
	en.setProperty("password", password);
	en.setProperty("mobileno", mobileno);
	en.setProperty("firstname", firstname);
	en.setProperty("lastname", lastname);
	en.setProperty("gender", gender);
	en.setProperty("dob", dob);
	en.setProperty("email", email);
	en.setProperty("datereg", datereg);
	ds.put(en);
	
	session.setAttribute("uid", id);
	session.setAttribute("user", username);
	
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/?p=account&uid="+id);
	
	}
else {
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/?p=register&msg=INVALID SECURITY CODE");
}
	
}

if(request.getParameter("login") != null) {
	System.out.println("Log in");

	String user1 = request.getParameter("user");
	String pass1 = request.getParameter("pass");
	System.out.println("Submited values: "+"user1="+user1+" pass1="+pass1);
		try {
			Query q1 =  new Query("USERS");
			q1.addFilter("username", Query.FilterOperator.EQUAL, user1);
			q1.addFilter("password", Query.FilterOperator.EQUAL, pass1);
			PreparedQuery pq = ds.prepare(q1);
			Entity pn  = pq.asSingleEntity();			
			String user2 = pn.getProperty("username").toString();
			String pass2 = pn.getProperty("password").toString();
			uid = pn.getKey().getId()+"";
			
			session.setAttribute("uid", uid);		//System.out.println("Session: userid="+session.getAttribute("userid"));
			session.setAttribute("user", user2);
			session.setAttribute("pass", pass2);
			System.out.println("New Session: "+"userid="+session.getAttribute("uid")+
					" user="+session.getAttribute("user")+", pass="+session.getAttribute("pass"));
			
			//	
			response.setHeader("Location", "/?p=account&uid="+uid);
			} catch(NullPointerException exp) {
				
				System.out.println("Invalid Username or Password!");
			//	response.setStatus(response.SC_MOVED_TEMPORARILY); 
			//	response.setHeader("Location", "/?msg=Invalid Username or Password!");
				
			}
}
%>

<%! public String account(String user) {
	
	int uid2 = Integer.parseInt(uid);
	String username="", pword="", fname="", lname="", mobileno="", gender="", dob="", blobkey="", email="", datereg="";
	String userid="";
	try { Key ky = KeyFactory.createKey("USERS", uid2);
	Entity en = ds.get(ky);
	username = en.getProperty("username").toString();
	pword = en.getProperty("password").toString();
	fname = en.getProperty("firstname").toString();
	lname = en.getProperty("lastname").toString();
	email = en.getProperty("email").toString();
	mobileno = en.getProperty("mobileno").toString();
	gender = en.getProperty("gender").toString();
	dob = en.getProperty("dob").toString();
	datereg = en.getProperty("datereg").toString();
	blobkey = en.getProperty("blobkey").toString();
	//System.out.println("ent="+en.getProperty("username"));
	} catch(Exception e) { System.out.println("e:account()"); }
	
	
	try {
		Query q1 =  new Query("PROFILE");
		q1.addFilter("userid", Query.FilterOperator.EQUAL, uid);
	PreparedQuery pq = ds.prepare(q1);
	Entity pn  = pq.asSingleEntity();			
	userid = pn.getProperty("userid").toString();
	System.out.println(userid);
	//uid = pn.getKey().getId()+"";
	} catch(Exception e) { System.out.println("e="+e); }

	


	String out = "<div id='main' class='clearfix'><div id='main2'><div class='inner'>"+
			"<h1 class='title'>Welcome "+user+"</h1>";
			
	if(blobkey.equals("")) {out +="<div style='font-size:15px; color:#FF0000'><strong>Your Profile is not complete,<a href='?p=upload'>"+
					" click here to upload your picture! </a></strong></div><br />";}
	
	if(userid.equals("")) {out +="<div style='font-size:15px; color:#FF0000'><strong>Your Profile is not complete,<a href='?p=profileedit'>"+
			" click here to complete your profile! </a></strong></div><br/ >";}
					
			out +="<div class='tabs'><ul class='tabs primary'>"+
			"<li class='active'><a href='?p="+p+"' class='active'>View</a></li>"+
			"<li><a href='?p="+p+"/edit'>Edit Account</a></li>"+
			"<li><a href='?p=profileedit'>Edit Profile</a></li>"+
			"<li><a href='?p=profileview'>View Profile</a></li>"+
			"</ul></div><div class='profile'><table>"+
			"<tr><td>User ID: <b>"+uid+"</b></td></tr>"+
			"<tr><td>Username: <b>"+user+"</b></td></tr>"+
			"<tr><td>Password: <b>"+pword+"</b></td></tr>"+
			"<tr><td>Firstname: <b>"+fname+"</b></td></tr>"+
			"<tr><td>Lastname: <b>"+lname+"</b></td></tr>"+
			"<tr><td>Email Address: <b>"+email+"</b></td></tr>"+
			"<tr><td>Mobile No: <b>"+mobileno+"</b></td></tr>"+
			"<tr><td>Gender: <b>"+gender+"</b></td></tr>"+
			"<tr><td>Date of Birth: <b>"+dob+"</b></td></tr>"+
			"<tr><td>Date Registered: <b>"+datereg+"</b></td></tr>"+
			"</table></div></div></div></div>";
			
	return out; }
%>

<%! public String editaccount(String user) {
	int uid2 = Integer.parseInt(uid);
	String userid="", username="", pword="", fname="", lname="", mobileno="", gender="", age="";
	try {
	Key ky = KeyFactory.createKey("USERS", uid2);
	Entity en = ds.get(ky);
	userid = en.getKey().getId()+"";
	username = en.getProperty("username").toString();
	pword = en.getProperty("password").toString();
	fname = en.getProperty("firstname").toString();
	lname = en.getProperty("lastname").toString();
	mobileno = en.getProperty("mobileno").toString();
	gender = en.getProperty("gender").toString();
	age = en.getProperty("age").toString();
	//System.out.println("ent="+en.getProperty("username"));
	} catch(Exception e) { System.out.println("e:editaccount()"); }
	
	String out = "<div id='main' class='clearfix'><div id='main2'><div class='inner'><div class='breadcrumb'><a href='/'>Home</a></div>"+
			"<h1 class='title'>Edit Account</h1><div class='tabs'><ul class='tabs primary'>"+
					"<li><a href='?p=account' class='active'>View</a></li>"+
					"<li class='active'><a href='?p="+p+"/edit'>Edit Account</a></li>"+
					"<li><a href='?p=profileedit'>Edit Profile</a></li>"+
					"<li><a href='?p=profileview'>View Profile</a></li>"+
					"</ul></div>"+

			"<form action=''  accept-charset='UTF-8' method='post' id='user-register'>"+
			"<div class='form-item'><label>UserID:</label><input type='text' name='userid' id='userid'  value='"+userid+"' class='form-text' /></div>"+
			"<div class='form-item'><label>Username:</label><input type='text' name='username' id='username'  value='"+username+"' class='form-text' /></div>"+
			"<div class='form-item'><label>Password:</label><input type='password' name='password' id='password' value='"+pword+"' class='form-text' /></div>"+
			"<div class='form-item'><label>First Name:</label><input type='text' name='firstname' id='firstname'  value='"+fname+"' class='form-text' /></div>"+
			"<div class='form-item'><label>Last Name:</label><input type='text' name='lastname' id='lastname'  value='"+lname+"' class='form-text' /></div>"+
			"<div class='form-item'><label>Mobile No:</label><input type='text' name='mobileno' id='mobileno'  value='"+mobileno+"' class='form-text' /></div>"+

			"<div class='form-item'><label>Gender</label><select name='gender' id='gender'>"+
			"<option value='Male'>Male</option><option value='Female'>Female</option></select></div>"+
			
			"<div class='form-item'><label>Age</label><select name='age' id='age'>";
			for(int y=18;y<=100;y++) { out +="<option value='"+y+"'>"+y+"</option>"; }
			//"<option value='Male'>Male</option><option value='Female'>Female</option>"+
			
			out +="</select></div>";
			
			out +="<input type='submit' name='signup' id='signup' value='Create new account'  class='form-submit' />"+
			"</form></div></div></div>";
			
	return out; }
%>


<%! public String members(String user) { String out="";


	out +="<div id='main' class='clearfix'><div id='main2'><div class='inner'><h1 class='title'>List of Members</h1>";
	
	int no=1;
	out +="<table>";
	for(int a=1;a<=5;a++) {
		out +="<tr>";
		for(int b=1;b<=4;b++) {
			System.out.println("hoto="+img(no));
			if(img(no).equalsIgnoreCase("nophoto.jpg")) {
				out +="<td><a href='?q=members/1'><img src='images/nophoto.jpg' width='130' height='150' /></a></td>";
			}
			else { out +="<td><a href='?q=members/1'><img src='/serve?blob-key="+img(no)+"' width='130' height='150' /></a></td>"; }
			no++;
		}
		out +="</tr>";
	}
	no++;
	
	out +="</table>";

    out +="</div></div></div>";
  return out;  
}    
    %>

<%! public String img(int id) {
	String blobkey="";
	try {
	Key ky = KeyFactory.createKey("USERS", id);
	Entity en = ds.get(ky);
	blobkey = en.getProperty("blobkey").toString();
	} catch(Exception e3) { blobkey="nophoto.jpg"; }
	if(blobkey.equals("")) { blobkey="k6ypPgujgPZP-ynqz--t6w"; }
	return blobkey;
}

%>

<%! public String search(String user) { String out="";
	String [] sb = {"username","country","firstname","lastname","gender","age","mobileno","email"};

	out +="<div id='main' class='clearfix'><div id='main2'><div class='inner'><h1 class='title'>Search Members</h1>";
	
	out +="<form id='form1' name='form1' method='get' action=''>Search User By:<label>";
	out +="<input name='p' type='hidden' id='hiddenField' value='searchlist' />";
	
			
	out +=  "<select name='fl' id='fl'><option value='--' >-Select-</option>";
	  
	  for(String st: sb) { out +="<option value='"+st+"' >"+st+"</option>"; }
    

    
   out += "</select>"+
"</label>=<label><input type='text' name='w' id='w' /></label>"+
"<label><input type='submit' name='search' id='search' value='Search' /><br />"+
"<span class='style1'>Search is case sensitive!</span></label></form>";

	
	int no=1;
	
if(srch!=null)	{
	///String wd = session.getAttribute("w");
	out +="<table>";
///	for(int a=1;a<=5;a++) {
		out +="<tr>";
		///for(int b=1;b<=4;b++) {
			out +="<td><a href='?p=profileview&uid="+user+"'><img src='/serve?blob-key="+srch+"' width='130' height='150' /></a></td>";
			no++;
	///	}
		out +="</tr>";
	///}
	no++;
	
	out +="</table>";
}	
	

    out +="</div></div></div>";
  return out;  
}    
    %>

<%
/**
if(request.getParameter("search") != null) {
	String tp = request.getParameter("tp");
	String fl = request.getParameter("fl");
	String w = request.getParameter("w");
	
	out.println("Searches1:"+tp+":"+fl+"="+w);

	try {
	Query q1 =  new Query(tp);
	q1.addFilter(fl, Query.FilterOperator.EQUAL, w);
	PreparedQuery pq = ds.prepare(q1);
	Entity pn  = pq.asSingleEntity();			
	String usr = pn.getProperty("username").toString();
	System.out.println("nasamo="+usr);
	uid = pn.getKey().getId()+"";
	} catch(Exception e4) { System.out.println(e4); }
    /**
	

}
*/
%>


<%! public String message(String msg) { int uid2=1;
	try { uid2 = Integer.parseInt(uid); } catch(Exception e4) { }
	String username="", pword="", fname="", lname="", mobileno="", blobkey="";
	try {
	Key ky = KeyFactory.createKey("USERS", uid2);
	Entity en = ds.get(ky);
	username = en.getProperty("username").toString();
	pword = en.getProperty("password").toString();
	fname = en.getProperty("firstname").toString();
	lname = en.getProperty("lastname").toString();
	mobileno = en.getProperty("mobileno").toString();
	blobkey = en.getProperty("blobkey").toString();
	//System.out.println("ent="+en.getProperty("username"));
	} catch(Exception e) { System.out.println("e:message()"); }
	
	String out = "<div class='block2a'><div class='block2b'><div id='block-block-6' class='block block-block'>"+
			"<h2>My Account : "+user+"</h2><div class='content'>"+
			"<div align='center' ><img src='/serve?blob-key="+blobkey+"' width='130' height='150' /></div>"+
			"<ul>"+
			  "<li><a href='?p=account'>My Account</a></li>"+
			  "<li><a href='?p=upload'>Upload Picture</a></li>"+
			"<li><a href='?p=profile'>Profile Registration</a></li>"+
			"<li><a href='?p=profileedit'>Edit Profile</a></li>"+
			"<li><a href='?p=profileview'>View Profile</a></li>"+
			"<li><a href='?p=search'>Search Users</a></li>"+
			"<li><a href='?p=videochat'>Video Chat</a></li>"+
			  "<li><a href='?p=logout'>Log out</a></li>"+
			  "</li>"+
			"</ul>"+
		//	"<font color='white'><br>No. of Registered users:37<br>No. of users with pic:18<br>No. of users no pic:19 </font>"+
			"</div></div></div></div>";
			
	return out; }

%>


<%! public String searchlist(String user) {
	String out = "";
			out +="<div id='main' class='clearfix' ><div class='inner'><h1 class='title'>Search Members</h1>"+			
			"<link type='text/css' rel='stylesheet' href='/k/global00.css'>"+
			"<link type='text/css' rel='stylesheet' href='/k/searchre.css'>"+
			"<div class='standardview'><div class='standardinfo' style>"+
			"<span class='memberpic'><a href='#' name='Tyna  -  30  -  Lagos, Nigeria' class='thickbox'>"+
			"<div class='photo'><p>2</p></div></a>"+                   
			"<a href='#' name='Tyna  -  30  -  Lagos, Nigeria' class='thickbox'>"+
			"<img border='0' height='136px' width='125px' src='search_list_files/35786000.jpg'></a></span>"+
			"<div class='text'><p class='hdg1'><a href='#'>Tyna (30)</a></p>"+
			"<p><span class='hdg2'>Hoping to find love again...</span>Lagos, Lagos<br>"+
			"<strong>Seeking:</strong> Male 30 - 45<br>"+
			"<strong>Last Login:</strong> over 12 months ago</p>"+
			"<br><a href='#'>View Profile</a>"+
			"</div></div></div><div class='clear'></div>";
			out +="</div></div>";
	return out; }
%>

<%! public int getAge(int y, int m, int d) {
	DateMidnight birthdate = new DateMidnight(y, m, d);
	DateTime now = new DateTime();
	Years age = Years.yearsBetween(birthdate, now);		
	String ag = age+"";		
	int str = Integer.parseInt(ag.replaceAll("\\D+",""));		
	
	return str;
	
}

%>




<% System.out.println("Current User ID is "+uid); %>