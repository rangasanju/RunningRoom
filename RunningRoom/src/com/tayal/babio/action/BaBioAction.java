package com.tayal.babio.action;


import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Vector;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.json.JSONArray;
import org.json.JSONObject;

import com.github.sarxos.webcam.Webcam;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.tayal.babio.actionforms.BaBioForm;
import com.tayal.utility.DBConnection;
import com.tayal.utility.DBConnectionRemote;

// STEP 1 OF ROTATE IMAGE
//public class LoginAction extends DispatchAction implements WebcamImageTransformer{


public class BaBioAction extends DispatchAction{
	
	//private final BufferedImageOp filter = new JHFlipFilter(JHFlipFilter.FLIP_90CW);
	
	
	
	
	
	


///////////////////////////////////////////////////////////////////////////////////////////////////	

/////    BIO FUNCTIONALITY BEGINS

///////////////////////////////////////////////////////////////////////////////////////////////////		



public ActionForward initiateBio(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  BioAction - initiateBio   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	 ActionForward forward = new ActionForward();
	 DBConnection db = new DBConnection();
	 DBConnectionRemote dbr;
	 Connection conn;
	 BaBioForm lf = (BaBioForm) form;
	 String crewid = lf.getCrewid().trim();
	 
	 System.out.println("Crew ID : " + crewid);
	 System.out.println("Reregistration : " + lf.getReregistration());
	 
	 
	 
	 ResultSet rs=null;
	 ResultSet rsr=null;
					
	 try{
		 
	
		 rs = db.executeQuery("SELECT * FROM FP_Data WHERE crewid_v='" + crewid + "'");	 
		 	 
		
		 if(rs.next())	// IF FP EXIST'S IN LOCAL DB
		 {
			 rs.last();
			 int count = rs.getRow();
			 
			 if(count == 2) // IF THERE ARE EXACTLY 2 RECORDS
			 {
				 rs.first();
				 System.out.println("Verification");
				 String finger = rs.getString("finger_v");
				 System.out.println("First Finger : " + finger);
				 lf.setFirst_finger(finger);
				 
				 rs.next();
				 finger = rs.getString("finger_v");
				 System.out.println("Second Finger : " + finger);
				 lf.setSecond_finger(finger);
				 
	 
				 
				 forward = mapping.findForward("biover");
			 }
			 else // IF THERE ARE NOT EXACTLY 2 RECORDS , DATA IS INCONSISTENT - DELETE EXISTING DATA AND GO FOR FRESH REGISTRATION
			 {
				 db.executeUpdate("DELETE FROM FP_Data WHERE crewid_v='" + crewid + "'");	
				 System.out.println("Registration 1");
				 forward = mapping.findForward("bioreg");
				 
			 }
			 
			
			 
			
		 }else if(!lf.getReregistration().equals("true"))		// IF FP DOESNT EXIST IN LOCAL DB , CHECK IN CENTRAL DB
		 {
			 
			 rs = db.executeQuery("SELECT peer_ip_v FROM peers");
			 
			 if(rs.next())  // IF CENTRAL SERVER IP IS CONFIGURED IN THIS THIN CLIENT
			 {
				 try{
								 
					 String output = getFPData(rs.getString("peer_ip_v"),crewid);
					 
					
					 
					 if(output.equals("[null]"))	// IF FP NOT FOUND ON CENTRAL SERVER - START REGISTRATION
					 {
						 System.out.println("WS returned null");
						 forward = mapping.findForward("bioreg");
					 }
					 else							// IF FP FOUND ON CENTRAL SERVER
					 {
						 
						 	// PARSE THE JASON OUTPUT
						 
								 parseJSONOutput(output,crewid);
							     
								 lf.setFirst_finger(finger_no[0]);
								 lf.setSecond_finger(finger_no[1]);
								 
								 
								 forward = mapping.findForward("biover");
						 
					 }
						 
								 
					 } 
					 catch(Exception e) 
					 {
					     
						 e.printStackTrace();
						 System.out.println("could not connect to remote");
						 forward = mapping.findForward("bioreg");
					        
					 } 	 
								 
								 
						 
						 
						 
			 }else	// IF CENTRAL SERVER IP IS NOT CONFIGURED IN THIS THIN CLIENT
			 {
				
				 System.out.println("Centeral Server not configured");
				 forward = mapping.findForward("bioreg");
			 }
			 
			
		 }else	// IF IT IS A CASE OF RE-REGISTRATION
		 {
				
			 System.out.println("Re - Registration ");
			 forward = mapping.findForward("bioreg");
		 }
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {
		 rs.close();
		 db.closeCon();
		 
	 }
	
	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  BioAction - initiateBio   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}
	
	
	
	




public ActionForward BioReg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> BioAction -  BioReg   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	PrintWriter out = response.getWriter();
	DBConnection db = new DBConnection();
	
	
	BaBioForm lf = (BaBioForm) form;
	 String crewid = lf.getCrewid().trim();
	 
	 
	 System.out.println("Crew ID : " + crewid);
	 String finger = lf.getFinger().trim();
	 System.out.println("Finger : " + finger);
	 String reregistration = lf.getReregistration();
	 System.out.println("reregistration : " + reregistration);
	 try {
		 
			 ResultSet rs = db.executeQuery("SELECT * FROM Devices_Enable WHERE Device_Type_v='BIO'");
			 
			 if(rs.next())
				 lf.setTimeout(rs.getString("Timeout_value_v").trim() + "000");
			 else
				 lf.setTimeout("10000");		// DEFAULT TIMEOUT 10 SEC
		 } 
		 catch(Exception e) 
		 {
		     e.printStackTrace();
			 System.out.println("Timeout Exception " + e);
			        
		 }finally
		 {
			 db.closeCon();
		 }
	  	 
	 
	
	
	try{
		
		killProcess("bio");
		String dummy_value="N"; // USED FOR DIFFERENCIATING THE RE-REGISTRATION CASE
		
		if(reregistration.equals("true"))
		{
			dummy_value = "R"; // SPECIFIES THE RE-REGISTRATION CASE
		}
	        
		 ProcessBuilder pb = new ProcessBuilder("./bio","R",crewid,finger,dummy_value,lf.getTimeout());  //DM is just a dummy value
		 pb.directory(new File("/usr/local"));
		
		
	    java.lang.Process p = pb.start();
	
	    String line;			
	    BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
	  
		    
	    while ((line = r.readLine()) != null) {
        		out.println(line);
        		out.flush();
        	System.out.println("Line : " + line);
        }
	      
	   
	        r.close();
	        
	        
	        
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
	}finally
	 {
		out.close();
	 }

	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< BioAction -  BioReg   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");


return null;




}


public ActionForward BioVer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> BioAction -  BioVer   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	
	 ResultSet rs=null;
	 BaBioForm lf = (BaBioForm) form;
	 String crewid = lf.getCrewid().trim();
	 DBConnection db = new DBConnection();
	 
	 System.out.println("Crew ID : " + crewid);
	 String first_finger = lf.getFirst_finger().trim();
	 System.out.println("First Finger : " + first_finger);
	
	 
	 String second_finger = lf.getSecond_finger().trim();
	 System.out.println("Second Finger : " + second_finger);
	
	
	 PrintWriter out = response.getWriter();
	
	 
	 try {
		 
		 rs = db.executeQuery("SELECT * FROM Devices_Enable WHERE Device_Type_v='BIO'");
		 
		 if(rs.next())
			 lf.setTimeout(rs.getString("Timeout_value_v").trim() + "000");
		 else
			 lf.setTimeout("10000");		// DEFAULT TIMEOUT 10 SEC
	 } 
	 catch(Exception e) 
	 {
	     e.printStackTrace();
		 System.out.println("Timeout Exception " + e);
		        
	 }finally
	 {
		 db.closeCon();
	 }
  	  	 
 

	 
	 
	 
	
	try{
		        
		killProcess("bio");
		 ProcessBuilder pb = new ProcessBuilder("./bio","V",crewid,first_finger,second_finger,lf.getTimeout());
		 pb.directory(new File("/usr/local"));
		
		
	    java.lang.Process p = pb.start();
	
	    String line;			
	    BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
	  
		    
	    while ((line = r.readLine()) != null) {
	    	
        		out.println(line);
        		out.flush();
        		
        		
        		if(line.contains("<<NO MATCH>>")) // IF VERIFICATION FAILS, DOWNLOAD THE LATEST FINGRE PRINTS
        		{
        			
        			 rs = db.executeQuery("SELECT peer_ip_v FROM peers");
        			 
        			 if(rs.next())  // IF CENTRAL SERVER IP IS CONFIGURED IN THIS THIN CLIENT
        			 {
        				 try{
        								 
        					 String output = getFPData(rs.getString("peer_ip_v"),crewid);
        					 
        					 if(!output.equals("[null]"))	// IF FP NOT FOUND ON CENTRAL SERVER - START REGISTRATION
        					 {
        						// PARSE THE JASON OUTPUT
								 parseJSONOutput(output,crewid);
							     
        					 }
        					
        					 } 
        					 catch(Exception e) 
        					 {        					     
        						 e.printStackTrace();
        						 System.out.println("could not connect to remote");        					        
        					 } 	 
        							        			
        			 }
        		}
        		System.out.println("Line : " + line);
	    }
	   
	        r.close();
	        
	        
	        
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
	}finally
	 {
		 out.close();
	 }
 	 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  BioAction - BioVer   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");


return null;




}


///////////////////////////////////////////////////////////////////////////////////////////////////	

/////    BIO FUNCTIONALITY ENDS

///////////////////////////////////////////////////////////////////////////////////////////////////		
	
	
	



///////////////////////////////////////////////////////////////////////////////////////////////////	

/////    BA FUNCTIONALITY BEGINS

///////////////////////////////////////////////////////////////////////////////////////////////////		




public ActionForward initiateBA(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateBA   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	 ActionForward forward = new ActionForward();
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateBA   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");

	 
    forward = mapping.findForward("ba");
    return (forward);

}
	
	
	




public ActionForward startBreath(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{

 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  startBreath   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");


 PrintWriter out = response.getWriter();
 BaBioForm lf = (BaBioForm) form;
 DBConnection db = new DBConnection();
 

 lf.setTimeout("10");		// DEFAULT TIMEOUT 10 SEC


//FIND AND KILL PREVIOUS UNCOMPLETED ba PROCESS IF ANY -- THIS IS JUST TO BE SURE, 
	// BECAUSE PARALLEL ba PROCESSES ARE CAUSING PROBLEMS
try{
	
	
	 killProcess("ba");
	 ProcessBuilder pb = null;       
	
		 pb = new ProcessBuilder("./ba","1",lf.getTimeout());
	 
	 
	pb.directory(new File("/usr/local"));
	
	
    java.lang.Process p = pb.start();

    String line="";			
    BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
    boolean clicked = false;

    System.out.println("cHECK 1 : ");
    
    
   
    		while (!(line.contains("Exhale time") ) && (line = r.readLine()) != null) {
        		System.out.println("Line : " + line);
            	out.println(line);
            	out.flush();            	
            }
    
      
    
	out.flush();
	     
    r.close();
    out.close();
   
        
        
        
}catch(Exception e)
{
	System.out.println("Ex : " + e);
}

System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  startBreath   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
System.out.println("\n\n\n\n\n");


return null;




}











///////////////////////////////////////////////////////////////////////////////////////////////////	

/////    BA FUNCTIONALITY ENDS

///////////////////////////////////////////////////////////////////////////////////////////////////		






























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



public ActionForward initiateReRegistration(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateReRegistration   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	 
	 ActionForward forward = new ActionForward();
	
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateReRegistration   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");

	 
    forward = mapping.findForward("reregcrew");
    return (forward);



}






public ActionForward reRegister(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  reRegister   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	 ActionForward forward = new ActionForward();
	 DBConnection db = new DBConnection();
	 
	 BaBioForm lf = (BaBioForm) form;
	 String crewid = lf.getCrewid().trim();
	 lf.setReregistration("true");
	 
	 System.out.println("Crew ID : " + crewid);
	 
	 int rowcount=0;
	 
	 try{
		 
		 rowcount = db.executeUpdate("DELETE FROM FP_Data WHERE crewid_v='" + crewid + "'");				
		 
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  reRegister   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
	forward = mapping.findForward("rereg");
    return (forward);



}





public ActionForward deleteFPData(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  deleteFPData   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	 DBConnection db = new DBConnection();
	 PrintWriter out = response.getWriter();
	 BaBioForm lf = (BaBioForm) form;
	 String crewid = lf.getCrewid().trim();
	 lf.setReregistration("true");
	 
	 System.out.println("Crew ID : " + crewid);
	 
	 int rowcount=0;
	 
	 try{
		 
		 rowcount = db.executeUpdate("DELETE FROM FP_Data WHERE crewid_v='" + crewid + "'");	
		 
		 if(rowcount > 0)
			 out.println("success");
		 else
			 out.println("fail");
     	out.flush();
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  deleteFPData   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    return null;



}



String[] finger_no = new String[2];
String[] finger_print = new String[2];


public void parseJSONOutput(String output, String crewid)
{
	 DBConnection db = new DBConnection();
	 Connection conn;
	 
	 // PARSE THE JASON OUTPUT
	 
	 try {
	 //System.out.println("Output from Server .... \n");
	 //System.out.println(output);
	 output =  "{\"fpdata\":" + output + "}";
	 
	 //System.out.println(output);
	 JSONObject jsonobject = new JSONObject(output);		
	 JSONArray tsmarray = (JSONArray) jsonobject.get("fpdata");
	 
	 
	 
	 // EXTRACT THE VALUES
	    finger_no[0] = tsmarray.getJSONObject(0).getString("left_fingre_no");
	    finger_no[1] = tsmarray.getJSONObject(0).getString("right_fingre_no");
	    
	    finger_print[0] = tsmarray.getJSONObject(0).getString("left_print");
	    finger_print[1]	= tsmarray.getJSONObject(0).getString("right_print");
	    
	    
	    byte[] imgarr = null;
	    ByteArrayInputStream bis = null;
	    
	    
	    conn = db.getConnection();  // LOCAL DB
		PreparedStatement ps = null;
		String query = "insert into FP_Data(crewid_v ,finger_v ,fingerprint_B,Device_Name_v,synched) values (?, ?, ?, ?, ?)";
		 
		 
		 
			 
			 for(int i=0; i<2; i++){
			    	System.out.println("Finger No : " + finger_no[i]);
			    	System.out.println("Finger Pr : " + finger_print[i]);
			    	
			    	imgarr = Base64.decodeBase64(finger_print[i]);
				    bis = new ByteArrayInputStream(imgarr);
					
					
			    	
			    	conn.setAutoCommit(false);
			        
			        ps = conn.prepareStatement(query);
			        ps.setString(1, crewid);
			        ps.setString(2, finger_no[i]);
			        ps.setBinaryStream(3, bis);
			        ps.setString(4, "Bio");
			        ps.setString(5, "Y");
			        ps.executeUpdate();
			        conn.commit();
			       
			        imgarr = null;
			        bis = null;
			        
			    }
			 
			 ps.close();
		     conn.close();
		
		 } 
		 catch(Exception e)
		 {
			 System.out.println("Error : " + e);
		 }
		 finally 
		 {
		       
		        
		 } 
		 
	
}





public String getFPData(String webservice_ip, String crewid)
{
	String output="";
	
	 try{
		 System.out.println("Connecting to WS " );
		 
		 String myurl = "http://" + webservice_ip + "/cmsfpws/getfpdata/'" + crewid +"'" ;                                
		 Client client = Client.create();
		 WebResource webresource = client.resource(myurl);					 
		 ClientResponse response1 = webresource.accept("application/json").get(ClientResponse.class);
		 
		 if(response1.getStatus() != 200)
		 {
			 return "failed";
			 
		 }
		 
		 
		 output = response1.getEntity(String.class);
		 
		 System.out.println("Server Output : " + output);

		 
		 

					 
		 } 
		 catch(Exception e) 
		 {
		     
			 e.printStackTrace();
			 System.out.println("could not connect to remote");
			 
		        
		 } 	 
	
	 return output;
}




	
public void result(String res)
{
	System.out.println("Check 1 : " + res);

	if(res.contains("mg/100ml"))
	{
		//System.out.println("Check 2 : " + res);
		String val = res.substring(0, res.indexOf("mg/100ml"));
		//System.out.println("result : " + val);
	}
	
	
	
}
	





public ActionForward Execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> LoginAction - Execute1 >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 BaBioForm fb = (BaBioForm) form;
	  System.out.println("Crew Id : " + fb.getCrewid());
	 
	  
	  DBConnection db = new DBConnection();
		 
		 int rowcount=0;
		 
		 try{
			 
			 rowcount = db.executeUpdate("DELETE FROM FP_Data WHERE crewid_v='TEST'");				
			 
			
			 
		 }catch(Exception e)
		 {
			 System.out.println("Error : " + e);
		 }
		 finally
		 {		
			 db.closeCon();
		 }
		
		 
		 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< LoginAction - Execute <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("welcome");
    return (forward);
}










public ActionForward isBioEnabled(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{

 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  isBioEnabled   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

 response.setContentType("text/javascript");
 PrintWriter out = response.getWriter();
 String jsonPoutput ="";
 String callBackJavaScripMethodName="";
 DBConnection db = new DBConnection();  



try{

    		String line="N";			
    		callBackJavaScripMethodName = request.getParameter("callback");
    		
    		
    		  		
    		String query = "SELECT * FROM Devices_Enable WHERE Device_Type_v='BIO'";    		
    		
    		ResultSet rs = db.executeQuery(query);
    		
    		while(rs.next())
    		{
    			line = rs.getString("Enable_v");
    			
    			jsonPoutput += "{\"data\":'" + line + "'}";
    			jsonPoutput = callBackJavaScripMethodName + "("+ jsonPoutput + ");";
    			System.out.println("jsonPoutput : " + jsonPoutput);
    		}
       
    		 out.println(jsonPoutput);
        	 out.flush();
        	
        	
        	System.out.println("Line : " + line);
        	result(""+line);
      
       
      
   
        	rs.close();
        
        
        
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	jsonPoutput += "{\"data\":'N'}";
	jsonPoutput = callBackJavaScripMethodName + "("+ jsonPoutput + ");";
	 out.println(jsonPoutput);
	 out.flush();
	
	
}finally 
{
	 db.closeCon();
	 out.close();
}
	 


System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  isBioEnabled   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
System.out.println("\n\n\n\n\n");


return null;




}








public ActionForward isBAEnabled(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{

 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  isBAEnabled   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

 response.setContentType("text/javascript");
 PrintWriter out = response.getWriter();
 String jsonPoutput ="";
 String callBackJavaScripMethodName ="";
 DBConnection db = new DBConnection();    	



try{

    		String line="N";			
    	    callBackJavaScripMethodName = request.getParameter("callback");
    		
    		
    			
    		String query = "SELECT * FROM Devices_Enable WHERE Device_Type_v='BA'";    		
    		
    		ResultSet rs = db.executeQuery(query);
    		
    		while(rs.next())
    		{
    			line = rs.getString("Enable_v");
    			
    			jsonPoutput += "{\"data\":'" + line + "'}";
    			jsonPoutput = callBackJavaScripMethodName + "("+ jsonPoutput + ");";
    			System.out.println("jsonPoutput : " + jsonPoutput);
    		}
       
    		 out.println(jsonPoutput);
        	 out.flush();
        	
        	
        	System.out.println("Line : " + line);
        	result(""+line);
      
       
      
   
        	rs.close();
        
        
        
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	jsonPoutput += "{\"data\":'N'}";
	jsonPoutput = callBackJavaScripMethodName + "("+ jsonPoutput + ");";
	 out.println(jsonPoutput);
	 out.flush();
}finally
{
	 db.closeCon();
	 out.close();
}


System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  isBAEnabled   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
System.out.println("\n\n\n\n\n");


return null;


}


private boolean executeCommand(String arg) {

    
    boolean connected=false;
	StringBuffer output = new StringBuffer();

	Process p=null;
	BufferedReader reader = null;
	try {
		p = Runtime.getRuntime().exec("lsusb");
		p.waitFor();
		reader =  new BufferedReader(new InputStreamReader(p.getInputStream()));

                    String line = "";			
		while ((line = reader.readLine())!= null) {
                        if(line.contains(arg))
                        {
                            connected=true;
                            break;
                        }
                                          
			output.append(line + "\n");
		}
		reader.close();
	} catch (Exception e) {
		e.printStackTrace();
	}finally
	{		
		p.destroy();
		
	} 	
            
	return connected;

}

public ActionForward killProcess(String process)throws Exception
{

 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  killProcess   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

 
 ProcessBuilder pb = null;
 Process pr = null;	
	try {
	    Vector<String> commands = new Vector<String>();
	    commands.add("pidof");
	    commands.add(process);
	    pb = new ProcessBuilder(commands);
	    
	    pr = pb.start();
	    pr.waitFor();
	    if (pr.exitValue() == 0){ 
	    BufferedReader outReader = new BufferedReader(new InputStreamReader(pr.getInputStream()));
	    for (String pid : outReader.readLine().trim().split(" ")) {
	        //log.info("Killing pid: "+pid);
	        Runtime.getRuntime().exec("kill " + pid).waitFor();
	    }
	    outReader.close();
	    
	    }
	   
	    
	} catch (Exception e) {
	    e.printStackTrace();
	}finally
	{		
		pr.destroy();
		
	} 	



System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  killProcess   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
System.out.println("\n\n\n\n\n");


return null;




}



}
















