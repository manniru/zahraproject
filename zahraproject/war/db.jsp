<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date, java.util.Map"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Entities" %>

<%! public Connection cn = null; public DatastoreService ds; %>

<% System.out.println(application.getMajorVersion());

if(application.getMajorVersion()==3) {
	System.out.println("Jetty!");
	
	cn = DriverManager.getConnection("jdbc:derby://localhost:1527/agpdb", "admin", "13131");
}

else {
	ds = DatastoreServiceFactory.getDatastoreService();
	System.out.println("Gaej!");
}
%>