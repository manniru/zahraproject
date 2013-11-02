<%@include file="zahramatchmaking.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8;charset=utf-8" />
<title>eMatchmaking System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8;charset=utf-8" />
<style type="text/css" media="all">@import "p1_files/node0000.css";</style>
<style type="text/css" media="all">@import "p1_files/poll0000.css";</style>
<style type="text/css" media="all">@import "p1_files/defaults.css";</style>
<style type="text/css" media="all">@import "p1_files/system00.css";</style>
<style type="text/css" media="all">@import "p1_files/user0000.css";</style>
<style type="text/css" media="all">@import "p1_files/chatroom.css";</style>
<style type="text/css" media="all">@import "p1_files/style000.css";</style>
  <script type="text/javascript" src="p1_files/jquery00.js"></script>
<script type="text/javascript" src="p1_files/drupal00.js"></script>
<script type="text/javascript" src="p1_files/chatroom.js"></script>



    <link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="themes/1/tooltip.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/tooltip.js" type="text/javascript"></script>
    <link href="generic.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        imageSlider.thumbnailPreview(function (thumbIndex) { return "<img src='images2/thumb" + (thumbIndex + 1) + ".jpg' style='width:70px;height:44px;' />"; });
    </script>
   
   
   
  <link rel="stylesheet" href="/jquery/jquery-ui.css" />
  <script src="/jquery/jquery-1.9.1.js"></script>
  <script src="/jquery/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
  $(function() {
    $( "#dob" ).datepicker();
  });
  </script>   
   
<script type= "text/javascript" src = "/mannir/countries.js"></script>  
   
   
   

   
    
</head>
<body class="">
<div id="body2">
<a name="top"></a>
  <div id="wrapper">
  <div id="header"> 
     <h1 class='site-name'>
      <a href="/" title="Home">
      eMatchmaking System</a></h1>
     
    <div id="logo"><a href="/" title="Home"></a></div>

<%= menus("user") %>
    </div>

  <div id="page2"><div id="page3">
    
<div id='msg' align="center" style="font-size:20px; color:red"><b></b><%=msg %></b></div>   

  
<% if(request.getParameter("p") == null && request.getParameter("add")==null) { %>
<div align="center"><%@include file="slider.html" %></div><%@include file="_slide.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("register")) { %><%= register(user) %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("members")) { %><%= members(user) %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("account")) { %><%= account(user) %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("account/edit")) { %><%= editaccount(user) %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("login")) { %><%@include file="_login.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("aboutus")) { %><%@include file="_aboutus.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("forums")) { %><%@include file="_forums.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("contactus")) { %><%@include file="_contactus.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("chatroom")) { %><%@include file="_chatroom.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("profileedit")) { %><%@include file="_profileedit.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("profileview")) { %><%@include file="_profileview.jsp" %><% } %>

<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("upload")) { %><%@include file="_upload.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("password")) { %><%@include file="_password.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("videochat")) { %><%@include file="_videochat.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("upload")) { %><%@include file="_upload.jsp" %><% } %>
<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("message")) { %><%@include file="_message.jsp" %><% } %>

<% if(request.getParameter("p") != null && request.getParameter("p").equalsIgnoreCase("search")) { %>
<%= search(user) %><% } %>


<div id="sidebar-right" class="clearfix">
      
      

<% System.out.println(user);
if(session.getAttribute("uid") != null) { 
	out.println(usermenu(user));
	//out.println(loginblock(user));
	} else { out.println(loginblock(user)); //out.println(usermenu(user));
	} %>



<%= navigation("user") %>

</div>
        <br clear="all"/>
    <span class="clear"></span>
  </div>
  </div>
  </div>
  </div>
  <div id="footer"> Copyright &copy; 2013 ZAHRAU SHARU MAIGARI (000796278)
<br/>
  </div>
  <div id="footer2">
   
</body>
</html>