
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

<% //out.println("uid:"+uid); %>

<% // Get Entity

int ui = Integer.parseInt(uid);
try {
Key ky = KeyFactory.createKey("USERS", ui);
Entity e1 = ds.get(ky);
blobkey = e1.getProperty("blobkey").toString();
firstname = e1.getProperty("firstname").toString();
gender = 	e1.getProperty("gender").toString();
lastname = 	e1.getProperty("lastname").toString();
mobileno = 	e1.getProperty("mobileno").toString();
password = 	e1.getProperty("password").toString();
username = 	e1.getProperty("username").toString();
dob = 	e1.getProperty("dob").toString();
email = 	e1.getProperty("email").toString();
datereg = 	e1.getProperty("datereg").toString();
} catch(Exception e) { System.out.println(e); }


try { 
	Query q1 =  new Query("PROFILE");
	q1.addFilter("userid", Query.FilterOperator.EQUAL, uid);
	PreparedQuery pq = ds.prepare(q1);
	Entity pn  = pq.asSingleEntity();

	profileid = pn.getKey().getId()+"";
	userid = pn.getProperty("userid").toString();
	System.out.println("userid="+pn.getProperty("userid").toString());
	
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

%>

<%
if(request.getParameter("profilebtn") != null) {
	String blobkey = request.getParameter("blobkey");
	String hairType = request.getParameter("hairType");
	String eyeWear = request.getParameter("eyeWear");
	String appearance = request.getParameter("appearance");
	String weight = request.getParameter("weight");
	String userid = request.getParameter("userid");
	String lastname = request.getParameter("lastname");
	String hairColor = request.getParameter("hairColor");
	String education = request.getParameter("education");
	String maritalStatus = request.getParameter("maritalStatus");
	String password = request.getParameter("password");
	String profileid = request.getParameter("profileid");
	String religion = request.getParameter("religion");
	String facialHair = request.getParameter("facialHair");
	String username = request.getParameter("username");
	String height = request.getParameter("height");
	String polygamy = request.getParameter("polygamy");
	String englishAbility = request.getParameter("englishAbility");
	String drink = request.getParameter("drink");
	String livingSituation = request.getParameter("livingSituation");
	String gender = request.getParameter("gender");
	String bodyStyle = request.getParameter("bodyStyle");
	String occupation = request.getParameter("occupation");
	String tribe = request.getParameter("tribe");
	String childrenHave = request.getParameter("childrenHave");
	String firstname = request.getParameter("firstname");
	String complexion = request.getParameter("complexion");
	String homeType = request.getParameter("homeType");
	String smoke = request.getParameter("smoke");
	String petsHave = request.getParameter("petsHave");
	String mobileno = request.getParameter("mobileno");
	String country = request.getParameter("country");
	String hairLength = request.getParameter("hairLength");
	String profilebtn = request.getParameter("profilebtn");
	String email = request.getParameter("email");
	String eyeColor = request.getParameter("eyeColor");
	String dob = request.getParameter("dob");
	String languageSpoken = request.getParameter("languageSpoken");
	String ethnicity = request.getParameter("ethnicity");
	String employmentStatus = request.getParameter("employmentStatus");
	
	String pid = request.getParameter("profileid");
	Entity en = null;
	int noe = count("PROFILE");
	if(request.getParameter("profileid").equals("")) { 	en = new Entity("PROFILE",(noe+1)); }
	else { int pid2 = Integer.parseInt(pid); 			en = new Entity("PROFILE",pid2); }
	
	en.setProperty("blobkey",blobkey);
	en.setProperty("hairType",hairType);
	en.setProperty("eyeWear",eyeWear);
	en.setProperty("appearance",appearance);
	en.setProperty("weight",weight);
	en.setProperty("userid",userid);
	en.setProperty("lastname",lastname);
	en.setProperty("hairColor",hairColor);
	en.setProperty("education",education);
	en.setProperty("maritalStatus",maritalStatus);
	en.setProperty("password",password);
	//en.setProperty("profileid",profileid);
	en.setProperty("religion",religion);
	en.setProperty("facialHair",facialHair);
	en.setProperty("username",username);
	en.setProperty("height",height);
	en.setProperty("polygamy",polygamy);
	en.setProperty("englishAbility",englishAbility);
	en.setProperty("drink",drink);
	en.setProperty("livingSituation",livingSituation);
	en.setProperty("gender",gender);
	en.setProperty("bodyStyle",bodyStyle);
	en.setProperty("occupation",occupation);
	en.setProperty("tribe",tribe);
	en.setProperty("childrenHave",childrenHave);
	en.setProperty("firstname",firstname);
	en.setProperty("complexion",complexion);
	en.setProperty("homeType",homeType);
	en.setProperty("smoke",smoke);
	en.setProperty("petsHave",petsHave);
	en.setProperty("mobileno",mobileno);
	en.setProperty("country",country);
	en.setProperty("hairLength",hairLength);
//	en.setProperty("profilebtn",profilebtn);
	en.setProperty("email",email);
	en.setProperty("eyeColor",eyeColor);
	en.setProperty("dob",dob);
//	en.setProperty("p",p);
	en.setProperty("languageSpoken",languageSpoken);
	en.setProperty("ethnicity",ethnicity);
	en.setProperty("employmentStatus",employmentStatus);

	
		ds.put(en);
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "?p=profileview");

}


%>


<script src="cdn/jquery.qtip.min.js" type="text/javascript"></script>

<script src="cdn/jquery.scrollto.min.js" type="text/javascript"></script>

<script src="cdn/spryvalidationtextfield.js?v=9" type="text/javascript"></script>

<script src="cdn/spryvalidationtextarea.js?v=9" type="text/javascript"></script>

<script src="cdn/spryvalidationcheckbox.js?v=9" type="text/javascript"></script>

<script src="cdn/spryvalidationselect.js?v=9" type="text/javascript"></script>

<script src="cdn/spryvalidationradio.js?v=9" type="text/javascript"></script>

<script src="cdn/xpath.js?v=9" type="text/javascript"></script>

<script src="cdn/sprydata.js?v=9" type="text/javascript"></script>

<script src="cdn/profilemanagement.js?v=9" type="text/javascript"></script>

<script src="cdn/editmyprofile.js?v=9" type="text/javascript"></script>

<link type="text/css" rel="stylesheet" href="cdn/global.css?v=9"/>


		
<link type="text/css" rel="stylesheet" href="cdn/profilemanagement.css?v=9"/>

<link type="text/css" rel="stylesheet" href="cdn/spryvalidationtextarea.css?v=9"/>

<link type="text/css" rel="stylesheet" href="cdn/spryvalidationtextfield.css?v=9"/>

<link type="text/css" rel="stylesheet" href="cdn/spryvalidationcheckbox.css?v=9"/>

<link type="text/css" rel="stylesheet" href="cdn/spryvalidationselect.css?v=9"/>

<link type="text/css" rel="stylesheet" href="cdn/spryvalidationradio.css?v=9"/>


    <div id="main" class="clearfix"><div id="main2">
            <div class="inner">
            
<h1 class="title">Profile Page</h1>
<div class='tabs'><ul class='tabs primary'>
					<li><a href='?p=account'>My Account</a></li>
					<li class='active'><a href='?p=profileedit'>Profile Edit</a></li>
					<li><a href='?p=profileview'>Profile View</a></li>
					</ul></div>



<form name="registration" id="registration" action="" method="post">
		    <div class="roundedContainer">

				<ul class="formContainer">

	<li class="sectionHeading clearfix"><h2>Profile Information</h2></li>

<li class="clearfix"><label class="questionLabel">User ID:</label>
<input type="text" name="userid" id="userid" size="20" value="<%=uid %>" ></li>

<li class="clearfix"><label class="questionLabel">Profile ID:</label>
<input type="text" name="profileid" id="profileid" size="20" value="<%=profileid %>" ></li>

<li class="clearfix"><label class="questionLabel">Username:</label>
<input type="text" name="username" id="username" size="20" value="<%=username %>" ></li>
 
<li class="clearfix"><label class="questionLabel">Passwrod:</label>
<input type="text" name="password" id="password" size="20" value="<%=password %>" ></li>

<li class="clearfix"><label class="questionLabel">Firstname:</label>
<input type="text" name="firstname" id="firstname" size="20" value="<%=firstname %>" ></li>

 
<li class="clearfix"><label class="questionLabel">Lastname:</label>
<input type="text" name="lastname" id="lastname" size="20" value="<%=lastname %>" ></li>

 
<li class="clearfix"><label class="questionLabel">Email:</label>
<input type="text" name="email" id="mobileno" size="20" value="<%=email %>" ></li>

 <li class="clearfix"><label class="questionLabel">Mobile No:</label>
<input type="text" name="mobileno" id="mobileno" size="20" value="<%=mobileno %>" ></li>

 
                    <li class="clearfix">
						<label class="questionLabel">Gender:</label>
							 <span id="gender_validate"> 
                        <select 
                        	name="gender" 
                        
                        	id="gender"
                        
                        >
                    
                                
                                <option value="Male" >Male</option>
                            
                                
                                <option value="Female">Female</option>
                                <option value="<%=gender %>" selected="selected"><%=gender %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Gender: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var gender = new Spry.Widget.ValidationSelect("gender_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
					</li>

<li class="clearfix"><label class="questionLabel">Date of Birth:</label>
<input type="text" name="dob" id="dob" size="20" value="<%=dob %>" ></li>

<li class="clearfix"><label class="questionLabel">Photo ID:</label>
<input type="text" name="blobkey" id="blobkey" size="20" value="<%=blobkey %>" ></li>  

<li class="clearfix">
                    
<label class="questionLabel">Select Country:</label>
 <select onchange="print_state('state',this.selectedIndex);" id="country" name = "country"></select></li>
 
 <li class="clearfix">
 <label class="questionLabel">City/District/State:</label>
 <select name ="state" id = "state"></select>
 <script language="javascript">print_country("country");</script></li>
 
<li class="sectionHeading clearfix"><h2>Your Appearance</h2></li>
					
						<li class="clearfix">
							<label class="questionLabel">Hair color:</label>
								<span id="hairColor_validate"> 
                        <select 
                        	name="hairColor" 
                        
                        	id="hairColor"
                        
                        >
                    
                                
<option value='Bald / Shaved'>Bald / Shaved</option>


<option value='Black'>Black</option>


<option value='Blonde'>Blonde</option>


<option value='Brown'>Brown</option>


<option value='Grey / White'>Grey / White</option>


<option value='Light Brown'>Light Brown</option>


<option value='Red'>Red</option>


<option value='Changes frequently'>Changes frequently</option>
                            
                                
                                <option value="Other" >Other</option>
                                <option>-Select-</option>
                                <option value="<%= hairColor %>" selected="selected"><%= hairColor %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Hair color: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var hairColor = new Spry.Widget.ValidationSelect("hairColor_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Hair length:</label>
								<span id="hairLength_validate"> 
                        <select 
                        	name="hairLength" 
                        
                        	id="hairLength"
                        
                        >
<option value='Bald'>Bald</option>


<option value='Bald on Top'>Bald on Top</option>


<option value='Long'>Long</option>


<option value='Medium'>Medium</option>


<option value='Shaved'>Shaved</option>


<option value='Short'>Short</option>

                                <option value="<%= hairLength %>" selected="selected"><%= hairLength %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Hair length: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var hairLength = new Spry.Widget.ValidationSelect("hairLength_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
							</li>
					
						<li class="clearfix">
							<label class="questionLabel">Hair type:</label>
								<span id="hairType_validate"> 
                        <select 
                        	name="hairType" 
                        
                        	id="hairType"
                        
                        >
                    
                                
                                <option value="Curly" >Curly</option>
                            
                                
                                <option value="Other" >Other</option>
                            
                                
                                <option value="Straight" >Straight</option>
                            
                                
                                <option value="Wavy">Wavy</option>
                                
                                
                                <option value="<%= hairType %>" selected="selected"><%= hairType %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Hair type: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var hairType = new Spry.Widget.ValidationSelect("hairType_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Eye color:</label>
								<span id="eyeColor_validate"> 
                        <select 
                        	name="eyeColor" 
                        
                        	id="eyeColor"
                        
                        >
                    
                                
                                <option value="Black">Black</option>
                            
                                
                                <option value="Blue" >Blue</option>
                            
                                
                                <option value="Brown" >Brown</option>
                            
                                
                                <option value="Green" >Green</option>
                            
                                
                                <option value="Grey" >Grey</option>
                            
                                
                                <option value="Hazel" >Hazel</option>
                            
                                
                                <option value="Other" >Other</option>
                                <option value="<%= eyeColor %>" selected="selected"><%= eyeColor %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Eye color: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var eyeColor = new Spry.Widget.ValidationSelect("eyeColor_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Eye wear:</label>
								<span id="eyeWear_validate"> 
                        <select 
                        	name="eyeWear" 
                        
                        	id="eyeWear"
                        
                        >
                    
                                
                                <option value="Contacts" >Contacts</option>
                            
                                
                                <option value="Glasses" >Glasses</option>
                            
                                
                                <option value="None">None</option>
                                <option value="<%= eyeWear %>" selected="selected"><%= eyeWear %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Eye wear: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var eyeWear = new Spry.Widget.ValidationSelect("eyeWear_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Height:</label>
								 <span id="height_validate"> 
                        <select 
                        	name="height" 
                        
                        	id="height"
                        
                        >
                        
<% for(int h=140;h<=183;h++) { out.println("<option value='"+h+" cm'>"+h+" cm</option>"); } %>                       
                        






                <option value="<%= height %>" selected="selected"><%= height %></option>
                        </select>
                
                    	<span class="selectRequiredMsg">Height: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var height = new Spry.Widget.ValidationSelect("height_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Weight:</label>
								 <span id="weight_validate"> 
                        <select 
                        	name="weight" 
                        
                        	id="weight"
                        
                        >
<% for(int a=40;a<=220;a++) { out.println("<option value='"+a+" kg' >"+a+" kg</option>"); } %>                    

<option value="Prefer not to say" >Prefer not to say</option>
                                <option value="<%= weight %>" selected="selected"><%= weight %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Weight: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var weight = new Spry.Widget.ValidationSelect("weight_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Body type:</label>
								<span id="bodyStyle_validate"> 
                        <select 
                        	name="bodyStyle" 
                        
                        	id="bodyStyle"
                        
                        >
                    
                                
                                <option value="Petite" >Petite</option>
                            
                                
                                <option value="Slim" >Slim</option>
                            
                                
                                <option value="Athletic" >Athletic</option>
                            
                                
                                <option value="Average">Average</option>
                            
                                
                                <option value="Few Extra Pounds" >Few Extra Pounds</option>
                            
                                
                                <option value="Full Figured" >Full Figured</option>
                            
                                
                                <option value="Large and Lovely" >Large and Lovely</option>
                                <option value="<%= bodyStyle %>" selected="selected"><%= bodyStyle %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Body type: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var bodyStyle = new Spry.Widget.ValidationSelect("bodyStyle_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Your ethnicity is mostly:</label>
								<span id="ethnicity_validate"> 
                        <select 
                        	name="ethnicity" 
                        
                        	id="ethnicity"
                        
                        >
                    
<option value='African'>African</option>


<option value='African American'>African American</option>


<option value='Afro Caribbean'>Afro Caribbean</option>


<option value='Arab (Middle Eastern)'>Arab (Middle Eastern)</option>


<option value='Asian'>Asian</option>


<option value='Caucasian (White)'>Caucasian (White)</option>


<option value='Hispanic / Latino'>Hispanic / Latino</option>


<option value='Indian'>Indian</option>


<option value='Mixed'>Mixed</option>


<option value='Pacific Islander'>Pacific Islander</option>


<option value='Other'>Other</option>
                     <option value="<%= ethnicity %>" selected="selected"><%= ethnicity %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Your ethnicity is mostly: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var ethnicity = new Spry.Widget.ValidationSelect("ethnicity_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Complexion:</label>
								<span id="complexion_validate"> 
                        <select 
                        	name="complexion" 
                        
                        	id="complexion"
                        
                        >
                    
                                
                                <option value="Dark Brown" >Dark Brown</option>
                            
                                
                                <option value="Brown">Brown</option>
                            
                                
                                <option value="Light Brown" >Light Brown</option>
                            
                                
                                <option value="White" >White</option>
                                <option value="<%= complexion %>" selected="selected"><%= complexion %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Complexion: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var complexion = new Spry.Widget.ValidationSelect("complexion_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Facial hair:</label>
								<span id="facialHair_validate"> 
                        <select 
                        	name="facialHair" 
                        
                        	id="facialHair"
                        
                        >
                    
                                
                                <option value="Clean Shaven">Clean Shaven</option>
                            
                                
                                <option value="Sideburns" >Sideburns</option>
                            
                                
                                <option value="Mustache" >Mustache</option>
                            
                                
                                <option value="Goatee" >Goatee</option>
                            
                                
                                <option value="Short Beard" >Short Beard</option>
                            
                                
                                <option value="Medium Beard" >Medium Beard</option>
                            
                                
                                <option value="Long Beard" >Long Beard</option>
                                <option value="<%= facialHair %>" selected="selected"><%= facialHair %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Facial hair: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var facialHair = new Spry.Widget.ValidationSelect("facialHair_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
						<li class="clearfix">
							<label class="questionLabel">I consider my appearance as:</label>
								<span id="appearance_validate"> 
                        <select 
                        	name="appearance" 
                        
                        	id="appearance"
                        
                        >
                    
                                
                                <option value="Below average" >Below average</option>
                            
                                
                                <option value="Average">Average</option>
                            
                                
                                <option value="Attractive" >Attractive</option>
                            
                                
                                <option value="Very attractive" >Very attractive</option>
                                <option value="<%= appearance %>" selected="selected"><%= appearance %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">I consider my appearance as: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var appearance = new Spry.Widget.ValidationSelect("appearance_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="sectionHeading clearfix"><h2>Your Lifestyle</h2></li>
					
						<li class="clearfix">
							<label class="questionLabel">Do you drink?</label>
								<span id="drink_validate"> 
                        <select 
                        	name="drink" 
                        
                        	id="drink"
                        
                        >
                    
                                
                                <option value="Do drink" >Do drink</option>
                            
                                
                                <option value="Don't drink">Don't drink</option>
                            
                                
                                <option value="Occasionally drink" >Occasionally drink</option>
                                <option value="<%= drink %>" selected="selected"><%= drink %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Do you drink?: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var drink = new Spry.Widget.ValidationSelect("drink_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Do you smoke?</label>
								<span id="smoke_validate"> 
                        <select 
                        	name="smoke" 
                        
                        	id="smoke"
                        
                        >
                    
                                
                                <option value="Do smoke" >Do smoke</option>
                            
                                
                                <option value="Don't smoke">Don't smoke</option>
                            
                                
                                <option value="Occasionally smoke" >Occasionally smoke</option>
                                <option value="<%= smoke %>" selected="selected"><%= smoke %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Do you smoke?: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var smoke = new Spry.Widget.ValidationSelect("smoke_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Marital Status:</label>
								<span id="maritalStatus_validate"> 
                        <select 
                        	name="maritalStatus" 
                        
                        	id="maritalStatus"
                        
                        >
                    
                                
                                <option value="Single">Single</option>
                            
                                
                                <option value="Separated" >Separated</option>
                            
                                
                                <option value="Widowed" >Widowed</option>
                            
                                
                                <option value="Divorced" >Divorced</option>
                            
                                
                                <option value="Married" >Married</option>
                                <option value="<%= maritalStatus %>" selected="selected"><%= maritalStatus %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Marital Status: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var maritalStatus = new Spry.Widget.ValidationSelect("maritalStatus_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Do you have children?</label>
								<span id="childrenHave_validate"> 
                        <select 
                        	name="childrenHave" 
                        
                        	id="childrenHave"
                        
                        >
                    
                                
                                <option value="No">No</option>
                            
                                
                                <option value="Yes - don't live at home" >Yes - don't live at home</option>
                            
                                
                                <option value="Yes - sometimes live at home" >Yes - sometimes live at home</option>
                            
                                
                                <option value="Yes - live at home" >Yes - live at home</option>
                                <option value="<%= childrenHave %>" selected="selected"><%= childrenHave %></option>
                            
                	    </select>
                
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var childrenHave = new Spry.Widget.ValidationSelect("childrenHave_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>


                    <li class="clearfix">
						<label class="questionLabel">Do you have pets?:</label>
							 <span id="gender_validate"> 
                        <select 
                        	name="petsHave" 
                        
                        	id="petsHave"
                        
                        >
                    
                                
<option value="Bird" >Bird</option>
<option value="Dog">Dog</option>
<option value="Fish">Fish</option>
<option value="Horse">Horse</option>
<option value="Other">Other</option>

                                <option value="-" selected="selected"><%=gender %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Gender: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var gender = new Spry.Widget.ValidationSelect("gender_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
					</li>
					

					
						<li class="clearfix">
							<label class="questionLabel">Occupation:</label>
								 <span id="occupation_validate"> 
                        <select 
                        	name="occupation" 
                        
                        	id="occupation"
                        
                        >
                    
                                
<option value='Entertainment / Media'>Entertainment / Media</option>


<option value='Hair Dresser / Personal Grooming'>Hair Dresser / Personal Grooming</option>


<option value='Self Employed'>Self Employed</option>


<option value='Transportation'>Transportation</option>


<option value='Administrative / Secretarial / Clerical'>Administrative / Secretarial / Clerical</option>


<option value='Advertising / Media'>Advertising / Media</option>


<option value='Artistic / Creative / Performance'>Artistic / Creative / Performance</option>


<option value='Construction / Trades'>Construction / Trades</option>


<option value='Domestic Helper'>Domestic Helper</option>


<option value='Education / Academic'>Education / Academic</option>


<option value='Executive / Management / HR'>Executive / Management / HR</option>


<option value='Farming / Agriculture'>Farming / Agriculture</option>


<option value='Finance / Banking / Real Estate'>Finance / Banking / Real Estate</option>


<option value='Fire / law enforcement / security'>Fire / law enforcement / security</option>


<option value='IT / Communications'>IT / Communications</option>


<option value='Laborer / Manufacturing'>Laborer / Manufacturing</option>


<option value='Legal'>Legal</option>


<option value='Medical / Dental / Veterinary'>Medical / Dental / Veterinary</option>


<option value='Military'>Military</option>


<option value='Nanny / Child care'>Nanny / Child care</option>


<option value='No occupation / Stay at home'>No occupation / Stay at home</option>


<option value='Non-profit / clergy / social services'>Non-profit / clergy / social services</option>


<option value='Political / Govt / Civil Service'>Political / Govt / Civil Service</option>


<option value='Retail / Food services'>Retail / Food services</option>


<option value='Retired'>Retired</option>


<option value='Sales / Marketing'>Sales / Marketing</option>


<option value='Sports / recreation'>Sports / recreation</option>


<option value='Student'>Student</option>


<option value='Technical / Science / Engineering'>Technical / Science / Engineering</option>


<option value='Travel / Hospitality'>Travel / Hospitality</option>


<option value='Unemployed'>Unemployed</option>
                                <option value="<%= occupation %>" selected="selected"><%= occupation %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Occupation: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var occupation = new Spry.Widget.ValidationSelect("occupation_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Employment status:</label>
								<span id="employmentStatus_validate"> 
                        <select 
                        	name="employmentStatus" 
                        
                        	id="employmentStatus"
                        
                        >
                    
                                
                                <option value="Full Time" >Full Time</option>
                            
                                
                                <option value="Homemaker" >Homemaker</option>
                            
                                
                                <option value="Not Employed" >Not Employed</option>
                            
                                
                                <option value="Other" >Other</option>
                            
                                
                                <option value="Part Time" >Part Time</option>
                            
                                
                                <option value="Prefer not to say" >Prefer not to say</option>
                            
                                
                                <option value="Retired" >Retired</option>
                            
                                
                                <option value="Student">Student</option>
                                <option value="<%= employmentStatus %>" selected="selected"><%= employmentStatus %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Employment status: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var employmentStatus = new Spry.Widget.ValidationSelect("employmentStatus_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
					<li class="clearfix">
						<label class="questionLabel">Home type:</label>
							<span id="homeType_validate"> 
                        <select 
                        	name="homeType" 
                        
                        	id="homeType"
                        
                        >
                    
                                
                                <option value="Apartment / Flat">Apartment / Flat</option>
                            
                                
                                <option value="Condominium" >Condominium</option>
                            
                                
                                <option value="Farm" >Farm</option>
                            
                                
                                <option value="House" >House</option>
                            
                                
                                <option value="Mansion" >Mansion</option>
                            
                                
                                <option value="Public housing" >Public housing</option>
                            
                                
                                <option value="Town house" >Town house</option>
                            
                                
                                <option value="Other" >Other</option>
                                <option value="<%= homeType %>" selected="selected"><%= homeType %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Home type: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var homeType = new Spry.Widget.ValidationSelect("homeType_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
					  </li>
					
						<li class="clearfix">
							<label class="questionLabel">Living situation:</label>
								<span id="livingSituation_validate"> 
                        <select 
                        	name="livingSituation" 
                        
                        	id="livingSituation"
                        
                        >
                    
                                
                                <option value="Live Alone" >Live Alone</option>
                            
                                
                                <option value="Live with family">Live with family</option>
                            
                                
                                <option value="Live with friends" >Live with friends</option>
                            
                                
                                <option value="Live with kids" >Live with kids</option>
                            
                                
                                <option value="Live with spouse" >Live with spouse</option>
                            
                                
                                <option value="Other" >Other</option>
                                <option value="<%= livingSituation %>" selected="selected"><%= livingSituation %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Living situation: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var livingSituation = new Spry.Widget.ValidationSelect("livingSituation_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					

					
						<li class="sectionHeading clearfix"><h2>Your Background / Cultural Values</h2></li>
					

					
			  			<li class="clearfix">
							<label class="questionLabel">Tribe:</label>
							<span id="tribeV">
								<select name="tribe" id="tribeProfile">
									<option value="">Please Select...</option>
									<option value="Afade">Afade</option>
<option value="Afo">Afo</option>
<option value="Anang">Anang</option>
<option value="Andoni (Obolo)">Andoni (Obolo)</option>
<option value="Angas">Angas</option>
<option value="Awak">Awak</option>
<option value="Bachama">Bachama</option>
<option value="Bafo">Bafo</option>
<option value="Baggara">Baggara</option>
<option value="Banga">Banga</option>
<option value="Bangwinji">Bangwinji</option>
<option value="Bariba">Bariba</option>
<option value="Bassa">Bassa</option>
<option value="Benin">Benin</option>
<option value="Bini">Bini</option>
<option value="Birom">Birom</option>
<option value="Boki">Boki</option>
<option value="Bura">Bura</option>
<option value="Butawa">Butawa</option>
<option value="Chala (Daffo-Batura)">Chala (Daffo-Batura)</option>
<option value="Chamba">Chamba</option>
<option value="Daima">Daima</option>
<option value="Degema">Degema</option>
<option value="Dirim">Dirim</option>
<option value="Doka">Doka</option>
<option value="Dong">Dong</option>
<option value="Duguri">Duguri</option>
<option value="Dukawa">Dukawa</option>
<option value="Edo">Edo</option>
<option value="Efik (Ogboni)">Efik (Ogboni)</option>
<option value="Eggon">Eggon</option>
<option value="Eket">Eket</option>
<option value="Ekoi">Ekoi</option>
<option value="Eloyi">Eloyi</option>
<option value="Esan">Esan</option>
<option value="Esie">Esie</option>
<option value="Gera">Gera</option>
<option value="Goemai">Goemai</option>
<option value="Guruntum">Guruntum</option>
<option value="Gwandara">Gwandara</option>
<option value="Gwari">Gwari</option>
<option value="Hausa">Hausa</option>
<option value="Ibo (Igbo)">Ibo (Igbo)</option>
<option value="Idoma">Idoma</option>
<option value="Idon">Idon</option>
<option value="Ife">Ife</option>
<option value="Igala">Igala</option>
<option value="Igbira">Igbira</option>
<option value="Ijan (Zon)">Ijan (Zon)</option>
<option value="Ika">Ika</option>
<option value="Iku">Iku</option>
<option value="Ikwere">Ikwere</option>
<option value="Isoko">Isoko</option>
<option value="Itsekiri">Itsekiri</option>
<option value="Jarawa">Jarawa</option>
<option value="Jempre">Jempre</option>
<option value="Jukun (Wurkun)">Jukun (Wurkun)</option>
<option value="Kalabari">Kalabari</option>
<option value="Kambari">Kambari</option>
<option value="Kanuri">Kanuri</option>
<option value="Katab">Katab</option>
<option value="Katana">Katana</option>
<option value="Kilba">Kilba</option>
<option value="Koma">Koma</option>
<option value="Kunari">Kunari</option>
<option value="Kwanka">Kwanka</option>
<option value="Mama">Mama</option>
<option value="Mambila">Mambila</option>
<option value="Mandara (Wandala)">Mandara (Wandala)</option>
<option value="Marghi">Marghi</option>
<option value="Mumuye">Mumuye</option>
<option value="Nok">Nok</option>
<option value="Nupe">Nupe</option>
<option value="Ogidi">Ogidi</option>
<option value="Ogoni">Ogoni</option>
<option value="Ogori-Magongo">Ogori-Magongo</option>
<option value="Okobo">Okobo</option>
<option value="Oron">Oron</option>
<option value="Owo">Owo</option>
<option value="Paa">Paa</option>
<option value="Puku">Puku</option>
<option value="Sao">Sao</option>
<option value="Shanga (Shangawa)">Shanga (Shangawa)</option>
<option value="Songhai">Songhai</option>
<option value="Tarok">Tarok</option>
<option value="Tiv">Tiv</option>
<option value="Tuareg">Tuareg</option>
<option value="Uhrobo (Urhobo)">Uhrobo (Urhobo)</option>
<option value="Warjawa (Warji)">Warjawa (Warji)</option>
<option value="Wodaabe">Wodaabe</option>
<option value="Yourba (Yoruba)">Yourba (Yoruba)</option>
<option value="Zerma">Zerma</option>
<option value="Zuru">Zuru</option>
<option value="Afade">Afade</option>
<option value="Afo">Afo</option>
<option value="Anang">Anang</option>
<option value="Andoni (Obolo)">Andoni (Obolo)</option>
<option value="Angas">Angas</option>
<option value="Awak">Awak</option>
<option value="Bachama">Bachama</option>
<option value="Bafo">Bafo</option>
<option value="Baggara">Baggara</option>
<option value="Banga">Banga</option>
<option value="Bangwinji">Bangwinji</option>
<option value="Bariba">Bariba</option>
<option value="Bassa">Bassa</option>
<option value="Benin">Benin</option>
<option value="Bini">Bini</option>
<option value="Birom">Birom</option>
<option value="Boki">Boki</option>
<option value="Bura">Bura</option>
<option value="Butawa">Butawa</option>
<option value="Chala (Daffo-Batura)">Chala (Daffo-Batura)</option>
<option value="Chamba">Chamba</option>
<option value="Daima">Daima</option>
<option value="Degema">Degema</option>
<option value="Dirim">Dirim</option>
<option value="Doka">Doka</option>
<option value="Dong">Dong</option>
<option value="Duguri">Duguri</option>
<option value="Dukawa">Dukawa</option>
<option value="Edo">Edo</option>
<option value="Efik (Ogboni)">Efik (Ogboni)</option>
<option value="Eggon">Eggon</option>
<option value="Eket">Eket</option>
<option value="Ekoi">Ekoi</option>
<option value="Eloyi">Eloyi</option>
<option value="Esan">Esan</option>
<option value="Esie">Esie</option>
<option value="Gera">Gera</option>
<option value="Goemai">Goemai</option>
<option value="Guruntum">Guruntum</option>
<option value="Gwandara">Gwandara</option>
<option value="Gwari">Gwari</option>
<option value="Hausa">Hausa</option>
<option value="Ibo (Igbo)">Ibo (Igbo)</option>
<option value="Idoma">Idoma</option>
<option value="Idon">Idon</option>
<option value="Ife">Ife</option>
<option value="Igala">Igala</option>
<option value="Igbira">Igbira</option>
<option value="Ijan (Zon)">Ijan (Zon)</option>
<option value="Ika">Ika</option>
<option value="Iku">Iku</option>
<option value="Ikwere">Ikwere</option>
<option value="Isoko">Isoko</option>
<option value="Itsekiri">Itsekiri</option>
<option value="Jarawa">Jarawa</option>
<option value="Jempre">Jempre</option>
<option value="Jukun (Wurkun)">Jukun (Wurkun)</option>
<option value="Kalabari">Kalabari</option>
<option value="Kambari">Kambari</option>
<option value="Kanuri">Kanuri</option>
<option value="Katab">Katab</option>
<option value="Katana">Katana</option>
<option value="Kilba">Kilba</option>
<option value="Koma">Koma</option>
<option value="Kunari">Kunari</option>
<option value="Kwanka">Kwanka</option>
<option value="Mama">Mama</option>
<option value="Mambila">Mambila</option>
<option value="Mandara (Wandala)">Mandara (Wandala)</option>
<option value="Marghi">Marghi</option>
<option value="Mumuye">Mumuye</option>
<option value="Nok">Nok</option>
<option value="Nupe">Nupe</option>
<option value="Ogidi">Ogidi</option>
<option value="Ogoni">Ogoni</option>
<option value="Ogori-Magongo">Ogori-Magongo</option>
<option value="Okobo">Okobo</option>
<option value="Oron">Oron</option>
<option value="Owo">Owo</option>
<option value="Paa">Paa</option>
<option value="Puku">Puku</option>
<option value="Sao">Sao</option>
<option value="Shanga (Shangawa)">Shanga (Shangawa)</option>
<option value="Songhai">Songhai</option>
<option value="Tarok">Tarok</option>
<option value="Tiv">Tiv</option>
<option value="Tuareg">Tuareg</option>
<option value="Uhrobo (Urhobo)">Uhrobo (Urhobo)</option>
<option value="Warjawa (Warji)">Warjawa (Warji)</option>
<option value="Wodaabe">Wodaabe</option>
<option value="Yourba (Yoruba)">Yourba (Yoruba)</option>
<option value="Zerma">Zerma</option>
<option value="Zuru">Zuru</option>
<option value="ther">ther</option>

                                    

										
										<option value="Prefer not to say">Prefer not to say</option>
										<option value="<%= tribe %>" selected="selected"><%= tribe %></option>
                                    
								</select>
								<span class="selectRequiredMsg">A value is required.</span>
								<span class="selectInvalidMsg">A value is required.</span>
							</span>
							<script type="text/javascript">
								<!--
								var tribeV = new Spry.Widget.ValidationSelect("tribeV", {isRequired:true, validateOn:['change'], invalidValue:"null"});
								//-->
							</script>
						</li>
		 			
						<li class="clearfix">
							<label class="questionLabel">Education:</label>
								 <span id="education_validate"> 
                        <select 
                        	name="education" 
                        
                        	id="education"
                        
                        >
                    
                                
                                <option value="Primary (Elementary) School" >Primary (Elementary) School</option>
                            
                                
                                <option value="Middle School / Junior High" >Middle School / Junior High</option>
                            
                                
                                <option value="High School" >High School</option>
                            
                                
                                <option value="Vocational College" >Vocational College</option>
                            
                                
                                <option value="Bachelors Degree">Bachelors Degree</option>
                            
                                
                                <option value="Masters Degree" >Masters Degree</option>
                            
                                
                                <option value="PhD or Doctorate" >PhD or Doctorate</option>
                                <option value="<%= education %>" selected="selected"><%= education %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Education: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var education = new Spry.Widget.ValidationSelect("education_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Languages spoken:</label>
							<span id="languageSpokenV">
							    <select name="languageSpoken" id="languageSpoken" multiple="multiple" size="12">
							      <option value="English" selected="selected">English</option>
							      <option value="French">French</option>
<option value="German">German</option>
<option value="Italian">Italian</option>
<option value="Japanese">Japanese</option>
<option value="Spanish">Spanish</option>
<option value="Afrikaans">Afrikaans</option>
<option value="Albanian">Albanian</option>
<option value="Amharic">Amharic</option>
<option value="Arabic">Arabic</option>
<option value="Armenian">Armenian</option>
<option value="Assyrian">Assyrian</option>
<option value="Azerbaijani">Azerbaijani</option>
<option value="Bahasa Malay / Indonesian">Bahasa Malay / Indonesian</option>
<option value="Belorussian">Belorussian</option>
<option value="Bulgarian">Bulgarian</option>
<option value="Burmese">Burmese</option>
<option value="Cebuano">Cebuano</option>
<option value="Chinese (Cantonese)">Chinese (Cantonese)</option>
<option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
<option value="Creole">Creole</option>
<option value="Croatian">Croatian</option>
<option value="Czech">Czech</option>
<option value="Danish">Danish</option>
<option value="Dutch">Dutch</option>
<option value="Eritrean">Eritrean</option>
<option value="Estonian">Estonian</option>
<option value="Farsi">Farsi</option>
<option value="Finnish">Finnish</option>
<option value="Georgian">Georgian</option>
<option value="Greek">Greek</option>
<option value="Hausa">Hausa</option>
<option value="Hebrew">Hebrew</option>
<option value="indi">indi</option>
<option value="Hungarian">Hungarian</option>
<option value="Icelandic">Icelandic</option>
<option value="Iilocano">Iilocano</option>
<option value="Inuktitut">Inuktitut</option>
<option value="Kazakh">Kazakh</option>
<option value="Khmer">Khmer</option>
<option value="Kirgiz">Kirgiz</option>
<option value="Korean">Korean</option>
<option value="Kurdish">Kurdish</option>
<option value="utchi">utchi</option>
<option value="Kyrgiz">Kyrgiz</option>
<option value="Laotian">Laotian</option>
<option value="Latvian">Latvian</option>
<option value="Lithuanian">Lithuanian</option>
<option value="Macedonian">Macedonian</option>
<option value="Malagasy">Malagasy</option>
<option value="Maldivian">Maldivian</option>
<option value="Maltese">Maltese</option>
<option value="Mongolian">Mongolian</option>
<option value="Norwegian">Norwegian</option>
<option value="Pashto">Pashto</option>
<option value="Persian">Persian</option>
<option value="Pidgin">Pidgin</option>
<option value="Polish">Polish</option>
<option value="Portuguese">Portuguese</option>
<option value="Quechua">Quechua</option>
<option value="Romanian">Romanian</option>
<option value="Russian">Russian</option>
<option value="Serbian">Serbian</option>
<option value="Sinhala">Sinhala</option>
<option value="Slovak">Slovak</option>
<option value="Slovene">Slovene</option>
<option value="Somali">Somali</option>
<option value="Swahili">Swahili</option>
<option value="Swedish">Swedish</option>
<option value="Tagalog">Tagalog</option>
<option value="Thai">Thai</option>
<option value="Tibetan">Tibetan</option>
<option value="Tongan">Tongan</option>
<option value="Turkish">Turkish</option>
<option value="Turkmen">Turkmen</option>
<option value="Ugaritic">Ugaritic</option>
<option value="Ukrainian">Ukrainian</option>
<option value="Uzbek">Uzbek</option>
<option value="Vietnamese">Vietnamese</option>
<option value="Welsh">Welsh</option>
<option value="ther">ther</option>
<option value="ption>">ption></option>
<option value="elected="selected">English">elected="selected">English</option>
<option value="rench">rench</option>
<option value="German">German</option>
<option value="Italian">Italian</option>
<option value="Japanese">Japanese</option>
<option value="Spanish">Spanish</option>
<option value="Afrikaans">Afrikaans</option>
<option value="Albanian">Albanian</option>
<option value="Amharic">Amharic</option>
<option value="Arabic">Arabic</option>
<option value="Armenian">Armenian</option>
<option value="Assyrian">Assyrian</option>
<option value="Azerbaijani">Azerbaijani</option>
<option value="Bahasa Malay / Indonesian">Bahasa Malay / Indonesian</option>
<option value="Belorussian">Belorussian</option>
<option value="Bulgarian">Bulgarian</option>
<option value="Burmese">Burmese</option>
<option value="Cebuano">Cebuano</option>
<option value="Chinese (Cantonese)">Chinese (Cantonese)</option>
<option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
<option value="Creole">Creole</option>
<option value="Croatian">Croatian</option>
<option value="Czech">Czech</option>
<option value="Danish">Danish</option>
<option value="Dutch">Dutch</option>
<option value="Eritrean">Eritrean</option>
<option value="Estonian">Estonian</option>
<option value="Farsi">Farsi</option>
<option value="Finnish">Finnish</option>
<option value="Georgian">Georgian</option>
<option value="Greek">Greek</option>
<option value="Hausa">Hausa</option>
<option value="Hebrew">Hebrew</option>
<option value="indi">indi</option>
<option value="Hungarian">Hungarian</option>
<option value="Icelandic">Icelandic</option>
<option value="Iilocano">Iilocano</option>
<option value="Inuktitut">Inuktitut</option>
<option value="Kazakh">Kazakh</option>
<option value="Khmer">Khmer</option>
<option value="Kirgiz">Kirgiz</option>
<option value="Korean">Korean</option>
<option value="Kurdish">Kurdish</option>
<option value="utchi">utchi</option>
<option value="Kyrgiz">Kyrgiz</option>
<option value="Laotian">Laotian</option>
<option value="Latvian">Latvian</option>
<option value="Lithuanian">Lithuanian</option>
<option value="Macedonian">Macedonian</option>
<option value="Malagasy">Malagasy</option>
<option value="Maldivian">Maldivian</option>
<option value="Maltese">Maltese</option>
<option value="Mongolian">Mongolian</option>
<option value="Norwegian">Norwegian</option>
<option value="Pashto">Pashto</option>
<option value="Persian">Persian</option>
<option value="Pidgin">Pidgin</option>
<option value="Polish">Polish</option>
<option value="Portuguese">Portuguese</option>
<option value="Quechua">Quechua</option>
<option value="Romanian">Romanian</option>
<option value="Russian">Russian</option>
<option value="Serbian">Serbian</option>
<option value="Sinhala">Sinhala</option>
<option value="Slovak">Slovak</option>
<option value="Slovene">Slovene</option>
<option value="Somali">Somali</option>
<option value="Swahili">Swahili</option>
<option value="Swedish">Swedish</option>
<option value="Tagalog">Tagalog</option>
<option value="Thai">Thai</option>
<option value="Tibetan">Tibetan</option>
<option value="Tongan">Tongan</option>
<option value="Turkish">Turkish</option>
<option value="Turkmen">Turkmen</option>
<option value="Ugaritic">Ugaritic</option>
<option value="Ukrainian">Ukrainian</option>
<option value="Uzbek">Uzbek</option>
<option value="Vietnamese">Vietnamese</option>
<option value="Welsh">Welsh</option>
<option value="Other">Other</option>

                                </select>*
                                <span class="selectRequiredMsg">A value is required.</span>
								<span class="selectInvalidMsg">A value is required.</span>
							</span>
							<script type="text/javascript">
								<!--
								var tribeV = new Spry.Widget.ValidationSelect("languageSpokenV", {isRequired:true, validateOn:['change'], invalidValue:"null"});
								//-->
							</script>
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">English language ability:</label>
								<span id="englishAbility_validate"> 
                        <select 
                        	name="englishAbility" 
                        
                        	id="englishAbility"
                        
                        >
                    
                                
                                <option value="None" >None</option>
                            
                                
                                <option value="Some" >Some</option>
                            
                                
                                <option value="Good" >Good</option>
                            
                                
                                <option value="Very Good">Very Good</option>
                            
                                
                                <option value="Fluent" >Fluent</option>
                                <option value="<%= englishAbility %>" selected="selected"><%= englishAbility %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">English language ability: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var englishAbility = new Spry.Widget.ValidationSelect("englishAbility_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						
					
						<li class="clearfix">
						<label class="questionLabel">Religion:</label>
						<span id="religion_validate"> 
                        <select 
                        	name="religion" 
                        
                        	id="religion"
                        
                        >
                    
                                
                                <option value="Baha'ist" >Baha'ist</option>
<option value="Buddhist" >Buddhist</option>
<option value="Christian" >Christian</option>
<option value="Hindu" >Hindu</option>
<option value="Islam">Islam</option>
<option value="Jainism" >Jainism</option>
<option value="Jewish" >Jewish</option>
<option value="Parsi" >Parsi</option>
<option value="Shintoism" >Shintoism</option>
<option value="Sikhism" >Sikhism</option>
<option value="Taoism" >Taoism</option>
<option value="Other" >Other</option>
<option value="No religion" >No religion</option>

                                <option value="<%= religion %>" selected="selected"><%= religion %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Religion: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var religion = new Spry.Widget.ValidationSelect("religion_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						
					
						<li class="clearfix">
						<label class="questionLabel">Polygamy:</label>
						<span id="polygamy_validate"> 
                        <select 
                        	name="polygamy" 
                        
                        	id="polygamy"
                        
                        >
                    
                                
                                <option value="Accept polygamy" >Accept polygamy</option>
                            
                                
                                <option value="Don't accept polygamy">Don't accept polygamy</option>
                            
                                
                                <option value="Maybe accept polygamy" >Maybe accept polygamy</option>
                                <option value="<%= polygamy %>" selected="selected"><%= polygamy %></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Polygamy: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var polygamy = new Spry.Widget.ValidationSelect("polygamy_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					<li id="error_zone">
				  		<span class="errorMessageValidation">Oops: You forgot to answer all the questions. Please scroll up complete any unanswered questions.</span>
	  				</li>
					<div class="clear"></div>
					<li style="text-align:center;border:0"><input type="submit" name="profilebtn" class="greyShinyButton" value="Submit"/></li>
				</ul>
			</div>
	</form>
              </div>
    </div></div>