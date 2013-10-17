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

<%! public Connection cn = null; %>
<%
//Class.forName("org.apache.derby.jdbc.EmbeddedDriver").newInstance();
//try { cn = DriverManager.getConnection("jdbc:derby://localhost:1527/db", "admin", "13131"); } catch(SQLException e) { System.out.println(e); }
//try { cn = DriverManager.getConnection("jdbc:derby:db", "admin", "13131"); } catch(SQLException e) { System.out.println(e); }

%>

<%! String [] pn1 = {"userid", "username", "password", "firstname", "lastname", "mobileno", "gender", "age", "blobkey"}; 

String [] pn2 = {"age", "appearance", "bestFeature", "birthdate", "birthdate_day", "birthdate_month", "birthdate_year", "blobkey", "bodyArt", "bodyStyle", "childrenHave", "childrenNumber", "childrenOldest", "childrenWant", "childrenYoungest", "cityLive", "complexion", "countryLive", "drink", "education", "employmentStatus", "englishAbility", "ethnicity", "eyeColor", "eyeWear", "facialHair", "firstName", "firstname", "gender", "hairColor", "hairLength", "hairType", "height", "homeType", "incomeBracket", "incomeCurrency", "languageSpoken", "lastName", "lastname", "livingSituation", "maritalStatus", "mobileno", "nationality", "occupation", "p", "password", "petsHave", "polygamy", "profilebtn", "religion", "relocate", "resetCurrency", "smoke", "starSign", "stateLive", "tribe", "userid", "username", "weight"};

%>

<%! String blobkey="", firstname="", gender="", lastname="", mobileno="", password="", username="", age="", photoid=""; %>

<%! String path = ""; %>
<% try { path = request.getParameter("p").substring(0, 8); } catch(Exception e1) { } %>

<%! String uid = null, user = null, srch = null, msg = ""; %>
<%! DatastoreService ds = DatastoreServiceFactory.getDatastoreService(); %>
<%! BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>
<%! String uploadurl = blobstoreService.createUploadUrl("/upload"); %>

<%! public String p = null; %><% if(request.getParameter("p") != null) {  p = request.getParameter("p"); } %>

<% 
if(session.getAttribute("uid") != null) { uid = session.getAttribute("uid").toString(); } 
if(session.getAttribute("user") != null) { user = session.getAttribute("user").toString(); }
if(request.getParameter("msg") != null ) { msg = request.getParameter("msg"); }
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
       String blobkey = (String) result.getProperty("blobkey");
       System.out.println(id);
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

for(int a=1;a<=5;a++) {
	String blobkey="";
	try {
	Key ky = KeyFactory.createKey("USERS", a);
	Entity en = ds.get(ky);
	blobkey = en.getProperty("blobkey").toString();
	} catch(Exception e3) { System.out.println("matsala a line 151:69"); }
	out +="<td><img src='/serve?blob-key="+blobkey+"' width='50' height='50' /></td>";
}

		
out +="</tr>"+
///"<tr align='center'>"+
///"  <td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td>"+
///"</tr>"+
"<tr align='center'>";

for(int b=6;b<=10;b++) {
	String blobkey="";
	try {
	Key ky = KeyFactory.createKey("USERS", b);
	Entity en = ds.get(ky);
	blobkey = en.getProperty("blobkey").toString();
	} catch(Exception e3) {}
	out +="<td><img src='/serve?blob-key="+blobkey+"' width='50' height='50' /></td>";}		

		
out +="</tr>"+
///"<tr align='center'>"+
///"  <td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td><td>Mannir (100%)</td>"+
///"</tr>"+
"</table>"+



"<ul class='menu'>"+
"</ul></div></div></div></div>"+

"<div class='block2a'><div class='block2b'><div id='block-user-3' class='block block-user'><h2>Who's online</h2>"+
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
			  "<li><a href='?p=profile'>Profile Registration</a></li>"+
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
	} catch(Exception e) { System.out.println(e); }
	
	String out = "<div class='block2a'><div class='block2b'><div id='block-block-6' class='block block-block'>"+
			"<h2>My Account : "+user+"</h2><div class='content'>"+
			"<div align='center' ><img src='/serve?blob-key="+blobkey+"' width='130' height='150' /></div>"+
			"<ul>"+
			  "<li><a href='?p=account'>My Account</a></li>"+
			  "<li><a href='?p=upload'>Upload Picture</a></li>"+
			"<li><a href='?p=profileedit'>Profile Registration</a></li>"+
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
			"<div class='form-item'><label>Mobile No:</label><input type='text' name='mobileno' id='mobileno'  value='' class='form-text' /></div>"+
			"<div class='form-item'><label>Gender</label><select name='gender' id='gender'>"+
			"<option value='Male'>Male</option><option value='Female'>Female</option></select></div>"+
			
			"<div class='form-item'><label>Age</label><select name='age' id='age'>";
			for(int y=18;y<=100;y++) { out +="<option value='"+y+"'>"+y+"</option>"; }
			//"<option value='Male'>Male</option><option value='Female'>Female</option>"+
			
			out +="</select></div>";
			
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
	String mobileno = request.getParameter("mobileno");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	
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
	en.setProperty("age", age);
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
	String username="", pword="", fname="", lname="", mobileno="", gender="", age="";
	try {
	Key ky = KeyFactory.createKey("USERS", uid2);
	Entity en = ds.get(ky);
	username = en.getProperty("username").toString();
	pword = en.getProperty("password").toString();
	fname = en.getProperty("firstname").toString();
	lname = en.getProperty("lastname").toString();
	mobileno = en.getProperty("mobileno").toString();
	gender = en.getProperty("gender").toString();
	age = en.getProperty("age").toString();
	//System.out.println("ent="+en.getProperty("username"));
	} catch(Exception e) { System.out.println(e); }
	
	String out = "<div id='main' class='clearfix'><div id='main2'><div class='inner'>"+
			"<h1 class='title'>Welcome "+user+"</h1>"+
			"<div class='tabs'><ul class='tabs primary'>"+
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
			"<tr><td>Mobile No: <b>"+mobileno+"</b></td></tr>"+
			"<tr><td>Gender: <b>"+gender+"</b></td></tr>"+
			"<tr><td>Age: <b>"+age+"</b></td></tr>"+
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
	} catch(Exception e) { System.out.println(e); }
	
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


	out +="<div id='main' class='clearfix'><div id='main2'><div class='inner'><h1 class='title'>Search Members</h1>";
	
	out +="<form id='form1' name='form1' method='post' action=''>Search User By:<label>"+
	  "<select name='fl' id='fl'><option value='--' >-Select-</option>"+
    "<option value='firstname' >Firstname</option><option value='lastname' >Lastname</option>"+
	  "<option value='Gender' >Gender</option><option value='Date of Birth' >Date of Birth</option>"+
    "<option value='username' selected='selected' >Username</option><option value='mobileno' >MobileNo</option>"+
	  "<option value='State' >State</option><option value='Age' >Age</option><option value='Address' >Address</option><option value='Complexion' >Complexion</option><option value='Weight' >Weight</option><option value='Heght' >Heght</option>  </select>"+
"</label>=<label><input type='text' name='w' id='w' /></label>"+
"<label><input type='submit' name='search' id='search' value='Search' /><br />"+
"<span class='style1'>Search is case sensitive!</span></label></form>";

	
	int no=1;
	
if(srch!=null)	{
	out +="<table>";
	for(int a=1;a<=5;a++) {
		out +="<tr>";
		for(int b=1;b<=4;b++) {
			out +="<td><a href='?q=members/1'><img src='/serve?blob-key="+srch+"' width='130' height='150' /></a></td>";
			no++;
		}
		out +="</tr>";
	}
	no++;
	
	out +="</table>";
}	
	

    out +="</div></div></div>";
  return out;  
}    
    %>

<%
if(request.getParameter("search") != null) {
	String fl = request.getParameter("fl");
	String w = request.getParameter("w");
	srch = fl+"="+w;
	
	
	Query q = new Query("USERS");
	q.addFilter(fl, Query.FilterOperator.EQUAL, w);
    PreparedQuery pq = ds.prepare(q);  
for (Entity result : pq.asIterable()) {   
   String blobkey = (String) result.getProperty("blobkey");
   srch = blobkey;
   System.out.println("babyna="+srch);
	}

}

%>



<%
// TESTING

int n = (int)Math.floor(Math.random()*100000+1);
String rp = n+"";
        System.out.println("Random Numbers="+n+"");
        
       // String str = "AMIT";  
        String [] ar = rp.split("");
        for(String s: ar) {
        	System.out.println(s);
        }





%>