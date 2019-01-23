package com.tayal.master.action;


import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.tayal.master.actionforms.CrewBiodataForm;
import com.tayal.utility.DBConnection;

// STEP 1 OF ROTATE IMAGE
//public class LoginAction extends DispatchAction implements WebcamImageTransformer{


public class CrewBiodataAction extends DispatchAction{
	
	//private final BufferedImageOp filter = new JHFlipFilter(JHFlipFilter.FLIP_90CW);
	
	
	
	

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//CREW BIODATA FUNCTIONALITY BEGINS

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





public ActionForward initiateCrewBiodata(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> CrewBiodataAction - initiateCrewBiodata >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 
	 CrewBiodataForm fb = (CrewBiodataForm) form;
	 DBConnection db = new DBConnection();
	 	 
	 clearFormBean(fb);
	 populateDropDown(request);
	 
	 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< CrewBiodataAction - initiateCrewBiodata <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("CrewBiodata");
    return (forward);
}





public ActionForward getCrewBiodata(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> CrewBiodataAction - getCrewBiodata >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 
	 CrewBiodataForm fb = (CrewBiodataForm) form;
	 DBConnection db = new DBConnection();
	
	 clearFormBean(fb);
	
	 
	 if(fb.getFathername() == null)
	 {
		 System.out.println("Father Name NULL : ");
	 }
	 
	 populateDropDown(request);
 
	 
	 
	 try{
	 		 
	 		 String query = "SELECT * FROM Crew_Biodata WHERE USER_ID_V ='" + fb.getCrew_id() + "'";
	 		 System.out.println("Query  : " + query);
	 		 ResultSet rs  = db.executeQuery(query);	
	 		
	 		 if(rs.next())
	 		 {
	 			System.out.println("Gender : " + rs.getString("GENDER_V"));
	 			System.out.println("Desig : " + rs.getString("DESIG_V"));
	 			 fb.setFirstname(rs.getString("FIRST_NAME_V"));
	 			 fb.setLastname(rs.getString("LAST_NAME_V"));
	 			 fb.setDesig(rs.getString("DESIG_V"));
	 			 fb.setFathername(rs.getString("FATHER_NAME_V"));
	 			 fb.setGender(rs.getString("GENDER_V"));
	 			 fb.setBloodgroup(rs.getString("BLOOD_GROUP_V"));
	 			 fb.setAddress(rs.getString("ADDRESS_V"));
	 			 fb.setCity(rs.getString("CITY_V"));
	 			 fb.setState(rs.getString("STATE_V"));
	 			 fb.setPincode(rs.getString("PINCODE_I"));
	 			 fb.setMobile1(rs.getString("MOBILE1_I"));
	 			 fb.setMobile2(rs.getString("MOBILE2_I"));
	 			 fb.setEmergency_contact(rs.getString("EMERGENCY_CONTACT_V"));
	 			 fb.setEmergency_mobile(rs.getString("EMERGENCY_MOBILE_I"));
	 			 fb.setBiostatus(rs.getString("BIO_ENABLE_V"));
	 			 
	 			 String dobdate = rs.getString("DOB_D");
	 			 
	 			 String day = dobdate.substring(8, 10);
	 			 String month = dobdate.substring(5, 7);
	 			 String year = dobdate.substring(0, 4);
	 			 
	 			 fb.setDay(day);
	 			 fb.setMonth(month);
	 			 fb.setYear(year);
	 			
	 		 }
	 		 else
	 		 {
	 			 fb.setMessage("Crew ID not found");
	 		 }
	 		
	 		
	 		System.out.println("Message " + fb.getMessage());
	 		
	 	 }catch(Exception e)
	 	 {
	 		 e.printStackTrace();
	 	 }
	 	 finally
	 	 {		
	 		 db.closeCon();
	 	 }
	 
	 	String role = request.getSession().getAttribute("role").toString();
	 	System.out.println("Role : " + role);
	 	if(role.equals("ADMIN"))
	 		forward = mapping.findForward("CrewBiodata");
	 	else
	 		forward = mapping.findForward("CrewBiodataInfo");
	 
	 
	 
	 	 
	 
	 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< CrewBiodataAction - getCrewBiodata <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return (forward);
}




public ActionForward getBioStatus(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> CrewBiodataAction - getBioStatus >>>>>>>>>>>>>>>>>>>>>>");
	
	 CrewBiodataForm fb = (CrewBiodataForm) form;
	 DBConnection db = new DBConnection();
	 PrintWriter out = response.getWriter();
	 String query="";
	 try{
		 	
	 		 query = "SELECT * FROM Crew_Biodata WHERE USER_ID_V ='" + fb.getCrew_id() + "'";
	 		 ResultSet rs  = db.executeQuery(query);
	 		 String res = "NA";
	 		
	 		 if(rs.next())		// BIOMETRIC ENABLED FOR THIS CREW OR NOT
	 		 {	 			
	 			 res = rs.getString("BIO_ENABLE_V");	 
	 			 if(res.equals("Y"))
	 			 {
	 				query = "SELECT * FROM fp_data WHERE USER_ID_V ='" + fb.getCrew_id() + "'";
	 		 		 ResultSet rs2  = db.executeQuery(query);
	 		 		 if(rs2.next())			// FINGER PRINT AVAILABLE OR NOT
	 		 			 res = res + ":Y";
	 		 		 else
	 		 			 res = res + ":N";
	 			 }
	 			 else
	 				res = res + ":N";
	 			 
	 			 
	 			res = res + "@" + rs.getString("FIRST_NAME_V") + " " + rs.getString("LAST_NAME_V");
	 		 }
	 		 
	 		 
	 		 
	 		 out.println(res);
        	 out.flush();
        	 
        	 
        	 HttpSession session = request.getSession(true);			
 			 session.setAttribute("biostatus", res);
	 		
	 	 }catch(Exception e)
	 	 {
	 		 System.out.println("Error : " + e);
	 	 }
	 	 finally
	 	 {		
	 		 db.closeCon();
	 	 }
	 
	 
	 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< CrewBiodataAction - getBioStatus <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}





public void clearFormBean(CrewBiodataForm fb)
{
	
	 fb.setFirstname("");
	 fb.setLastname("");
	 fb.setDesig("");
	 fb.setFathername("");
	 fb.setGender("Select");
	 fb.setBloodgroup("");
	 fb.setAddress("");
	 fb.setCity("");
	 fb.setState("");
	 fb.setPincode("");
	 fb.setMobile1("");
	 fb.setMobile2("");
	 fb.setEmergency_contact("");
	 fb.setEmergency_mobile("");	 
	 fb.setDay("01");
	 fb.setMonth("01");
	 fb.setYear("1955");
	 
	 
	 
}







public ActionForward saveCrewBiodata(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> CrewBiodataAction - saveCrewBiodata >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 
	 CrewBiodataForm fb = (CrewBiodataForm) form;
	 DBConnection db = new DBConnection();
	 
	 String dobdate = fb.getDay() + "/" + fb.getMonth() + "/" + fb.getYear();
	 
	 System.out.println("dobdate : " + dobdate);
	 try{
	 		 
		
	 		 String query = "UPDATE Crew_Biodata set "
	 		 				+ "FIRST_NAME_V='" + fb.getFirstname() + "', "
	 		 				+ "LAST_NAME_V='" + fb.getLastname() + "', "
	 		 				+ "DESIG_V='" + fb.getDesig() + "', "
	 		 				+ "FATHER_NAME_V='" + fb.getFathername() + "', "
	 		 				+ "GENDER_V='" + fb.getGender() + "', "
	 		 				+ "DOB_D=STR_TO_DATE('" + dobdate + "','%d/%m/%Y'), "
	 		 				+ "BLOOD_GROUP_V='" + fb.getBloodgroup() + "', "
	 		 				+ "ADDRESS_V='" + fb.getAddress() + "', "
	 		 				+ "CITY_V='" + fb.getCity() + "', "
	 		 				+ "STATE_V='" + fb.getState() + "', "
	 		 				+ "PINCODE_I='" + fb.getPincode() + "', "
	 		 				+ "MOBILE1_I='" + fb.getMobile1() + "', "
	 		 				+ "MOBILE2_I='" + fb.getMobile2() + "', "
	 		 				+ "EMERGENCY_CONTACT_V='" + fb.getEmergency_contact() + "', "
	 		 				+ "EMERGENCY_MOBILE_I='" + fb.getEmergency_mobile() + "', " 
	 		 				+ "BIO_ENABLE_V='" + fb.getBiostatus() + "' WHERE USER_ID_V='" + fb.getCrew_id() + "'";
	 		 
	 		 
	 		 
	 		 
	 		 
	 		 
	 		 System.out.println("Query  : " + query);
	 		 int rs  = db.executeUpdate(query);
	 		 
	 		 if(rs == 1)	 		
	 		 {
	 			 if(fb.getBiostatus().equals("N"))
	 			 {
	 				 query = "SELECT * FROM USER_MAST WHERE USER_ID_V='" + fb.getCrew_id() + "'";
	 				 ResultSet res  = db.executeQuery(query);
	 		 		
	 		 		 if(res.next())
	 		 		 {	 			
	 		 			 // DO NOTHING	
	 		 		 }
	 		 		 else
	 		 		 {
	 		 			query = "INSERT INTO USER_MAST VALUES('" + fb.getCrew_id() + "','" + fb.getCrew_id() + "','XLX4QLYon9p5Q3PeaH9dwQ==','USER')";
	 		 			rs  = db.executeUpdate(query);
	 		 			
	 		 		 }
	 		 		 
	 		 		 
	 			 }
	 			 fb.setMessage("Record saved succefully");
	 		 }	 			
	 		 else
	 			fb.setMessage("Failure : Record not saved");
	 		 
	 		 
	 		 
	 	
		 
	 		 
	 		 
	 		 
	 		 
	 		
	 	 }catch(Exception e)
	 	 {
	 		 System.out.println("Error : " + e);
	 	 }
	 	 finally
	 	 {		
	 		 db.closeCon();
	 	 }
	 
	 
	 populateDropDown(request);
	 
	 
	 	 
	 
	 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< CrewBiodataAction - saveCrewBiodata <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("CrewBiodata");
    return (forward);
}




public void populateDropDown(HttpServletRequest request)
{
	
	
	 // POPULATE DROPDOWNS
	DBConnection db = new DBConnection();
	 
	 try{
		 
		 String crewid_query = "SELECT DISTINCT USER_ID_V FROM Crew_Biodata ORDER BY USER_ID_V";
		 String desig_query = "SELECT DESIG_V FROM DESIG_MST";
		 System.out.println("Query  : " + crewid_query);
		 //ResultSet rs1  = db.executeQuery(crewid_query);	
		 ArrayList crewlist = new ArrayList();
		 ArrayList daylist = new ArrayList();
		 ArrayList monthlist = new ArrayList();
		 ArrayList yearlist = new ArrayList();
		 ArrayList genderlist = new ArrayList();
		 ArrayList desiglist = new ArrayList();
		 ArrayList biostatuslist = new ArrayList();
		 
		 // CREW LIST DROPDOWN
		 
		 crewlist.add("Select");
//		 while(rs1.next())
//		 {
//			crewlist.add(rs1.getString("USER_ID_V"));
//		 }
//		 
		 
		 // DAY LIST DROPDOWN
		 for(int i=1;i<32;i++)
		 {
			 if(i<10)
				daylist.add("0" + i);
			 else
				daylist.add(i);
				 
		 }
			
		 // MONTH LIST DROPDOWN
		 for(int i=1;i<13;i++)
		 {
			if(i<10)
				monthlist.add("0" + i);
			 else
				monthlist.add(i);
		 }
	 		
		 // YEAR LIST DROPDOWN
		 for(int i=1955;i<2017;i++)
	 		yearlist.add(i);
		 
		 // GENDER LIST DROPDOWN
		 
		 genderlist.add("Select");
		 genderlist.add("Male");
		 genderlist.add("Female");
		 genderlist.add("Others");
		 
		 ResultSet rs2  = db.executeQuery(desig_query);	
		 desiglist.add("Select");
		 while(rs2.next())
		 {
			 desiglist.add(rs2.getString("DESIG_V"));
		 }
		
		 biostatuslist.add("Y");
		 biostatuslist.add("N");
		
		 
		 request.setAttribute("crewlist", crewlist);
		 request.setAttribute("daylist", daylist);
		 request.setAttribute("monthlist", monthlist);
		 request.setAttribute("yearlist", yearlist);
		 request.setAttribute("genderlist", genderlist);
		 request.setAttribute("desiglist", desiglist);
		 request.setAttribute("biostatuslist", biostatuslist);
		
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }

	 
	 
	 
}







}
















