
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

try { Query q1 =  new Query("PROFILE");
q1.addFilter("userid", Query.FilterOperator.EQUAL, uid);
PreparedQuery pq = ds.prepare(q1);
Entity pn  = pq.asSingleEntity();			
userid = pn.getProperty("userid").toString();
System.out.println(userid);
profileid = pn.getKey().getId()+"";
} catch(Exception e) { System.out.println("e="+e); }

%>

<%
if(request.getParameter("profilebtn") != null) {
	Entity en = null;
	String fn = request.getParameter("firstName");
	String pid = request.getParameter("profileid");
///	System.out.println(fn);
	   Enumeration paramNames = request.getParameterNames();
	   int noe = count("PROFILE");
	   System.out.println("Number of Entity="+noe);
	   if(request.getParameter("profileid").equals("")) { en = new Entity("PROFILE",(noe+1)); }
	   else { int pid2 = Integer.parseInt(pid);
		   en = new Entity("PROFILE",pid2); }
	int a = 1;
	   while(paramNames.hasMoreElements()) {
	      String paramName = (String)paramNames.nextElement();
	      //out.print("<tr><td>" + paramName + "</td>\n");
	      String value =  request.getParameter(paramName);
	      //out.println("<td> " + paramValue + "</td></tr>\n");
	     System.out.println(paramName+"="+value);
	     
	  	en.setProperty(paramName, value);

	  	ds.put(en);
	 a++;
	   }
	   System.out.println("numbers="+a);
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
                    
                                
                                <option value="254" >Female</option>
                            
                                
                                <option value="253">Male</option>
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
                                <option value="-" selected="selected"></option>
                            
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

                                <option value="-" selected="selected"></option>
                            
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
                                
                                
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                         <option value='4'7&quot; (140 cm)'>4'7&quot; (140 cm)</option>
<option value='4'8&quot; (143 cm)'>4'8&quot; (143 cm)</option>
<option value='4'9&quot; (145 cm)'>4'9&quot; (145 cm)</option>
<option value='4'10&quot; (148 cm)'>4'10&quot; (148 cm)</option>
<option value='4'11&quot; (150 cm)'>4'11&quot; (150 cm)</option>


<option value='5' (153 cm)'>5' (153 cm)</option>
<option value='5'1&quot; (155 cm)'>5'1&quot; (155 cm)</option>
<option value='5'2&quot; (158 cm)'>5'2&quot; (158 cm)</option>
<option value='5'3&quot; (161 cm)'>5'3&quot; (161 cm)</option>
<option value='5'4&quot; (163 cm)'>5'4&quot; (163 cm)</option>
<option value='5'5&quot; (166 cm)'>5'5&quot; (166 cm)</option>
<option value='5'6&quot; (168 cm)'>5'6&quot; (168 cm)</option>
<option value='5'7&quot; (171 cm)'>5'7&quot; (171 cm)</option>
<option value='5'8&quot; (173 cm)'>5'8&quot; (173 cm)</option>
<option value='5'9&quot; (176 cm)'>5'9&quot; (176 cm)</option>
<option value='5'10&quot; (178 cm)'>5'10&quot; (178 cm)</option>
<option value='5'11&quot; (181 cm)'>5'11&quot; (181 cm)</option>


<option value='6' (183 cm)'>6' (183 cm)</option>
                <option value="-" selected="selected"></option>
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
<% for(int a=40;a<=220;a++) {
	out.println("<option value='"+a+"' >"+a+" kg</option>");
}

%>                    

<option value="Prefer not to say" >Prefer not to say</option>
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                     <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Do you have children?: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var childrenHave = new Spry.Widget.ValidationSelect("childrenHave_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix highlight" style="display:none">
							<label class="questionLabel">Number of children:</label>
								<span id="childrenNumber_validate"> 
                        <select 
                        	name="childrenNumber" 
                        
                        	id="childrenNumber"
                        
                        >
                    
                            <option value="" >Please Select...</option>
                            
                                
                                <option value="0" >0</option>
                            
                                
                                <option value="1" >1</option>
                            
                                
                                <option value="2" >2</option>
                            
                                
                                <option value="3" >3</option>
                            
                                
                                <option value="4" >4</option>
                            
                                
                                <option value="5" >5</option>
                            
                                
                                <option value="6" >6</option>
                            
                                
                                <option value="7" >7</option>
                            
                                
                                <option value="8" >8</option>
                            
                                
                                <option value="More than 8" >More than 8</option>
                            
                	</select>
                
                    	<span class="selectRequiredMsg">Number of children: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var childrenNumber = new Spry.Widget.ValidationSelect("childrenNumber_validate", {isRequired:false , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix highlight" style="display:none">
							<label class="questionLabel">Oldest child:</label>
								<span id="childrenOldest_validate"> 
                        <select 
                        	name="childrenOldest" 
                        
                        	id="childrenOldest"
                        
                        >
                    
                            <option value="" >Please Select...</option>
                            
                                
                                <option value="0" >0</option>
                            
                                
                                <option value="1" >1</option>
                            
                                
                                <option value="2" >2</option>
                            
                                
                                <option value="3" >3</option>
                            
                                
                                <option value="4" >4</option>
                            
                                
                                <option value="5" >5</option>
                            
                                
                                <option value="6" >6</option>
                            
                                
                                <option value="7" >7</option>
                            
                                
                                <option value="8" >8</option>
                            
                                
                                <option value="9" >9</option>
                            
                                
                                <option value="10" >10</option>
                            
                                
                                <option value="11" >11</option>
                            
                                
                                <option value="12" >12</option>
                            
                                
                                <option value="13" >13</option>
                            
                                
                                <option value="14" >14</option>
                            
                                
                                <option value="15" >15</option>
                            
                                
                                <option value="16" >16</option>
                            
                                
                                <option value="17" >17</option>
                            
                                
                                <option value="18" >18</option>
                            
                                
                                <option value="Older than 18" >Older than 18</option>
                            
                	</select>
                
                    	<span class="selectRequiredMsg">Oldest child: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var childrenOldest = new Spry.Widget.ValidationSelect("childrenOldest_validate", {isRequired:false , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix highlight" style="display:none">
							<label class="questionLabel">Youngest child:</label>
								<span id="childrenYoungest_validate"> 
                        <select 
                        	name="childrenYoungest" 
                        
                        	id="childrenYoungest"
                        
                        >
                    
                            <option value="" >Please Select...</option>
                            
                                
                                <option value="0" >0</option>
                            
                                
                                <option value="1" >1</option>
                            
                                
                                <option value="2" >2</option>
                            
                                
                                <option value="3" >3</option>
                            
                                
                                <option value="4" >4</option>
                            
                                
                                <option value="5" >5</option>
                            
                                
                                <option value="6" >6</option>
                            
                                
                                <option value="7" >7</option>
                            
                                
                                <option value="8" >8</option>
                            
                                
                                <option value="9" >9</option>
                            
                                
                                <option value="10" >10</option>
                            
                                
                                <option value="11" >11</option>
                            
                                
                                <option value="12" >12</option>
                            
                                
                                <option value="13" >13</option>
                            
                                
                                <option value="14" >14</option>
                            
                                
                                <option value="15" >15</option>
                            
                                
                                <option value="16" >16</option>
                            
                                
                                <option value="17" >17</option>
                            
                                
                                <option value="18" >18</option>
                            
                                
                                <option value="Older than 18" >Older than 18</option>
                            
                	</select>
                
                    	<span class="selectRequiredMsg">Youngest child: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var childrenYoungest = new Spry.Widget.ValidationSelect("childrenYoungest_validate", {isRequired:false , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Do you want (more) children?</label>
								<span id="childrenWant_validate"> 
                        <select 
                        	name="childrenWant" 
                        
                        	id="childrenWant"
                        
                        >
                    
                                
                                <option value="Yes" >Yes</option>
                            
                                
                                <option value="Not Sure">Not Sure</option>
                            
                                
                                <option value="No" >No</option>
                                <option value="-" selected="selected"></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Do you want (more) children?: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var childrenWant = new Spry.Widget.ValidationSelect("childrenWant_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<fieldset>
								<label class="questionLabel">Do you have pets?</label>
								<span id="petsHave_validate"> 
                
                    <div style="width:475px" class="left">
    
                        
                            <div style="width:50%" class="left">
    
                                
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_593" type="checkbox" value="593"/>Bird</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_590" type="checkbox" value="590"/>Dog</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_592" type="checkbox" value="592"/>Fish</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_594" type="checkbox" value="594"/>Horse</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_252" type="checkbox" value="252"/>Other</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_597" type="checkbox" value="597"/>Reptile</label>
                                        
    
                            </div>
                        
                            <div style="width:50%" class="left">
    
                                
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_591" type="checkbox" value="591"/>Cat</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_598" type="checkbox" value="598"/>Exotic pets</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_595" type="checkbox" value="595"/>Hamster / Guinea Pigs</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_1512" type="checkbox" value="1512"/>No Pets</label>
                                        
                                            <label class="itemisedQuestion" style="cursor:hand"><input name="petsHave" id="petsHave_596" type="checkbox" value="596"/>Rabbit</label>
                                        
    
                            </div>
                        
    
                    </div>
                
                    	<div class="formclear">
                    <span class="checkboxRequiredMsg">Do you have pets?: A value is required.</span> 
                    	</div>
                    
                    </span>
                    
                    
                    <script type="text/javascript">
                    <!--
                    
                    var petsHave = new Spry.Widget.ValidationCheckbox("petsHave_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
							</fieldset>
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
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
                                <option value="-" selected="selected"></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Living situation: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var livingSituation = new Spry.Widget.ValidationSelect("livingSituation_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
						<li class="clearfix">
							<label class="questionLabel">Willing to relocate:</label>
								<span id="relocate_validate"> 
                        <select 
                        	name="relocate" 
                        
                        	id="relocate"
                        
                        >
                    
                                
                                <option value="Willing to relocate within my country" >Willing to relocate within my country</option>
                            
                                
                                <option value="Willing to relocate to another country">Willing to relocate to another country</option>
                            
                                
                                <option value="Not willing to relocate" >Not willing to relocate</option>
                            
                                
                                <option value="Not sure about relocating" >Not sure about relocating</option>
                                <option value="-" selected="selected"></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Willing to relocate: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var relocate = new Spry.Widget.ValidationSelect("relocate_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					

					
						<li class="sectionHeading clearfix"><h2>Your Background / Cultural Values</h2></li>
					
						<li class="clearfix">
							<label class="questionLabel">Nationality:</label>
								 <span id="nationality_validate"> 
                        <select 
                        	name="nationality" 
                        
                        	id="nationality"
                        
                        >
                    
      <option value='Abkhazia'>Abkhazia</option>
<option value='Afghanistan'>Afghanistan</option>
<option value='Akrotiri and Dhekelia'>Akrotiri and Dhekelia</option>
<option value='Aland'>Aland</option>
<option value='Albania'>Albania</option>
<option value='Algeria'>Algeria</option>
<option value='American Samoa'>American Samoa</option>
<option value='Andorra'>Andorra</option>
<option value='Angola'>Angola</option>
<option value='Anguilla'>Anguilla</option>
<option value='Antigua and Barbuda'>Antigua and Barbuda</option>
<option value='Argentina'>Argentina</option>
<option value='Armenia'>Armenia</option>
<option value='Aruba'>Aruba</option>
<option value='Ascension Island'>Ascension Island</option>
<option value='Australia'>Australia</option>
<option value='Austria'>Austria</option>
<option value='Azerbaijan'>Azerbaijan</option>
<option value='Bahamas, The'>Bahamas, The</option>
<option value='Bahrain'>Bahrain</option>
<option value='Bangladesh'>Bangladesh</option>
<option value='Barbados'>Barbados</option>
<option value='Belarus'>Belarus</option>
<option value='Belgium'>Belgium</option>
<option value='Belize'>Belize</option>
<option value='Benin'>Benin</option>
<option value='Bermuda'>Bermuda</option>
<option value='Bhutan'>Bhutan</option>
<option value='Bolivia'>Bolivia</option>
<option value='Bosnia and Herzegovina'>Bosnia and Herzegovina</option>
<option value='Botswana'>Botswana</option>
<option value='Brazil'>Brazil</option>
<option value='Brunei'>Brunei</option>
<option value='Bulgaria'>Bulgaria</option>
<option value='Burkina Faso'>Burkina Faso</option>
<option value='Burundi'>Burundi</option>
<option value='Cambodia'>Cambodia</option>
<option value='Cameroon'>Cameroon</option>
<option value='Canada'>Canada</option>
<option value='Cape Verde'>Cape Verde</option>
<option value='Cayman Islands'>Cayman Islands</option>
<option value='Central Africa Republic'>Central Africa Republic</option>
<option value='Chad'>Chad</option>
<option value='Chile'>Chile</option>
<option value='China'>China</option>
<option value='Christmas Island'>Christmas Island</option>
<option value='Cocos (Keeling) Islands'>Cocos (Keeling) Islands</option>
<option value='Colombia'>Colombia</option>
<option value='Comoros'>Comoros</option>
<option value='Congo'>Congo</option>
<option value='Cook Islands'>Cook Islands</option>
<option value='Costa Rica'>Costa Rica</option>
<option value='Cote d'lvoire'>Cote d'lvoire</option>
<option value='Croatia'>Croatia</option>
<option value='Cuba'>Cuba</option>
<option value='Cyprus'>Cyprus</option>
<option value='Czech Republic'>Czech Republic</option>
<option value='Denmark'>Denmark</option>
<option value='Djibouti'>Djibouti</option>
<option value='Dominica'>Dominica</option>
<option value='Dominican Republic'>Dominican Republic</option>
<option value='East Timor Ecuador'>East Timor Ecuador</option>
<option value='Egypt'>Egypt</option>
<option value='El Salvador'>El Salvador</option>
<option value='Equatorial Guinea'>Equatorial Guinea</option>
<option value='Eritrea'>Eritrea</option>
<option value='Estonia'>Estonia</option>
<option value='Ethiopia'>Ethiopia</option>
<option value='Falkland Islands'>Falkland Islands</option>
<option value='Faroe Islands'>Faroe Islands</option>
<option value='Fiji'>Fiji</option>
<option value='Finland'>Finland</option>
<option value='France'>France</option>
<option value='French Polynesia'>French Polynesia</option>
<option value='Gabon'>Gabon</option>
<option value='Cambia, The'>Cambia, The</option>
<option value='Georgia'>Georgia</option>
<option value='Germany'>Germany</option>
<option value='Ghana'>Ghana</option>
<option value='Gibraltar'>Gibraltar</option>
<option value='Greece'>Greece</option>
<option value='Greenland'>Greenland</option>
<option value='Grenada'>Grenada</option>
<option value='Guam'>Guam</option>
<option value='Guatemala'>Guatemala</option>
<option value='Guemsey'>Guemsey</option>
<option value='Guinea'>Guinea</option>
<option value='Guinea-Bissau'>Guinea-Bissau</option>
<option value='Guyana'>Guyana</option>
<option value='Haiti'>Haiti</option>
<option value='Honduras'>Honduras</option>
<option value='Hong Kong'>Hong Kong</option>
<option value='Hungary'>Hungary</option>
<option value='Iceland'>Iceland</option>
<option value='India'>India</option>
<option value='Indonesia'>Indonesia</option>
<option value='Iran'>Iran</option>
<option value='Iraq'>Iraq</option>
<option value='Ireland'>Ireland</option>
<option value='Isle of Man'>Isle of Man</option>
<option value='Israel'>Israel</option>
<option value='Italy'>Italy</option>
<option value='Jamaica'>Jamaica</option>
<option value='Japan'>Japan</option>
<option value='Jersey'>Jersey</option>
<option value='Jordan'>Jordan</option>
<option value='Kazakhstan'>Kazakhstan</option>
<option value='Kenya'>Kenya</option>
<option value='Kiribati'>Kiribati</option>
<option value='Korea, N'>Korea, N</option>
<option value='Korea, S'>Korea, S</option>
<option value='Kosovo'>Kosovo</option>
<option value='Kuwait'>Kuwait</option>
<option value='Kyrgyzstan'>Kyrgyzstan</option>
<option value='Laos'>Laos</option>
<option value='Latvia'>Latvia</option>
<option value='Lebanon'>Lebanon</option>
<option value='Lesotho'>Lesotho</option>
<option value='Liberia'>Liberia</option>
<option value='Libya'>Libya</option>
<option value='Liechtenstein'>Liechtenstein</option>
<option value='Lithuania'>Lithuania</option>
<option value='Luxembourg'>Luxembourg</option>
<option value='Macao'>Macao</option>
<option value='Macedonia'>Macedonia</option>
<option value='Madagascar'>Madagascar</option>
<option value='Malawi'>Malawi</option>
<option value='Malaysia'>Malaysia</option>
<option value='Maldives'>Maldives</option>
<option value='Mali'>Mali</option>
<option value='Malta'>Malta</option>
<option value='Marshall Islands'>Marshall Islands</option>
<option value='Mauritania'>Mauritania</option>
<option value='Mauritius'>Mauritius</option>
<option value='Mayotte'>Mayotte</option>
<option value='Mexico'>Mexico</option>
<option value='Micronesia'>Micronesia</option>
<option value='Moldova'>Moldova</option>
<option value='Monaco'>Monaco</option>
<option value='Mongolia'>Mongolia</option>
<option value='Montenegro'>Montenegro</option>
<option value='Montserrat'>Montserrat</option>
<option value='Morocco'>Morocco</option>
<option value='Mozambique'>Mozambique</option>
<option value='Myanmar'>Myanmar</option>
<option value='Nagorno-Karabakh'>Nagorno-Karabakh</option>
<option value='Namibia'>Namibia</option>
<option value='Nauru'>Nauru</option>
<option value='Nepal'>Nepal</option>
<option value='Netherlands'>Netherlands</option>
<option value='Netherlands Antilles'>Netherlands Antilles</option>
<option value='New Caledonia'>New Caledonia</option>
<option value='New Zealand'>New Zealand</option>
<option value='Nicaragua'>Nicaragua</option>
<option value='Niger'>Niger</option>
<option value='Nigeria'>Nigeria</option>
<option value='Niue'>Niue</option>
<option value='Norfolk Island'>Norfolk Island</option>
<option value='Northern Cyprus'>Northern Cyprus</option>
<option value='Northern Mariana Islands'>Northern Mariana Islands</option>
<option value='Norway'>Norway</option>
<option value='Oman'>Oman</option>
<option value='Pakistan'>Pakistan</option>
<option value='Palau'>Palau</option>
<option value='Palestine'>Palestine</option>
<option value='Panama'>Panama</option>
<option value='Papua New Guinea'>Papua New Guinea</option>
<option value='Paraguay'>Paraguay</option>
<option value='Peru'>Peru</option>
<option value='Philippines'>Philippines</option>
<option value='Pitcaim Islands'>Pitcaim Islands</option>
<option value='Poland'>Poland</option>
<option value='Portugal'>Portugal</option>
<option value='Puerto Rico'>Puerto Rico</option>
<option value='Qatar'>Qatar</option>
<option value='Romania'>Romania</option>
<option value='Russia'>Russia</option>
<option value='Rwanda'>Rwanda</option>
<option value='Sahrawi Arab Democratic Republic'>Sahrawi Arab Democratic Republic</option>
<option value='Saint-Barthelemy'>Saint-Barthelemy</option>
<option value='Saint Helena'>Saint Helena</option>
<option value='Saint Kitts and Nevis'>Saint Kitts and Nevis</option>
<option value='Saint Lucia'>Saint Lucia</option>
<option value='Saint Martin'>Saint Martin</option>
<option value='Saint Pierre and Miquelon'>Saint Pierre and Miquelon</option>
<option value='Saint Vincent and Grenadines'>Saint Vincent and Grenadines</option>
<option value='Samos'>Samos</option>
<option value='San Marino'>San Marino</option>
<option value='Sao Tome and Principe'>Sao Tome and Principe</option>
<option value='Saudi Arabia'>Saudi Arabia</option>
<option value='Senegal'>Senegal</option>
<option value='Serbia'>Serbia</option>
<option value='Seychelles'>Seychelles</option>
<option value='Sierra Leone'>Sierra Leone</option>
<option value='Singapore'>Singapore</option>
<option value='Slovakia'>Slovakia</option>
<option value='Slovenia'>Slovenia</option>
<option value='Solomon Islands'>Solomon Islands</option>
<option value='Somalia'>Somalia</option>
<option value='Somaliland'>Somaliland</option>
<option value='South Africa'>South Africa</option>
<option value='South Ossetia'>South Ossetia</option>
<option value='Spain'>Spain</option>
<option value='Sri Lanka'>Sri Lanka</option>
<option value='Sudan'>Sudan</option>
<option value='Suriname'>Suriname</option>
<option value='Svalbard'>Svalbard</option>
<option value='Swaziland'>Swaziland</option>
<option value='Sweden'>Sweden</option>
<option value='Switzerland'>Switzerland</option>
<option value='Syria'>Syria</option>
<option value='Tajikistan'>Tajikistan</option>
<option value='Tanzania'>Tanzania</option>
<option value='Thailand'>Thailand</option>
<option value='Togo'>Togo</option>
<option value='Tokelau'>Tokelau</option>
<option value='Tonga'>Tonga</option>
<option value='Transnistria'>Transnistria</option>
<option value='Trinidad and Tobago'>Trinidad and Tobago</option>
<option value='Tristan da Cunha'>Tristan da Cunha</option>
<option value='Tunisia'>Tunisia</option>
<option value='Turkey'>Turkey</option>
<option value='Turkmenistan'>Turkmenistan</option>
<option value='Turks and Caicos Islands'>Turks and Caicos Islands</option>
<option value='Tuvalu'>Tuvalu</option>
<option value='Uganda'>Uganda</option>
<option value='Ukraine'>Ukraine</option>
<option value='United Arab Emirates'>United Arab Emirates</option>
<option value='United Kingdom'>United Kingdom</option>
<option value='United States'>United States</option>
<option value='Uruguay'>Uruguay</option>
<option value='Uzbekistan'>Uzbekistan</option>
<option value='Vanuatu'>Vanuatu</option>
<option value='Vatican City'>Vatican City</option>
<option value='Venezuela'>Venezuela</option>
<option value='Vietnam'>Vietnam</option>
<option value='Virgin Islands, British'>Virgin Islands, British</option>
<option value='Virgin Islands, U.S.'>Virgin Islands, U.S.</option>
<option value='Wallis and Futuna'>Wallis and Futuna</option>
<option value='Yemen'>Yemen</option>
<option value='Zambia'>Zambia</option>
<option value='Zimbabwe'>Zimbabwe</option>                                

                                <option value="-" selected="selected"></option>
                            
                	    </select>
                
                    	<span class="selectRequiredMsg">Nationality: A value is required.</span>
                    
                    </span>
                    
                    <script type="text/javascript">
                    <!--
                    
                    var nationality = new Spry.Widget.ValidationSelect("nationality_validate", {isRequired:true , validateOn:['change']});
                    
                    //-->
                    </script>
				
						</li>
					
			  			<li class="clearfix">
							<label class="questionLabel">Tribe:</label>
							<span id="tribeV">
								<select name="tribe" id="tribeProfile">
									<option value="">Please Select...</option>
									<option value="2134">Afade</option>
									<option value="2135">Afo</option>
									<option value="2136">Anang</option>
									<option value="2137">Andoni (Obolo)</option>
									<option value="2138">Angas</option>
									<option value="2139">Awak</option>
									<option value="2140">Bachama</option>
									<option value="2141">Bafo</option>
									<option value="2142">Baggara</option>
									<option value="2143">Banga</option>
									<option value="2144">Bangwinji</option>
									<option value="2145">Bariba</option>
									<option value="2146">Bassa</option>
									<option value="2147">Benin</option>
									<option value="2148">Bini</option>
									<option value="2149">Birom</option>
									<option value="2150">Boki</option>
									<option value="2151">Bura</option>
									<option value="2152">Butawa</option>
									<option value="2153">Chala (Daffo-Batura)</option>
									<option value="2154">Chamba</option>
									<option value="2155">Daima</option>
									<option value="2156">Degema</option>
									<option value="2157">Dirim</option>
									<option value="2158">Doka</option>
									<option value="2159">Dong</option>
									<option value="2160">Duguri</option>
									<option value="2161">Dukawa</option>
									<option value="2162">Edo</option>
									<option value="2163">Efik (Ogboni)</option>
									<option value="2164">Eggon</option>
									<option value="2165">Eket</option>
									<option value="2166">Ekoi</option>
									<option value="2167">Eloyi</option>
									<option value="2168">Esan</option>
									<option value="2169">Esie</option>
									<option value="2170">Gera</option>
									<option value="2171">Goemai</option>
									<option value="2172">Guruntum</option>
									<option value="2173">Gwandara</option>
									<option value="2174">Gwari</option>
									<option value="2175">Hausa</option>
									<option value="2176">Ibo (Igbo)</option>
									<option value="2177">Idoma</option>
									<option value="2178">Idon</option>
									<option value="2179">Ife</option>
									<option value="2180">Igala</option>
									<option value="2181">Igbira</option>
									<option value="2182">Ijan (Zon)</option>
									<option value="2183">Ika</option>
									<option value="2184">Iku</option>
									<option value="2185">Ikwere</option>
									<option value="2186">Isoko</option>
									<option value="2187">Itsekiri</option>
									<option value="2188">Jarawa</option>
									<option value="2189">Jempre</option>
									<option value="2190">Jukun (Wurkun)</option>
									<option value="2191">Kalabari</option>
									<option value="2192">Kambari</option>
									<option value="2193">Kanuri</option>
									<option value="2194">Katab</option>
									<option value="2195">Katana</option>
									<option value="2196">Kilba</option>
									<option value="2197">Koma</option>
									<option value="2198">Kunari</option>
									<option value="2199">Kwanka</option>
									<option value="2200">Mama</option>
									<option value="2201">Mambila</option>
									<option value="2202">Mandara (Wandala)</option>
									<option value="2203">Marghi</option>
									<option value="2204">Mumuye</option>
									<option value="2205">Nok</option>
									<option value="2206">Nupe</option>
									<option value="2207">Ogidi</option>
									<option value="2208">Ogoni</option>
									<option value="2209">Ogori-Magongo</option>
									<option value="2210">Okobo</option>
									<option value="2211">Oron</option>
									<option value="2212">Owo</option>
									<option value="2213">Paa</option>
									<option value="2214">Puku</option>
									<option value="2215">Sao</option>
									<option value="2216">Shanga (Shangawa)</option>
									<option value="2217">Songhai</option>
									<option value="2218">Tarok</option>
									<option value="2219">Tiv</option>
									<option value="2220">Tuareg</option>
									<option value="2221">Uhrobo (Urhobo)</option>
									<option value="2222">Warjawa (Warji)</option>
									<option value="2223">Wodaabe</option>
									<option value="2224">Yourba (Yoruba)</option>
									<option value="2225">Zerma</option>
									<option value="2226">Zuru</option>
									
											<optgroup label="Nigeria">
											
										<option value="2134">Afade</option>
                                    
										<option value="2135">Afo</option>
                                    
										<option value="2136">Anang</option>
                                    
										<option value="2137">Andoni (Obolo)</option>
                                    
										<option value="2138">Angas</option>
                                    
										<option value="2139">Awak</option>
                                    
										<option value="2140">Bachama</option>
                                    
										<option value="2141">Bafo</option>
                                    
										<option value="2142">Baggara</option>
                                    
										<option value="2143">Banga</option>
                                    
										<option value="2144">Bangwinji</option>
                                    
										<option value="2145">Bariba</option>
                                    
										<option value="2146">Bassa</option>
                                    
										<option value="2147">Benin</option>
                                    
										<option value="2148">Bini</option>
                                    
										<option value="2149">Birom</option>
                                    
										<option value="2150">Boki</option>
                                    
										<option value="2151">Bura</option>
                                    
										<option value="2152">Butawa</option>
                                    
										<option value="2153">Chala (Daffo-Batura)</option>
                                    
										<option value="2154">Chamba</option>
                                    
										<option value="2155">Daima</option>
                                    
										<option value="2156">Degema</option>
                                    
										<option value="2157">Dirim</option>
                                    
										<option value="2158">Doka</option>
                                    
										<option value="2159">Dong</option>
                                    
										<option value="2160">Duguri</option>
                                    
										<option value="2161">Dukawa</option>
                                    
										<option value="2162">Edo</option>
                                    
										<option value="2163">Efik (Ogboni)</option>
                                    
										<option value="2164">Eggon</option>
                                    
										<option value="2165">Eket</option>
                                    
										<option value="2166">Ekoi</option>
                                    
										<option value="2167">Eloyi</option>
                                    
										<option value="2168">Esan</option>
                                    
										<option value="2169">Esie</option>
                                    
										<option value="2170">Gera</option>
                                    
										<option value="2171">Goemai</option>
                                    
										<option value="2172">Guruntum</option>
                                    
										<option value="2173">Gwandara</option>
                                    
										<option value="2174">Gwari</option>
                                    
										<option value="2175">Hausa</option>
                                    
										<option value="2176">Ibo (Igbo)</option>
                                    
										<option value="2177">Idoma</option>
                                    
										<option value="2178">Idon</option>
                                    
										<option value="2179">Ife</option>
                                    
										<option value="2180">Igala</option>
                                    
										<option value="2181">Igbira</option>
                                    
										<option value="2182">Ijan (Zon)</option>
                                    
										<option value="2183">Ika</option>
                                    
										<option value="2184">Iku</option>
                                    
										<option value="2185">Ikwere</option>
                                    
										<option value="2186">Isoko</option>
                                    
										<option value="2187">Itsekiri</option>
                                    
										<option value="2188">Jarawa</option>
                                    
										<option value="2189">Jempre</option>
                                    
										<option value="2190">Jukun (Wurkun)</option>
                                    
										<option value="2191">Kalabari</option>
                                    
										<option value="2192">Kambari</option>
                                    
										<option value="2193">Kanuri</option>
                                    
										<option value="2194">Katab</option>
                                    
										<option value="2195">Katana</option>
                                    
										<option value="2196">Kilba</option>
                                    
										<option value="2197">Koma</option>
                                    
										<option value="2198">Kunari</option>
                                    
										<option value="2199">Kwanka</option>
                                    
										<option value="2200">Mama</option>
                                    
										<option value="2201">Mambila</option>
                                    
										<option value="2202">Mandara (Wandala)</option>
                                    
										<option value="2203">Marghi</option>
                                    
										<option value="2204">Mumuye</option>
                                    
										<option value="2205">Nok</option>
                                    
										<option value="2206">Nupe</option>
                                    
										<option value="2207">Ogidi</option>
                                    
										<option value="2208">Ogoni</option>
                                    
										<option value="2209">Ogori-Magongo</option>
                                    
										<option value="2210">Okobo</option>
                                    
										<option value="2211">Oron</option>
                                    
										<option value="2212">Owo</option>
                                    
										<option value="2213">Paa</option>
                                    
										<option value="2214">Puku</option>
                                    
										<option value="2215">Sao</option>
                                    
										<option value="2216">Shanga (Shangawa)</option>
                                    
										<option value="2217">Songhai</option>
                                    
										<option value="2218">Tarok</option>
                                    
										<option value="2219">Tiv</option>
                                    
										<option value="2220">Tuareg</option>
                                    
										<option value="2221">Uhrobo (Urhobo)</option>
                                    
										<option value="2222">Warjawa (Warji)</option>
                                    
										<option value="2223">Wodaabe</option>
                                    
										<option value="2224">Yourba (Yoruba)</option>
                                    
										<option value="2225">Zerma</option>
                                    
										<option value="2226">Zuru</option>
                                    
											</optgroup>
										
										<option value="252">Other</option>
                                    
											</optgroup>
										
										<option value="251">Prefer not to say</option>
										<option value="-" selected="selected"></option>
                                    
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
                    
                                
                                <option value="312" >Primary (Elementary) School</option>
                            
                                
                                <option value="313" >Middle School / Junior High</option>
                            
                                
                                <option value="314" >High School</option>
                            
                                
                                <option value="315" >Vocational College</option>
                            
                                
                                <option value="316">Bachelors Degree</option>
                            
                                
                                <option value="317" >Masters Degree</option>
                            
                                
                                <option value="318" >PhD or Doctorate</option>
                                <option value="-" selected="selected"></option>
                            
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
							      <option value="938" selected="selected">English</option>
							      <option value="939">French</option>
							      <option value="1446">German</option>
							      <option value="1456">Italian</option>
							      <option value="1457">Japanese</option>
							      <option value="1490">Spanish</option>
							      <option value="1419">Afrikaans</option>
							      <option value="1420">Albanian</option>
							      <option value="1421">Amharic</option>
							      <option value="1422">Arabic</option>
							      <option value="1423">Armenian</option>
							      <option value="1424">Assyrian</option>
							      <option value="1425">Azerbaijani</option>
							      <option value="1426">Bahasa Malay / Indonesian</option>
							      <option value="1427">Belorussian</option>
							      <option value="1429">Bulgarian</option>
							      <option value="1430">Burmese</option>
							      <option value="1431">Cebuano</option>
							      <option value="1432">Chinese (Cantonese)</option>
							      <option value="1433">Chinese (Mandarin)</option>
							      <option value="1434">Creole</option>
							      <option value="1435">Croatian</option>
							      <option value="1436">Czech</option>
							      <option value="1437">Danish</option>
							      <option value="1438">Dutch</option>
							      <option value="1440">Eritrean</option>
							      <option value="1441">Estonian</option>
							      <option value="1442">Farsi</option>
							      <option value="1443">Finnish</option>
							      <option value="1445">Georgian</option>
							      <option value="1447">Greek</option>
							      <option value="1449">Hausa</option>
							      <option value="1450">Hebrew</option>
							      <option value="945">Hindi</option>
							      <option value="1452">Hungarian</option>
							      <option value="1453">Icelandic</option>
							      <option value="1454">Iilocano</option>
							      <option value="1455">Inuktitut</option>
							      <option value="1458">Kazakh</option>
							      <option value="1459">Khmer</option>
							      <option value="1460">Kirgiz</option>
							      <option value="1461">Korean</option>
							      <option value="1462">Kurdish</option>
							      <option value="954">Kutchi</option>
							      <option value="1463">Kyrgiz</option>
							      <option value="1464">Laotian</option>
							      <option value="1465">Latvian</option>
							      <option value="1466">Lithuanian</option>
							      <option value="1467">Macedonian</option>
							      <option value="1468">Malagasy</option>
							      <option value="1470">Maldivian</option>
							      <option value="1471">Maltese</option>
							      <option value="1473">Mongolian</option>
							      <option value="1475">Norwegian</option>
							      <option value="1476">Pashto</option>
							      <option value="1477">Persian</option>
							      <option value="1478">Pidgin</option>
							      <option value="1479">Polish</option>
							      <option value="1480">Portuguese</option>
							      <option value="1481">Quechua</option>
							      <option value="1482">Romanian</option>
							      <option value="1483">Russian</option>
							      <option value="1484">Serbian</option>
							      <option value="1486">Sinhala</option>
							      <option value="1487">Slovak</option>
							      <option value="1488">Slovene</option>
							      <option value="1489">Somali</option>
							      <option value="1491">Swahili</option>
							      <option value="1492">Swedish</option>
							      <option value="1493">Tagalog</option>
							      <option value="1496">Thai</option>
							      <option value="1497">Tibetan</option>
							      <option value="1498">Tongan</option>
							      <option value="1499">Turkish</option>
							      <option value="1500">Turkmen</option>
							      <option value="1501">Ugaritic</option>
							      <option value="1502">Ukrainian</option>
							      <option value="1504">Uzbek</option>
							      <option value="1505">Vietnamese</option>
							      <option value="1506">Welsh</option>
							      <option value="252">Other</option>
							      <option value="-"></option>
							      <option value="938" selected="selected">English</option>
							      <option value="939">French</option>
							      <option value="1446">German</option>
							      <option value="1456">Italian</option>
							      <option value="1457">Japanese</option>
							      <option value="1490">Spanish</option>
							      <option value="1419">Afrikaans</option>
							      <option value="1420">Albanian</option>
							      <option value="1421">Amharic</option>
							      <option value="1422">Arabic</option>
							      <option value="1423">Armenian</option>
							      <option value="1424">Assyrian</option>
							      <option value="1425">Azerbaijani</option>
							      <option value="1426">Bahasa Malay / Indonesian</option>
							      <option value="1427">Belorussian</option>
							      <option value="1429">Bulgarian</option>
							      <option value="1430">Burmese</option>
							      <option value="1431">Cebuano</option>
							      <option value="1432">Chinese (Cantonese)</option>
							      <option value="1433">Chinese (Mandarin)</option>
							      <option value="1434">Creole</option>
							      <option value="1435">Croatian</option>
							      <option value="1436">Czech</option>
							      <option value="1437">Danish</option>
							      <option value="1438">Dutch</option>
							      <option value="1440">Eritrean</option>
							      <option value="1441">Estonian</option>
							      <option value="1442">Farsi</option>
							      <option value="1443">Finnish</option>
							      <option value="1445">Georgian</option>
							      <option value="1447">Greek</option>
							      <option value="1449">Hausa</option>
							      <option value="1450">Hebrew</option>
							      <option value="945">Hindi</option>
							      <option value="1452">Hungarian</option>
							      <option value="1453">Icelandic</option>
							      <option value="1454">Iilocano</option>
							      <option value="1455">Inuktitut</option>
							      <option value="1458">Kazakh</option>
							      <option value="1459">Khmer</option>
							      <option value="1460">Kirgiz</option>
							      <option value="1461">Korean</option>
							      <option value="1462">Kurdish</option>
							      <option value="954">Kutchi</option>
							      <option value="1463">Kyrgiz</option>
							      <option value="1464">Laotian</option>
							      <option value="1465">Latvian</option>
							      <option value="1466">Lithuanian</option>
							      <option value="1467">Macedonian</option>
							      <option value="1468">Malagasy</option>
							      <option value="1470">Maldivian</option>
							      <option value="1471">Maltese</option>
							      <option value="1473">Mongolian</option>
							      <option value="1475">Norwegian</option>
							      <option value="1476">Pashto</option>
							      <option value="1477">Persian</option>
							      <option value="1478">Pidgin</option>
							      <option value="1479">Polish</option>
							      <option value="1480">Portuguese</option>
							      <option value="1481">Quechua</option>
							      <option value="1482">Romanian</option>
							      <option value="1483">Russian</option>
							      <option value="1484">Serbian</option>
							      <option value="1486">Sinhala</option>
							      <option value="1487">Slovak</option>
							      <option value="1488">Slovene</option>
							      <option value="1489">Somali</option>
							      <option value="1491">Swahili</option>
							      <option value="1492">Swedish</option>
							      <option value="1493">Tagalog</option>
							      <option value="1496">Thai</option>
							      <option value="1497">Tibetan</option>
							      <option value="1498">Tongan</option>
							      <option value="1499">Turkish</option>
							      <option value="1500">Turkmen</option>
							      <option value="1501">Ugaritic</option>
							      <option value="1502">Ukrainian</option>
							      <option value="1504">Uzbek</option>
							      <option value="1505">Vietnamese</option>
							      <option value="1506">Welsh</option>
							      <option value="252">Other</option>
							      <option value="-"></option>
                                    <optgroup label="Popular languages">
                                        
                                            <option value="938" selected="selected">
                                            	English</option>
                                        
                                            <option value="939">
                                            	French</option>
                                        
                                            <option value="1446">
                                            	German</option>
                                        
                                            <option value="1456">
                                            	Italian</option>
                                        
                                            <option value="1457">
                                            	Japanese</option>
                                        
                                            <option value="1490">
                                            	Spanish</option>
                                        
                                    </optgroup>
                                    <optgroup label="Other Languages">
                                        
                                                <option value="1419">Afrikaans</option>
                                            
                                                <option value="1420">Albanian</option>
                                            
                                                <option value="1421">Amharic</option>
                                            
                                                <option value="1422">Arabic</option>
                                            
                                                <option value="1423">Armenian</option>
                                            
                                                <option value="1424">Assyrian</option>
                                            
                                                <option value="1425">Azerbaijani</option>
                                            
                                                <option value="1426">Bahasa Malay / Indonesian</option>
                                            
                                                <option value="1427">Belorussian</option>
                                            
                                                <option value="1429">Bulgarian</option>
                                            
                                                <option value="1430">Burmese</option>
                                            
                                                <option value="1431">Cebuano</option>
                                            
                                                <option value="1432">Chinese (Cantonese)</option>
                                            
                                                <option value="1433">Chinese (Mandarin)</option>
                                            
                                                <option value="1434">Creole</option>
                                            
                                                <option value="1435">Croatian</option>
                                            
                                                <option value="1436">Czech</option>
                                            
                                                <option value="1437">Danish</option>
                                            
                                                <option value="1438">Dutch</option>
                                            
                                                <option value="1440">Eritrean</option>
                                            
                                                <option value="1441">Estonian</option>
                                            
                                                <option value="1442">Farsi</option>
                                            
                                                <option value="1443">Finnish</option>
                                            
                                                <option value="1445">Georgian</option>
                                            
                                                <option value="1447">Greek</option>
                                            
                                                <option value="1449">Hausa</option>
                                            
                                                <option value="1450">Hebrew</option>
                                            
                                                <option value="945">Hindi</option>
                                            
                                                <option value="1452">Hungarian</option>
                                            
                                                <option value="1453">Icelandic</option>
                                            
                                                <option value="1454">Iilocano</option>
                                            
                                                <option value="1455">Inuktitut</option>
                                            
                                                <option value="1458">Kazakh</option>
                                            
                                                <option value="1459">Khmer</option>
                                            
                                                <option value="1460">Kirgiz</option>
                                            
                                                <option value="1461">Korean</option>
                                            
                                                <option value="1462">Kurdish</option>
                                            
                                                <option value="954">Kutchi</option>
                                            
                                                <option value="1463">Kyrgiz</option>
                                            
                                                <option value="1464">Laotian</option>
                                            
                                                <option value="1465">Latvian</option>
                                            
                                                <option value="1466">Lithuanian</option>
                                            
                                                <option value="1467">Macedonian</option>
                                            
                                                <option value="1468">Malagasy</option>
                                            
                                                <option value="1470">Maldivian</option>
                                            
                                                <option value="1471">Maltese</option>
                                            
                                                <option value="1473">Mongolian</option>
                                            
                                                <option value="1475">Norwegian</option>
                                            
                                                <option value="1476">Pashto</option>
                                            
                                                <option value="1477">Persian</option>
                                            
                                                <option value="1478">Pidgin</option>
                                            
                                                <option value="1479">Polish</option>
                                            
                                                <option value="1480">Portuguese</option>
                                            
                                                <option value="1481">Quechua</option>
                                            
                                                <option value="1482">Romanian</option>
                                            
                                                <option value="1483">Russian</option>
                                            
                                                <option value="1484">Serbian</option>
                                            
                                                <option value="1486">Sinhala</option>
                                            
                                                <option value="1487">Slovak</option>
                                            
                                                <option value="1488">Slovene</option>
                                            
                                                <option value="1489">Somali</option>
                                            
                                                <option value="1491">Swahili</option>
                                            
                                                <option value="1492">Swedish</option>
                                            
                                                <option value="1493">Tagalog</option>
                                            
                                                <option value="1496">Thai</option>
                                            
                                                <option value="1497">Tibetan</option>
                                            
                                                <option value="1498">Tongan</option>
                                            
                                                <option value="1499">Turkish</option>
                                            
                                                <option value="1500">Turkmen</option>
                                            
                                                <option value="1501">Ugaritic</option>
                                            
                                                <option value="1502">Ukrainian</option>
                                            
                                                <option value="1504">Uzbek</option>
                                            
                                                <option value="1505">Vietnamese</option>
                                            
                                                <option value="1506">Welsh</option>
                                            
                                                <option value="252">Other</option>
                                            
                                    </optgroup>
                                </select>* use Ctrl key for multiple selections
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
                    
                                
                                <option value="928" >None</option>
                            
                                
                                <option value="735" >Some</option>
                            
                                
                                <option value="734" >Good</option>
                            
                                
                                <option value="733">Very Good</option>
                            
                                
                                <option value="732" >Fluent</option>
                                <option value="-" selected="selected"></option>
                            
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
                    
                                
                                <option value="606" >Baha'ist</option>
                            
                                
                                <option value="607" >Buddhist</option>
                            
                                
                                <option value="608" >Christian</option>
                            
                                
                                <option value="642" >Hindu</option>
                            
                                
                                <option value="643">Islam</option>
                            
                                
                                <option value="649" >Jainism</option>
                            
                                
                                <option value="650" >Jewish</option>
                            
                                
                                <option value="667" >Parsi</option>
                            
                                
                                <option value="663" >Shintoism</option>
                            
                                
                                <option value="664" >Sikhism</option>
                            
                                
                                <option value="665" >Taoism</option>
                            
                                
                                <option value="252" >Other</option>
                            
                                
                                <option value="669" >No religion</option>
                                <option value="-" selected="selected"></option>
                            
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
                    
                                
                                <option value="825" >Accept polygamy</option>
                            
                                
                                <option value="827">Don't accept polygamy</option>
                            
                                
                                <option value="826" >Maybe accept polygamy</option>
                                <option value="-" selected="selected"></option>
                            
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