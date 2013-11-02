package com.mannir.upload;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class Upload extends HttpServlet {
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	
    private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	String uid = req.getParameter("uid");
    	int uid2 = Integer.parseInt(uid);

        Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
        BlobKey blobKey = blobs.get("myFile");
        
      //  int uid2 = Integer.parseInt(uid);
    	String username="", pword="", fname="", lname="", mobileno="", gender="", dob="", email="", datereg="";
    	try {
    	Key ky = KeyFactory.createKey("USERS", uid2);
    	Entity en = ds.get(ky);
    	username = en.getProperty("username").toString();
    	pword = en.getProperty("password").toString();
    	fname = en.getProperty("firstname").toString();
    	lname = en.getProperty("lastname").toString();
    	mobileno = en.getProperty("mobileno").toString();
    	gender = en.getProperty("gender").toString();
    	dob = en.getProperty("dob").toString();
    	email = en.getProperty("email").toString();
    	datereg = en.getProperty("datereg").toString();
    	//System.out.println("ent="+en.getProperty("username"));
    	} catch(Exception e) { System.out.println(e); }

        if (blobKey == null) {
            res.sendRedirect("/");
        } else {
            res.sendRedirect("/serve?blob-key=" + blobKey.getKeyString());
            //
        	//int id = count("USERS")+1; //System.out.println("Key="+id);
        	Entity en = new Entity("USERS",uid2);
        	en.setProperty("blobkey", blobKey.getKeyString());
        	en.setProperty("firstname", fname);
        	en.setProperty("lastname", lname);
        	en.setProperty("mobileno", mobileno);
        	en.setProperty("password", pword);
        	en.setProperty("username", username);
        	en.setProperty("gender", gender);
        	en.setProperty("dob", dob);
        	en.setProperty("email", email);
        	en.setProperty("datereg", datereg);
        	ds.put(en);
        	
        	
        	//response.setStatus(response.SC_MOVED_TEMPORARILY); 
        	res.setHeader("Location", "/?p=account&uid="+uid);
        	//
        }
    }
    
    protected int count(String kind) { 
        Query query = new Query(kind); 
        PreparedQuery preparedQuery = ds.prepare(query); 
        return preparedQuery.countEntities(); 
}  
}