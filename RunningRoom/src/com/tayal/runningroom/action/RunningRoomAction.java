package com.tayal.runningroom.action;





import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.tayal.runningroom.actionforms.MessReportForm;
import com.tayal.runningroom.actionforms.RunningRoomForm;
import com.tayal.runningroom.actionforms.RunningRoomReportForm;
import com.tayal.utility.DBConnection;

// STEP 1 OF ROTATE IMAGE
//public class LoginAction extends DispatchAction implements WebcamImageTransformer{


public class RunningRoomAction extends DispatchAction{
	
	//private final BufferedImageOp filter = new JHFlipFilter(JHFlipFilter.FLIP_90CW);
	
	







public ActionForward initiateRunningRoom(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateRunningRoom   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	
	String crewid = rf.getCrew_id();
	String location = request.getSession().getAttribute("location").toString();

	// FIND OUT IF CREW IS ALREAFY CHECK IN 
	
	if(!(crewid == null || crewid.equals("")) )   // CREWID IS NULLL FOR ADMIN
	{
		try{
			String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "'";
			ResultSet rs2 = db.executeQuery(query1);
			
			if(rs2.next())
			{
				rf.setBooked("Y");	
				rf.setBookedroom(rs2.getString("ROOM_NO_I"));
				rf.setBookedbed(rs2.getString("BED_NO_I"));
			}					
			else
				rf.setBooked("N");
			
			
		}catch(Exception e)
		{
			System.out.println("Ex : " + e);
			
		}
		finally
		{
			db.closeCon();
		}
	}

	
	String role = request.getSession().getAttribute("role").toString();
 	if(role.equals("ADMIN") || role.equals("DIVISIONADMIN"))
 	{
 		rf.setCrew_id("");
 		forward = mapping.findForward("RunningRoomAdmin");
 	}
 	else if(role.equals("OPERATOR"))
 	{
 		forward = mapping.findForward("RunningRoomOperator");
 	}
 	else
 		forward = mapping.findForward("runningroom");
 
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateRunningRoom   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}


public ActionForward initiateCategoryOptions(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateCategoryOptions   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	forward = mapping.findForward("CategoryOptions");
	RunningRoomForm rf = (RunningRoomForm) form;
	DBConnection db = new DBConnection(); 
	ArrayList<String> cat_list = new ArrayList<String>();
	try{
		
		String location = request.getSession().getAttribute("location").toString();
		
		String query1 = "SELECT CATEGORY_V FROM CREW_CAT_MST WHERE LOCATION_ID_V='" + location + "'";
		ResultSet rs2 = db.executeQuery(query1);
		
		while(rs2.next())
		{			
			cat_list.add(rs2.getString("CATEGORY_V"));
		}					
		
		
		rf.setCategory_list((String[])cat_list.toArray(new String[cat_list.size()]));
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		db.closeCon();
	}
	
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateCategoryOptions   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);
}






public ActionForward initiateSubsidyOptions(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateSubsidyOptions   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	forward = mapping.findForward("SubsidyOptions");
 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateSubsidyOptions   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);
}






public ActionForward initiateMess(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateMess   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
		
 	String crewid = rf.getCrew_id();
 	String subsidy = rf.getSubsidy();
 	String meal_type_availed="";
 	String food_type_availed="";
 	
 	String location = request.getSession().getAttribute("location").toString();
 	String crewname = request.getSession().getAttribute("crewname").toString();
 	rf.setCrewname(crewname);
 	
 	
		rf.setBreakfast("N");	
		rf.setLunch("N");
		rf.setDinner("N");
		rf.setParcel("N");
		rf.setBreakfast_cat("VEG");
		rf.setLunch_cat("VEG");
		rf.setDinner_cat("VEG");
	
 	
 	try{
		String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "'";
		ResultSet rs2 = db.executeQuery(query1);
		
		if(rs2.next())
		{			
			
			query1 = "SELECT * FROM MESS_AVAILED_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "' AND DATE(DATE_TIME_D)=DATE(NOW())";
			ResultSet rs = db.executeQuery(query1);
			
			while(rs.next())
			{
				meal_type_availed = rs.getString("MEAL_TYPE_V");
				food_type_availed= rs.getString("FOOD_TYPE_V");
				
				rf.setSubsidy(rs.getString("SUBSIDY_V"));
				
				if(meal_type_availed.equals("BREAKFAST"))
				{
					rf.setBreakfast("Y");
					rf.setBreakfast_availed("Y");					
					rf.setBreakfast_cat(food_type_availed);
					
				}
									
				
				if(meal_type_availed.equals("LUNCH"))
				{
					rf.setLunch("Y");
					rf.setLunch_availed("Y");
					rf.setLunch_cat(food_type_availed);
					
				}
					
				
				if(meal_type_availed.equals("DINNER"))
				{
					rf.setDinner("Y");
					rf.setDinner_availed("Y");
					rf.setDinner_cat(food_type_availed);
				}
					
				
				if(meal_type_availed.equals("PARCEL"))
				{
					rf.setParcel("Y");
					rf.setParcel_availed("Y");
				}
					
				
			}
			
			
			
			forward = mapping.findForward("mess");
		}
		else
		{
			
			rf.setMessage("You are not Checked-In");
			forward = mapping.findForward("CrewOptions");
		}
		
		
		
		
 	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
 	finally
	{
		db.closeCon();
	}
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateMess   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
	
    return (forward);



}



public ActionForward saveMessOptions(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  saveMessOptions   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	String meal_type = rf.getMeal_type();
	DBConnection db = new DBConnection(); 
	ArrayList<String> queries = new ArrayList<String>();
	
	String subsidy = rf.getSubsidy();
	String crewid = rf.getCrew_id();
	String location = request.getSession().getAttribute("location").toString();
	String breakfast = rf.getBreakfast();
	String breakfast_availed=rf.getBreakfast_availed();		// TO CHECK IF THE CREW HAS ALREADY AVAILED THIS MEAL FOR THE DAY
	String breakfast_cat = rf.getBreakfast_cat();
	String breakfast_qty = rf.getBreakfast_qty();
	String lunch = rf.getLunch();
	String lunch_availed=rf.getLunch_availed();			// TO CHECK IF THE CREW HAS ALREADY AVAILED THIS MEAL FOR THE DAY
	String lunch_cat = rf.getLunch_cat();
	String lunch_qty = rf.getLunch_qty();
	String dinner = rf.getDinner();
	String dinner_availed=rf.getDinner_availed();			// TO CHECK IF THE CREW HAS ALREADY AVAILED THIS MEAL FOR THE DAY
	String dinner_cat = rf.getDinner_cat();
	String dinner_qty = rf.getDinner_qty();
	String parcel = rf.getParcel();
	String parcel_availed=rf.getParcel_availed();			// TO CHECK IF THE CREW HAS ALREADY AVAILED THIS MEAL FOR THE DAY
	String check_in_date="";

	
	
	
try {
	
	
	
	//STR_TO_DATE('" + wakeuptime + "','%d/%m/%Y %H:%i')
try{
		
		String query1 = "SELECT CHECK_IN_D FROM BED_ALLOCATION_MST  WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "'";
		ResultSet rs = db.executeQuery(query1);
		if(rs.next())
			check_in_date = rs.getString("CHECK_IN_D").substring(0, 19);
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	
	

try{	
		
	String query ="";
//	String query = "INSERT INTO BED_ALLOCATION_HIS (SELECT *,CURRENT_TIMESTAMP FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "')";
// 	queries.add(query);
//	query = "UPDATE BED_ALLOCATION_MST SET BREAKFAST_V='" + breakfast + "', BREAKFAST_CAT_V='" + breakfast_cat + "', BREAKFAST_QTY_I=1, LUNCH_V='" + lunch + "', "
//				+ "LUNCH_CAT_V='" + lunch_cat + "', LUNCH_QTY_I=1, DINNER_V='" + dinner + "', DINNER_CAT_V='" + dinner_cat + "', DINNER_QTY_I=1, SUBSIDY_V='" + subsidy + "' WHERE LOCATION_ID_V='" + location + "' "
//				+ "AND USER_ID_V='" + crewid + "'";		
//		
//	queries.add(query);
	
	
	if(breakfast.equals("Y") && !breakfast_availed.equals("Y"))
	{
		query="INSERT INTO MESS_AVAILED_MST VALUES('" + crewid + "',STR_TO_DATE('" + check_in_date + "','%Y-%m-%d %H:%i:%s'),'" + location + "','BREAKFAST','" + breakfast_cat + "',1,'" + subsidy + "',CURRENT_TIMESTAMP)";
		queries.add(query);
		
	}
	
	

	if(lunch.equals("Y") && !lunch_availed.equals("Y"))
	{
		query="INSERT INTO MESS_AVAILED_MST VALUES('" + crewid + "',STR_TO_DATE('" + check_in_date + "','%Y-%m-%d %H:%i:%s'),'" + location + "','LUNCH','" + lunch_cat + "',1,'" + subsidy + "',CURRENT_TIMESTAMP)";
		queries.add(query);
	}
	
	System.out.println("dinner_availed : " + dinner_availed);
	

	if(dinner.equals("Y") && !dinner_availed.equals("Y"))
	{
		query="INSERT INTO MESS_AVAILED_MST VALUES('" + crewid + "',STR_TO_DATE('" + check_in_date + "','%Y-%m-%d %H:%i:%s'),'" + location + "','DINNER','" + dinner_cat + "',1,'" + subsidy + "',CURRENT_TIMESTAMP)";
		queries.add(query);
		
	}
	



	if(parcel.equals("Y") && !parcel_availed.equals("Y"))
	{
		query="INSERT INTO MESS_AVAILED_MST VALUES('" + crewid + "',STR_TO_DATE('" + check_in_date + "','%Y-%m-%d %H:%i:%s'),'" + location + "','PARCEL','PARCEL',1,'" + subsidy + "',CURRENT_TIMESTAMP)";
		queries.add(query);
		
	}
	

	
	
	
		int res = db.executeMyBatch(queries);
    	System.out.println("Rows Updated : " + res);
    		
    	if( res > 0)
    		rf.setMessage("Mess option saved succesfully");
    	else if( res == 0)
    		rf.setMessage("Nothing to save");
    	else
    		rf.setMessage("Failure : Please report to supervisor");
    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}




}
catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}
	

	
	forward = mapping.findForward("CrewOptions");
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  saveMessOptions   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}






public ActionForward initiateCrewBookingByAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateCrewBookingByAdmin   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	
	
 	forward = mapping.findForward("crewbookingpage");
    
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateCrewBookingByAdmin   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}



public ActionForward getMenu(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getMenu   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	DBConnection db = new DBConnection(); 
	
	PrintWriter out = response.getWriter();
	String location = request.getSession().getAttribute("location").toString();

	String weekday = LocalDate.now().getDayOfWeek().name();
	weekday = weekday.substring(0,3).toUpperCase();
	System.out.println(">>>> : " + weekday);
	
	
	String res = "";
	String query1="";	
	ResultSet rs2 = null; 
	int counter = 1;
	try{
		query1 = "SELECT * FROM FOOD_MENU_MST WHERE LOCATION_ID_V='" + location + "' AND WEEKDAY_V='" +  weekday + "' AND MEAL_TYPE_V='BREAKFAST'  ORDER BY TYPE_V DESC";
		rs2 = db.executeQuery(query1);
		
		  res = "<BREAKFAST><table class='table table-striped table-bordered table-condensed table-responsive'>"
			 		+ "<thead><tr>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Sr. No</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Item</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'></th>"
			 		+ "</tr></thead>"
			 		+ "<tbody>";
			 
		counter = 1;
		while(rs2.next())
		{
			 res+= "<tr>";
			 res+= "<td align='center' > " + counter + "</td>";
			 res+= "<td align='center' > " + rs2.getString("ITEM_V") + "</td>";
			 if(rs2.getString("TYPE_V").equals("VEG"))
				 res+= "<td align='center' > <img src='images/veg.png' height='20' width='20'/></td>";
			 else
				 res+= "<td align='center' > <img src='images/nonveg.png' height='20' width='20'/></td>";
			 res+= "</tr>";
			counter++;
		}
		
		 res+= "</tbody>";
		 res+= "</table></BREAKFAST>";

	
		 query1 = "SELECT * FROM FOOD_MENU_MST WHERE LOCATION_ID_V='" + location + "' AND WEEKDAY_V='" +  weekday + "' AND MEAL_TYPE_V='LUNCH'  ORDER BY TYPE_V DESC";
			 rs2 = db.executeQuery(query1);
			
			  res += "<LUNCH><table class='table table-striped table-bordered table-condensed table-responsive'>"
				 		+ "<thead><tr>"
				 		+ "<th class='text-center' style='white-space: nowrap'>Sr. No</th>"
				 		+ "<th class='text-center' style='white-space: nowrap'>Item</th>"
				 		+ "<th class='text-center' style='white-space: nowrap'></th>"
				 		+ "</tr></thead>"
				 		+ "<tbody>";
				 
			counter = 1;
			while(rs2.next())
			{
				 res+= "<tr>";
				 res+= "<td align='center' > " + counter + "</td>";
				 res+= "<td align='center' > " + rs2.getString("ITEM_V") + "</td>";
				 if(rs2.getString("TYPE_V").equals("VEG"))
					 res+= "<td align='center' > <img src='images/veg.png' height='20' width='20'/></td>";
				 else
					 res+= "<td align='center' > <img src='images/nonveg.png' height='20' width='20'/></td>";
				 res+= "</tr>";
				counter++;
			}
			
			 res+= "</tbody>";
			 res+= "</table></LUNCH>";

			 
			 
			 
			 query1 = "SELECT * FROM FOOD_MENU_MST WHERE LOCATION_ID_V='" + location + "' AND WEEKDAY_V='" +  weekday + "' AND MEAL_TYPE_V='DINNER'  ORDER BY TYPE_V DESC";
				 rs2 = db.executeQuery(query1);
				
				  res += "<DINNER><table class='table table-striped table-bordered table-condensed table-responsive'>"
					 		+ "<thead><tr>"
					 		+ "<th class='text-center' style='white-space: nowrap'>Sr. No</th>"
					 		+ "<th class='text-center' style='white-space: nowrap'>Item</th>"
					 		+ "<th class='text-center' style='white-space: nowrap'></th>"
					 		+ "</tr></thead>"
					 		+ "<tbody>";
					 
				counter = 1;
				while(rs2.next())
				{
					 res+= "<tr>";
					 res+= "<td align='center' > " + counter + "</td>";
					 res+= "<td align='center' > " + rs2.getString("ITEM_V") + "</td>";
					 if(rs2.getString("TYPE_V").equals("VEG"))
						 res+= "<td align='center' > <img src='images/veg.png' height='20' width='20'/></td>";
					 else
						 res+= "<td align='center' > <img src='images/nonveg.png' height='20' width='20'/></td>";
					 res+= "</tr>";
					counter++;
				}
				
				 res+= "</tbody>";
				 res+= "</table></DINNER>";

				 
				 
				 
				 
		 
		 
		 
		rs2.close();
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	out.write(res);
	out.flush();
	out.close();
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getMenu   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward getMenu_OLD(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getMenuForUser   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	
	String food_type = rf.getFood_type();
	String meal_type = rf.getMeal_type();
	PrintWriter out = response.getWriter();
	String location = request.getSession().getAttribute("location").toString();
	String res = "";
		
	try{
		String query1 = "SELECT * FROM FOOD_MENU_MST WHERE LOCATION_ID_V='" + location + "' AND MEAL_TYPE_V='" + meal_type + "' AND TYPE_V='" + food_type + "'";
		System.out.println("QUERY : " + query1);
		ResultSet rs2 = db.executeQuery(query1);
		
		  res = "<table class='table table-striped table-bordered  table-responsive'>"
			 		+ "<thead><tr>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Sr. No</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Item</th>"
			 		+ "</tr></thead>"
			 		+ "<tbody>";
			 
		int counter = 1;
		while(rs2.next())
		{
			 res+= "<tr>";
			 res+= "<td align='center' > " + counter + "</td>";
			 res+= "<td align='center' > " + rs2.getString("ITEM_V") + "</td>";
			 res+= "</tr>";
			counter++;
		}
		
		 res+= "</tbody>";
		 res+= "</table>";

	
		rs2.close();
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	out.write(res);
	out.flush();
	out.close();
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getMenuForUser   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward getMessAvailed(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getMessAvailed   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	
	String crewid = rf.getCrew_id();
	String location = request.getSession().getAttribute("location").toString();
	
	PrintWriter out = response.getWriter();
	
	String res = "";
		
	try{
		String query1 = "SELECT * FROM MESS_AVAILED_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "' AND DATE(DATE_TIME_D) = CURDATE()";
		System.out.println("QUERY : " + query1);
		ResultSet rs2 = db.executeQuery(query1);
		
		  res = "<table class='table table-striped table-bordered table-condensed table-responsive'>"
			 		+ "<thead>"
			 		+ "<tr>"
			 		+ "<th class='text-center' colspan='2' style='white-space: nowrap'>Availed</th>"
			 		+ "</tr>"
			 		+ "<tr>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Meal</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Type</th>"
			 		+ "</tr>"
			 		+ "</thead>"
			 		+ "<tbody>";
		
		while(rs2.next())
		{
			 res+= "<tr>";
			 res+= "<td align='center' > " + rs2.getString("MEAL_TYPE_V") + "</td>";
			 res+= "<td align='center' > " + rs2.getString("FOOD_TYPE_V") + "</td>";
			 res+= "</tr>";
		}
		
		 res+= "</tbody>";
		 res+= "</table>";

	
		rs2.close();
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	out.write(res);
	out.flush();
	out.close();
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getMessAvailed   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}



/*

public ActionForward saveFoodType(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  saveFoodType   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	String food_type = rf.getFood_type();
	DBConnection db = new DBConnection(); 
	
	String crewid = rf.getCrew_id();
	
try{	
    		
		String query = "UPDATE BED_ALLOCATION_MST SET FOOD_TYPE_V='" + food_type + "' WHERE USER_ID_V='" + crewid + "'";
    		System.out.println("QUERY   : " + query);
    		int update_rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + update_rs);
    		
    		if( update_rs>0)
    			rf.setMessage("Mess option saved succesfully");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}


	
	forward = mapping.findForward("CrewOptions");
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  saveFoodType   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}



*/


public ActionForward initiateWakeMe(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateWakeMe   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	String location = request.getSession().getAttribute("location").toString();
	
	
	try{
		
		String query1 = "SELECT * FROM BED_ALLOCATION_MST  WHERE USER_ID_V='" +rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
		ResultSet rs = db.executeQuery(query1);
		if(rs.next())
			forward = mapping.findForward("WakeMe");
		else
		{
			rf.setMessage("You are not Checked-In");
			forward = mapping.findForward("CrewOptions");
		}
			
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		db.closeCon();
	}
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateWakeMe   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}




public ActionForward initiateWakeCrewTime(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateWakeCrewTime   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	String location = request.getSession().getAttribute("location").toString();
	
	 ArrayList<String> crewlist = new ArrayList<String>();
	 
	 
	
	try{
		
		String query1 = "SELECT USER_ID_V FROM BED_ALLOCATION_MST  WHERE USER_ID_V IS NOT NULL AND  LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
		ResultSet rs = db.executeQuery(query1);
		while(rs.next())
		{
			crewlist.add(rs.getString("USER_ID_V"));
		}
			
		request.setAttribute("crewlist", crewlist);
		forward = mapping.findForward("WakeCrewTime");
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		db.closeCon();
	}
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateWakeCrewTime   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}




public ActionForward saveWakeUpTime(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  saveWakeUpTime   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	String location = request.getSession().getAttribute("location").toString();
	String wakeuptime  = rf.getWakeup_time();
	
	DBConnection db = new DBConnection(); 
	String query="";

	try{

    		    			
		// CHECK IF OUTWARD TRAIN NO WAS ENETERED
		
			query = "UPDATE BED_ALLOCATION_MST SET WAKE_UP_TIME_D=STR_TO_DATE('" + wakeuptime + "','%d/%m/%Y %H:%i')  WHERE USER_ID_V='" +rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
		
		
		System.out.println("QUERY   : " + query);
    		int rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + rs);
    		
    		if(rs > 0 )
    			rf.setMessage("Wake up time saved Successfull. Enjoy your stay");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

	forward = mapping.findForward("CrewOptions");
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  saveWakeUpTime   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	    
    return (forward);
}



// PURPOSE : CALLED WHEN OPERATOR SETS THE WAKE UP TIME FOR A CREW
// DATE CREATED : 29-01-2019


public ActionForward saveWakeCrewTime(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  saveWakeCrewTime   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	String location = request.getSession().getAttribute("location").toString();
	String wakeuptime  = rf.getWakeup_time();
	String outward_train_no = rf.getOutward_train();
	DBConnection db = new DBConnection(); 
	String query="";
	

	try{

		// CHECK IF OUTWARD TRAIN NO WAS ENETERED
		if(outward_train_no.trim().equals(""))
			query = "UPDATE BED_ALLOCATION_MST SET WAKE_UP_TIME_D=STR_TO_DATE('" + wakeuptime + "','%d/%m/%Y %H:%i')  WHERE USER_ID_V='" +rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
		else
			query = "UPDATE BED_ALLOCATION_MST SET WAKE_UP_TIME_D=STR_TO_DATE('" + wakeuptime + "','%d/%m/%Y %H:%i'), OUTWARD_TRAIN_V='" + outward_train_no + "'  WHERE USER_ID_V='" +rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";    		
    		
		
		
			
    		int rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + rs);
    		
    		if(rs > 0 )
    			rf.setMessage("Wake up time saved Successfull. Enjoy your stay");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

	forward = mapping.findForward("InitiateCrewWakeUp");
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  saveWakeCrewTime   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	    
    return (forward);
}


public ActionForward saveOutwardTrain(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  saveOutwardTrain   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	String location = request.getSession().getAttribute("location").toString();
	String outward_train_no = rf.getOutward_train();
	DBConnection db = new DBConnection(); 
	String query="";

	try{
 			
		
			query = "UPDATE BED_ALLOCATION_MST SET  OUTWARD_TRAIN_V='" + outward_train_no + "'  WHERE USER_ID_V='" +rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "'";    		
    		
		
		System.out.println("QUERY   : " + query);
    		int rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + rs);
    		
    		if(rs > 0 )
    			rf.setMessage("Outward Train Saved Successfull.");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

	forward = mapping.findForward("CrewOptions");
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  saveOutwardTrain   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	    
    return (forward);
}



public ActionForward initiateCrewOptions(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateCrewOPtions   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	DBConnection db = new DBConnection(); 
	ActionForward forward = new ActionForward();
	
	RunningRoomForm rf = (RunningRoomForm) form;
	
	rf.setMessage("");
	
	
 try{
	 
	 
				HttpSession session = request.getSession(true);				
				session.setAttribute("inwardtrainno", rf.getInward_train());
				String crewid = request.getSession().getAttribute("username").toString();
				String location = request.getSession().getAttribute("location").toString();
				rf.setCrew_id(crewid);
				System.out.println("CFREW ID : " + crewid);
				
				String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + crewid + "'";
				ResultSet rs2 = db.executeQuery(query1);
				
				if(rs2.next())
				{
					rf.setBooked("Y");	
					rf.setBookedroom(rs2.getString("ROOM_NO_I"));
					rf.setBookedbed(rs2.getString("BED_NO_I"));
				}					
				else
					rf.setBooked("N");
				
				
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	
	
	
	forward = mapping.findForward("CrewOptions");
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateCrewOPtions   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}







public ActionForward getAvailableBed(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getAvailableBed >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	RunningRoomForm rf = (RunningRoomForm) form;
	DBConnection db = new DBConnection(); 
	PrintWriter out = response.getWriter();
	String location = request.getSession().getAttribute("location").toString();
	String designation = request.getSession().getAttribute("designation").toString();
	String crewid = rf.getCrew_id();
	String crew_lobby = crewid.substring(0, crewid.length()-4);
	String roomselected = "";
	String bedselected = "";
	String result="NA";
	String room_str="";
	
	
try {
	
	
	

try{
	String query1 = "SELECT ROOM_NO_I FROM ROOM_CAT_MST  WHERE LOCATION_ID_V='" + location + "' AND DESIG_V='" + designation + "' AND ROOM_NO_I IN (SELECT ROOM_NO_I FROM LOBBY_CAT_MST  WHERE LOCATION_ID_V='" + location + "' AND LOBBY_V='" + crew_lobby + "') ORDER BY ROOM_NO_I";
			
	ResultSet rs2 = db.executeQuery(query1);
	while(rs2.next())
	{
		room_str += "'" + rs2.getString("ROOM_NO_I") + "',";	
		
	}
	
	room_str +=  "'DUMMY'";
	System.out.println("desig_str : " +room_str);
	
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}



try{
	String query1 = "SELECT * FROM BED_ALLOCATION_MST  WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I IN (" + room_str + ") ORDER BY ROOM_NO_I,BED_NO_I";
	ResultSet rs2 = db.executeQuery(query1);
	while(rs2.next())
	{
		if(rs2.getInt("OCCUPANCY_I") == 0)
		{
			roomselected = rs2.getString("ROOM_NO_I");
			bedselected = rs2.getString("BED_NO_I");
			break;
		}
		
	}
	
	if(!roomselected.equals(""))
	{
		result = roomselected + "@" + bedselected;
	}
	 out.println(result);
	 out.flush();
	
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}





}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}
finally
{
	db.closeCon();
}



	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getAvailableBed   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward bookBed(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	//checkpost
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  bookBed   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	
	DBConnection db = new DBConnection(); 

	String location = request.getSession().getAttribute("location").toString();
	String crewid = rf.getCrew_id();
	String roomselected = rf.getRoom_selected();
	String bedselected = rf.getBed_selected();
	String inward_train_no = request.getSession().getAttribute("inwardtrainno").toString();
	
	
	
	System.out.println("Inward Train NO : " + inward_train_no);
	

	
try{

    		    			
    		String query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V='" + crewid + "', CHECK_IN_D=NOW(), OCCUPANCY_I=1, INWARD_TRAIN_V='" + inward_train_no + "' WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + roomselected + " AND BED_NO_I=" + bedselected ;    		
    		
    		int rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + rs);
    		
    		if(rs > 0 )
    		{
    			rf.setBooked("N");
    			rf.setMessage("Booking Successfull. Enjoy your stay");
    		}    			
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}

	
	forward = mapping.findForward("CrewOptions");
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  bookBed   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}







public ActionForward checkInByAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  checkInByAdmin   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	
	DBConnection db = new DBConnection(); 

	String location = request.getSession().getAttribute("location").toString();
	String crewid = rf.getCrew_id();
	String roomselected = rf.getRoom_selected();
	String bedselected = rf.getBed_selected();
	String checkin = rf.getCheckin_date();
	String checkout = rf.getCheckout_date();
	
	
	System.out.println(" -- " + crewid);
	System.out.println(" -- " + roomselected);
	System.out.println(" -- " + bedselected);
	System.out.println(" -- " + checkin);
	System.out.println(" -- " + checkout);
	
	
	String query = "";
	
try{
			
	       query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V='" + crewid + "', CHECK_IN_D=STR_TO_DATE('" + checkin + "','%d/%m/%Y %H:%i'), OCCUPANCY_I=1 WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + roomselected + " AND BED_NO_I=" + bedselected ;
	
	
	
// DISABLED FOR NOW AS THE CREW CAN EITHER CHEK OUT HIMSELF OR ADMIN WILL HAVE TO CHEKOUT THE CREW SEPERATELY FROM THIS FUNCTIONALITY	
//			if(checkout == null)    		    		
//				query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V='" + crewid + "', CHECK_IN_D=STR_TO_DATE('" + checkin + "','%d/%m/%Y %H:%i'), OCCUPANCY_I=1 WHERE ROOM_NO_I=" + roomselected + " AND BED_NO_I=" + bedselected ;
//			else		
//				query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V='" + crewid + "', CHECK_IN_D=STR_TO_DATE('" + checkin + "','%d/%m/%Y %H:%i'), CHECK_OUT_D=STR_TO_DATE('" + checkout + "','%d/%m/%Y %H:%i') , OCCUPANCY_I=1 WHERE ROOM_NO_I=" + roomselected + " AND BED_NO_I=" + bedselected ;
//				
				
				
				
				
    		System.out.println("QUERY   : " + query);
    		int rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + rs);
    		
    		if(rs > 0 )
    			rf.setMessage("Booking Successfull. Enjoy your stay");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}


	
forward = mapping.findForward("RunningRoomAdmin");
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  checkInByAdmin   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}




public ActionForward checkOutByAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  checkOutByAdmin   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	
	DBConnection db = new DBConnection(); 
	ArrayList<String> queries = new ArrayList<String>();
	String location = request.getSession().getAttribute("location").toString();
	String crewid = rf.getCrew_id();
	String checkout = rf.getCheckout_date();
	
	
	
try{    		    			
    		
			String query = "UPDATE BED_ALLOCATION_MST SET CHECK_OUT_D=STR_TO_DATE('" + checkout + "','%d/%m/%Y %H:%i') WHERE USER_ID_V='" + crewid + "'  AND LOCATION_ID_V='" + location + "'";
			queries.add(query);
	
	
    		query = "INSERT INTO BED_ALLOCATION_HIS (`LOCATION_ID_V`, `ROOM_NO_I`,`BED_NO_I`,`USER_ID_V`,`CHECK_IN_D`,`CHECK_OUT_D`,`OCCUPANCY_I`,`BREAKFAST_V`, `BREAKFAST_CAT_V`,`BREAKFAST_QTY_I`, `LUNCH_V`, `LUNCH_CAT_V`, `LUNCH_QTY_I`, `DINNER_V`, `DINNER_CAT_V`,`DINNER_QTY_I`, `SUBSIDY_V`) "
    	    				               + "SELECT `LOCATION_ID_V`, `ROOM_NO_I`,`BED_NO_I`,`USER_ID_V`,`CHECK_IN_D`,`CHECK_OUT_D`,`OCCUPANCY_I`,`BREAKFAST_V`, `BREAKFAST_CAT_V`,`BREAKFAST_QTY_I`, `LUNCH_V`, `LUNCH_CAT_V`, `LUNCH_QTY_I`, `DINNER_V`, `DINNER_CAT_V`,`DINNER_QTY_I`,  `SUBSIDY_V` FROM BED_ALLOCATION_MST "
    	    				+ "WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "'"; 
    		queries.add(query);
    		
    		
    		query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V=NULL , CHECK_IN_D=NULL, CHECK_OUT_D=NULL , OCCUPANCY_I=0, BREAKFAST_V='N', BREAKFAST_CAT_V=NULL, BREAKFAST_QTY_I=0, LUNCH_V='N', LUNCH_CAT_V=NULL, LUNCH_QTY_I=0, DINNER_V='N', DINNER_CAT_V=NULL, DINNER_QTY_I=0, WAKE_UP_TIME_D=NULL, INWARD_TRAIN_V=NULL, OUTWARD_TRAIN_V=NULL  WHERE USER_ID_V='" + crewid + "'  AND LOCATION_ID_V='" + location + "'";    		
    		queries.add(query);
    		
    		
    		query = "INSERT INTO MESS_AVAILED_HIS (SELECT * FROM MESS_AVAILED_MST WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "')"; 
    		queries.add(query);
    		
    		query = "DELETE FROM MESS_AVAILED_MST WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "'"; 
    		queries.add(query);
    		
    		
    		int queriesexecuted = db.executeMyBatch(queries);
    		System.out.println("Queries Executed : " + queriesexecuted);
    		
    		if(queriesexecuted >= 3)
    			rf.setMessage("Checkout Successfull. Happy Journey");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}


	
forward = mapping.findForward("RunningRoomAdmin");
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  checkOutByAdmin   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}






public ActionForward checkOut(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  checkOut   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	RunningRoomForm rf = (RunningRoomForm) form;
	ArrayList<String> queries = new ArrayList<String>();
	DBConnection db = new DBConnection();
	String location = request.getSession().getAttribute("location").toString();
	
	String crewid = rf.getCrew_id();
	
try{

	
	String query = "UPDATE BED_ALLOCATION_MST SET CHECK_OUT_D=CURRENT_TIMESTAMP WHERE USER_ID_V='" + crewid + "'  AND LOCATION_ID_V='" + location + "'";
	queries.add(query);


	query = "INSERT INTO BED_ALLOCATION_HIS (`LOCATION_ID_V`, `ROOM_NO_I`,`BED_NO_I`,`USER_ID_V`,`CHECK_IN_D`,`CHECK_OUT_D`,`OCCUPANCY_I`,`BREAKFAST_V`, `BREAKFAST_CAT_V`,`BREAKFAST_QTY_I`, `LUNCH_V`, `LUNCH_CAT_V`, `LUNCH_QTY_I`, `DINNER_V`, `DINNER_CAT_V`,`DINNER_QTY_I`, `SUBSIDY_V`) "
    				+ "SELECT `LOCATION_ID_V`, `ROOM_NO_I`,`BED_NO_I`,`USER_ID_V`,`CHECK_IN_D`,`CHECK_OUT_D`,`OCCUPANCY_I`,`BREAKFAST_V`, `BREAKFAST_CAT_V`, `BREAKFAST_QTY_I`,`LUNCH_V`, `LUNCH_CAT_V`,`LUNCH_QTY_I`,  `DINNER_V`,  `DINNER_CAT_V`,`DINNER_QTY_I`,  `SUBSIDY_V` FROM BED_ALLOCATION_MST "
    				+ "WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "'"; 
	queries.add(query);	
	
	
	query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V=NULL , CHECK_IN_D=NULL, CHECK_OUT_D=NULL , OCCUPANCY_I=0, BREAKFAST_V='N', BREAKFAST_CAT_V=NULL, BREAKFAST_QTY_I=0, LUNCH_V='N', LUNCH_CAT_V=NULL, LUNCH_QTY_I=0, DINNER_V='N', DINNER_CAT_V=NULL, DINNER_QTY_I=0, WAKE_UP_TIME_D=NULL, INWARD_TRAIN_V=NULL, OUTWARD_TRAIN_V=NULL   WHERE USER_ID_V='" + crewid + "'  AND LOCATION_ID_V='" + location + "'";    		
	queries.add(query);
	
	
	query = "INSERT INTO MESS_AVAILED_HIS (SELECT * FROM MESS_AVAILED_MST WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "')"; 
	queries.add(query);
	
	query = "DELETE FROM MESS_AVAILED_MST WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "'"; 
	queries.add(query);
	
	
	int queriesexecuted = db.executeMyBatch(queries);
	System.out.println("Queries Executed : " + queriesexecuted);
	
	if(queriesexecuted >= 3)
	{
		rf.setBooked("N");
		rf.setMessage("Checkout Successfull. Happy Journey");
		forward = mapping.findForward("LOGOUTKIOSK");		
		
	}		
	else
	{
		rf.setMessage("Failure : Please report to supervisor");
		forward = mapping.findForward("CrewOptions");
	}
		
	
	
//    		    			
//    		String queryhis = "INSERT INTO BED_ALLOCATION_HIS (`LOCATION_ID_V`, `ROOM_NO_I`,`BED_NO_I`,`USER_ID_V`,`CHECK_IN_D`,`CHECK_OUT_D`,`OCCUPANCY_I`,`BREAKFAST_V`, `BREAKFAST_CAT_V`,`BREAKFAST_QTY_I`, `LUNCH_V`, `LUNCH_CAT_V`,`LUNCH_QTY_I`, `DINNER_V`, `DINNER_CAT_V`,`DINNER_QTY_I`,`SUBSIDY_V`) "
//    						+ "SELECT `LOCATION_ID_V`, `ROOM_NO_I`,`BED_NO_I`,`USER_ID_V`,`CHECK_IN_D`,NOW(),`OCCUPANCY_I`,`BREAKFAST_V`, `BREAKFAST_CAT_V`,`BREAKFAST_QTY_I`, `LUNCH_V`, `LUNCH_CAT_V`,`LUNCH_QTY_I`, `DINNER_V`, `DINNER_CAT_V`,`DINNER_QTY_I`, `SUBSIDY_V` FROM BED_ALLOCATION_MST "
//    						+ "WHERE USER_ID_V='" + crewid + "' AND LOCATION_ID_V='" + location + "'"; 
//    		System.out.println("QUERY   : " + queryhis);
//    		int inert_rs = db.executeUpdate(queryhis);
//    		System.out.println("Rows Updated : " + inert_rs);
//    		
//    		String query = "UPDATE BED_ALLOCATION_MST SET USER_ID_V=NULL , CHECK_IN_D=NULL, CHECK_OUT_D=NULL , OCCUPANCY_I=0, BREAKFAST_V='N', BREAKFAST_CAT_V=NULL, BREAKFAST_QTY_I=0, LUNCH_V='N', LUNCH_CAT_V=NULL, LUNCH_QTY_I=0, DINNER_V='N', DINNER_CAT_V=NULL, DINNER_QTY_I=0, WAKE_UP_TIME_D=NULL  WHERE USER_ID_V='" + crewid + "'  AND LOCATION_ID_V='" + location + "'";    		
//    		
//    		System.out.println("QUERY   : " + query);
//    		int update_rs = db.executeUpdate(query);
//    		System.out.println("Rows Updated : " + update_rs);
//    		
//    		if(inert_rs>0 && update_rs>0)
//    			rf.setMessage("Checkout Successfull. Happy Journey");
//    		else
//    			rf.setMessage("Failure : Please report to supervisor");
//    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}


	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  checkOut   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}









public ActionForward getRunningRoomLayout(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	//checkpost
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getRunningRoomLayout >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	PrintWriter out = response.getWriter();
	int bookedroom=0;
	int bookedbed=0;
	int floor = 0;
	
	
	try
	{
	
	
	String location = request.getSession().getAttribute("location").toString();
	String booked = rf.getBooked().trim();
	
	System.out.println("booked : " + booked);
	
	if(booked.equals("Y"))
	{
		 bookedroom = Integer.parseInt(rf.getBookedroom());
		 bookedbed = Integer.parseInt(rf.getBookedbed());
	}
	
	HashMap<String,Integer> hmap = new HashMap<String,Integer>();
	
	
	String crewid = rf.getCrew_id();
	String crew_lobby = crewid.substring(0, crewid.length()-4);
	String designation = request.getSession().getAttribute("designation").toString();
	String gender = request.getSession().getAttribute("gender").toString();
	String room_str="";
	String query1 = "";
	
	

	
	try{
		
		
		if(gender.equals("F"))
			query1 = "SELECT ROOM_NO_I FROM ROOM_CAT_MST  WHERE LOCATION_ID_V='" + location + "' AND DESIG_V='LADIES' AND ROOM_NO_I IN (SELECT ROOM_NO_I FROM LOBBY_CAT_MST  WHERE LOCATION_ID_V='" + location + "' AND LOBBY_V='" + crew_lobby + "') ORDER BY ROOM_NO_I";
		else
			query1 = "SELECT ROOM_NO_I FROM ROOM_CAT_MST  WHERE LOCATION_ID_V='" + location + "' AND DESIG_V='" + designation + "' AND ROOM_NO_I IN (SELECT ROOM_NO_I FROM LOBBY_CAT_MST  WHERE LOCATION_ID_V='" + location + "' AND LOBBY_V='" + crew_lobby + "') ORDER BY ROOM_NO_I";
			
			
			
			
		ResultSet rs2 = db.executeQuery(query1);
		while(rs2.next())
		{
			room_str += "'" + rs2.getString("ROOM_NO_I") + "',";	
			
		}
		
		room_str +=  "'DUMMY'";
		System.out.println("desig_str : " +room_str);
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	
	
	
	
	
			
	String lt="";
	
try{

    		    			
    		String query = "SELECT * FROM ROOM_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I IN (" + room_str + ")  ORDER BY ROOM_NO_I ";    		
    		
    		ResultSet rs = db.executeQuery(query);
    		

			lt +="<div class='col-sm-12'>";
			lt +="<table class='table table-bordered' >";
			lt +="<thead><tr><th bgcolor='lightgreen' class='text-center' style='white-space: nowrap'> GROUND FLOOR </th></tr></thead>";
			lt +="</table>";
		
    		
    		while(rs.next())
    		{
    			int cur_floor = rs.getInt("FLOOR_I");
    			int room = rs.getInt("ROOM_NO_I");
    			int beds = rs.getInt("NO_OF_BEDS_I");
    			
    			
    			
    			if(floor != cur_floor)
    			{
    				
    				lt +="<div class='col-sm-12'>";
        			lt +="<table class='table table-bordered' >";
        			lt +="<thead><tr><th bgcolor='lightgreen' class='text-center' style='white-space: nowrap'> FLOOR " + cur_floor + " </th></tr></thead>";
        			lt +="</table>";
        			
        			floor = cur_floor;
    				
    			}
    			
    			
    			lt +="<div class='col-sm-" + beds + "'>";
    			lt +="<table class='table table-bordered' >";
    			lt +="<thead><tr><th bgcolor='#ffbf80' class='text-center' colspan='" + beds + "' style='white-space: nowrap'> Room " + room + "</th></tr></thead>";
    			//System.out.println("rowcounter  : " + rowcounter  + "Result : " +  (rowcounter % 3));
    			
    		
    			
    			lt += "<tbody><tr>"; 
    			
    			
    			
				try{
					String query2 = "SELECT BED_NO_I,OCCUPANCY_I FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + room + " ORDER BY BED_NO_I";
					ResultSet rs2 = db.executeQuery(query2);
					
					
					while(rs2.next())
					{
						
						
						lt += "<td bgcolor='#ffbf80'>"; 
	    				
	    				if(rs2.getInt("OCCUPANCY_I") == 0)
	    					lt += "<table class='table table-bordered' id='" + room + "" + rs2.getInt("BED_NO_I") + "' onclick=selectBed('" + room + "','" + rs2.getInt("BED_NO_I") + "')><thead><tr  bgcolor='lightgreen'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr><tbody><tr><td>&nbsp;</td></tr></tbody></table>";
	    				else if( rs2.getInt("OCCUPANCY_I") == -1)
	    				{
	    					lt += "<table class='table table-bordered' id='" + room + "" + rs2.getInt("BED_NO_I") + "' onclick=selectBed('-1','-1')><thead><tr  bgcolor='red'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr><tbody><tr><td>&nbsp;</td></tr></tbody></table>";
	    				}else
	    				{
	    					if(booked.equals("Y"))
	    					{
	    						if( (bookedroom == room)   && (bookedbed == rs2.getInt("BED_NO_I")) )
	    						{
	    							lt += "<table class='table table-bordered' id='" + room + "" + rs2.getInt("BED_NO_I") + "' onclick=selectBed('" + room + "','" + rs2.getInt("BED_NO_I") + "')><thead><tr  bgcolor='yellow'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr><tbody><tr><td>&nbsp;</td></tr></tbody></table>";
	    						}else
	        						lt += "<table class='table table-bordered' id='" + room + "" + rs2.getInt("BED_NO_I") + "' onclick=selectBed('0','0')><thead><tr  bgcolor='red'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr><tbody><tr><td>&nbsp;</td></tr></tbody></table>";
	    	    				
	    					}    						
	    					else
	    						lt += "<table class='table table-bordered' id='" + room + "" + rs2.getInt("BED_NO_I") + "' onclick=selectBed('0','0')><thead><tr  bgcolor='red'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr><tbody><tr><td>&nbsp;</td></tr></tbody></table>";
	    				}
	    					
	    				
	    				lt += "</td>"; 
	    				
	    				
	    				
					}
					
				}catch(Exception e)
				{
					System.out.println("Ex : " + e);
					
				}
				
				
				
    			
    			lt += "</tr>";
    			lt += "</tbody>"; 
    			lt += "</table>";
    			lt += "</div>";
    			
    			
    			
    			
    			
    			
    		}
    		
    		
    		 
    		System.out.println("lt : " + lt);
        	rs.close();
        
        	 out.println(lt);
        	 out.flush();
        	     
        
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	e.printStackTrace();
	
}

	

	
	
	
	}
	catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	finally
	{
		 db.closeCon();
		 
	}
	
		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getRunningRoomLayout   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}



public ActionForward getRunningRoomLayoutForAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getRunningRoomLayout   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	DBConnection db = new DBConnection(); 
	PrintWriter out = response.getWriter();
	int floor = 0;
	
	String location = request.getSession().getAttribute("location").toString();
	
	
	
			
	String lt="";
	
	try{

    		    			
    		String query = "SELECT * FROM ROOM_MST WHERE LOCATION_ID_V='" + location + "' ORDER BY FLOOR_I,ROOM_NO_I";    		
    		
    		ResultSet rs = db.executeQuery(query);
    		
			
				lt +="<div class='col-sm-12'>";
    			lt +="<table class='table table-bordered' >";
    			lt +="<thead><tr><th bgcolor='yellow' class='text-center' style='white-space: nowrap'>  GROUND FLOOR  </th></tr></thead>";
    			lt +="</table>";
    		
    		
    		while(rs.next())
    		{
    			int room = rs.getInt("ROOM_NO_I");
    			int cur_floor = rs.getInt("FLOOR_I");
    			int beds = rs.getInt("NO_OF_BEDS_I");
    			
    			
    			if(floor != cur_floor)
    			{
    				
    				lt +="<div class='col-sm-12'>";
        			lt +="<table class='table table-bordered' >";
        			lt +="<thead><tr><th bgcolor='yellow' class='text-center' style='white-space: nowrap'> FLOOR " + cur_floor + " </th></tr></thead>";
        			lt +="</table>";
        			
        			floor = cur_floor;
    			}
    			
    			lt +="<div class='col-sm-" + beds + "'>";
    			lt +="<table class='table table-bordered' >";
    			lt +="<thead><tr><th bgcolor='#ffbf80' class='text-center' colspan='" + beds + "' style='white-space: nowrap'> Room " + room + " </th></tr></thead>";
    			//System.out.println("rowcounter  : " + rowcounter  + "Result : " +  (rowcounter % 3));
    			
    		
    			
    			lt += "<tbody><tr>"; 
    			
    			
    				
    				try{
    					String query1 = "SELECT BED_NO_I,OCCUPANCY_I FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + room + " ORDER BY BED_NO_I";
    					ResultSet rs2 = db.executeQuery(query1);
    					
    					
    					while(rs2.next())
    					{
    						lt += "<td bgcolor='#ffbf80'>"; 
    						if(rs2.getInt("OCCUPANCY_I") == 0)
    	    					lt += "<table class='table table-bordered table-condensed' id='" + room + "" + rs2.getInt("BED_NO_I") + "'  onclick=selectBed('" + room + "','" + rs2.getInt("BED_NO_I") + "') ><thead><tr  bgcolor='lightgreen'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr></table>";
    	    				else if(rs2.getInt("OCCUPANCY_I") == -1)
    	    					lt += "<table class='table table-bordered table-condensed' id='" + room + "" + rs2.getInt("BED_NO_I") + "' ><thead onclick=getInfo('" + room + "','" + rs2.getInt("BED_NO_I") + "')><tr  bgcolor='grey'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr></table>";
    	    				else
    	    					lt += "<table class='table table-bordered table-condensed' id='" + room + "" + rs2.getInt("BED_NO_I") + "' ><thead onclick=getInfo('" + room + "','" + rs2.getInt("BED_NO_I") + "')><tr  bgcolor='red'><th class='text-center'>" + rs2.getInt("BED_NO_I") + "</th></tr></table>";
    						lt += "</td>"; 
    					}
    					
    				}catch(Exception e)
    				{
    					System.out.println("Ex : " + e);
    					
    				}
    				
    				
    				
    			lt += "</tr>";
    			lt += "</tbody>"; 
    			lt += "</table>";
    			lt += "</div>";
    			
    			
    			
    			
    			
    			
    		}
    		
    		
    		 
    		System.out.println("lt : " + lt);
        	rs.close();
        
        	 out.println(lt);
        	 out.flush();
        	     
        
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	e.printStackTrace();
	
}finally
{
	 db.closeCon();
	 
}

	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getRunningRoomLayout   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward initiateInwardTrainEntry(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateInwardTrainEntry   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	
	try{
			String location = request.getSession().getAttribute("location").toString();
			String crewid = request.getSession().getAttribute("username").toString();
			rf.setCrew_id(crewid);
			String query1 = "SELECT INWARD_TRAIN_V FROM BED_ALLOCATION_MST  WHERE USER_ID_V='" + rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
			ResultSet rs = db.executeQuery(query1);
			if(rs.next())
			{
				if(rs.getString("INWARD_TRAIN_V") == null)
					forward = mapping.findForward("InwardTrainEntry");
				else
					forward = mapping.findForward("CrewOptions");
			}
			else
			{				
				forward = mapping.findForward("InwardTrainEntry");
			}
			
			
			
			query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V='" + rf.getCrew_id() + "'";
			ResultSet rs2 = db.executeQuery(query1);
			
			if(rs2.next())
			{
				rf.setBooked("Y");	
				rf.setBookedroom(rs2.getString("ROOM_NO_I"));
				rf.setBookedbed(rs2.getString("BED_NO_I"));
			}					
			else
				rf.setBooked("N");
			
			
				
		}catch(Exception e)
		{
			System.out.println("Ex : " + e);
			
		}
	finally
	{
		 db.closeCon();
		 
	}

	
		
 	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateInwardTrainEntry   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
    return (forward);

}



public ActionForward initiateOutwardTrainEntry(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{                    
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateOutwardTrainEntry   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	String location = request.getSession().getAttribute("location").toString();
 		
 	
 		try{
 			
 			String query1 = "SELECT * FROM BED_ALLOCATION_MST  WHERE USER_ID_V='" +rf.getCrew_id() + "' AND LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
 			ResultSet rs = db.executeQuery(query1);
 			if(rs.next())
 				forward = mapping.findForward("OutwardTrainEntry");
 			else
 			{
 				rf.setMessage("You are not Checked-In");
 				forward = mapping.findForward("CrewOptions");
 			}
 				
 		}catch(Exception e)
 		{
 			System.out.println("Ex : " + e);
 			
 		}
 		finally
 		{
 			 db.closeCon();
 			 
 		}

	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateOutwardTrainEntry   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
    return (forward);

}


public ActionForward initiateRunningRoomReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateRunningRoomReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	
 		forward = mapping.findForward("ReportDates");
 	
 		populateCrewIdDropDown(request);
 		populateRoomDropDown(request);
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateRunningRoomReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
    return (forward);

}



public ActionForward initiateOccupancyCountReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateOccupancyCountReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	
 	forward = mapping.findForward("CountReportDates");
 	
 		
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateOccupancyCountReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}


public ActionForward initiateMessReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateMessReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	
 		forward = mapping.findForward("MessReportDates");
 	
 		populateCrewIdDropDown(request);
 		populateRoomDropDown(request);
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateMessReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}





public ActionForward runningRoomReport_old(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  runningRoomReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomReportForm fb = (RunningRoomReportForm) form;
	String checkin_date;
	String checkout_date;
	
	String fromdate = fb.getFrom_date();
	String todate = fb.getTo_date();
	String crewid_filter = fb.getCrew_id_filter();
	String roomno_filter = fb.getRoom_no_filter();
	String location = request.getSession().getAttribute("location").toString();

	
		
	
	
	ArrayList<String> crewid = new ArrayList<String>();
	ArrayList<String> bedno = new ArrayList<String>();
	ArrayList<String> roomno = new ArrayList<String>();
	ArrayList<String> checkin = new ArrayList<String>();
	ArrayList<String> checkin_time = new ArrayList<String>();
	ArrayList<String> checkout = new ArrayList<String>();
	ArrayList<String> checkout_time = new ArrayList<String>();
	
	
	try{
		
		String query1="";
		String where_clause="";
		
		
		if(crewid_filter.trim() != "")
		{
			where_clause = " AND USER_ID_V='" + crewid_filter + "' ";
		}
		
		if(!roomno_filter.equals("Select"))
		{
			where_clause += " AND ROOM_NO_I=" + roomno_filter + " ";
		}
		
		
		if(fromdate == null || todate == null)
		{
			query1 = "SELECT USER_ID_V,BED_NO_I,ROOM_NO_I,DATE_FORMAT(CHECK_IN_D,'%d-%m-%Y %H:%i') CHECK_IN_D, DATE_FORMAT(CHECK_OUT_D,'%d-%m-%Y %H:%i') CHECK_OUT_D FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V IS NOT NULL " +  where_clause;
		}
		else
		{
			query1 = "SELECT USER_ID_V,BED_NO_I,ROOM_NO_I,DATE_FORMAT(CHECK_IN_D,'%d-%m-%Y %H:%i') CHECK_IN_D, DATE_FORMAT(CHECK_OUT_D,'%d-%m-%Y %H:%i') CHECK_OUT_D FROM BED_ALLOCATION_HIS"
					+ " WHERE LOCATION_ID_V='" + location + "' AND STR_TO_DATE(CHECK_IN_D,'%Y-%m-%d') BETWEEN STR_TO_DATE('" + fromdate + "','%d/%m/%Y') AND STR_TO_DATE('" + todate + "','%d/%m/%Y') " + where_clause
					+ " UNION SELECT USER_ID_V,BED_NO_I,ROOM_NO_I,DATE_FORMAT(CHECK_IN_D,'%d-%m-%Y %H:%i') CHECK_IN_D, DATE_FORMAT(CHECK_OUT_D,'%d-%m-%Y %H:%i') CHECK_OUT_D FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V IS NOT NULL "
					+  where_clause;
		}
			
		
		ResultSet rs = db.executeQuery(query1);
		
		while(rs.next())
		{
			checkin_date = rs.getString("CHECK_IN_D");
			checkout_date = rs.getString("CHECK_OUT_D");
			
			//System.out.println("checkin_date : " + checkin_date.substring(0,checkin_date.indexOf(" ")) + " Time : " + checkin_date.substring(checkin_date.indexOf(" ")));
			//System.out.println("checkout_date : " + checkout_date.substring(0,checkout_date.indexOf(" ")) + " Time : " + checkout_date.substring(checkout_date.indexOf(" ")));
			
			crewid.add(rs.getString("USER_ID_V"));
			bedno.add(rs.getString("BED_NO_I"));
			roomno.add(rs.getString("ROOM_NO_I"));
			checkin.add(checkin_date.substring(0,checkin_date.indexOf(" ")));
			checkin_time.add(checkin_date.substring(checkin_date.indexOf(" ")));
			
			if(checkout_date == null)
				checkout.add("-");
			else
				checkout.add(checkout_date.substring(0,checkout_date.indexOf(" ")));
			
			if(checkout_date == null)
				checkout_time.add("-");
			else
			{
				System.out.println("Check Out Date: " + checkout_date);
				System.out.println("Check Out Time: " + checkout_date.substring(checkout_date.indexOf(" ")));
				checkout_time.add(checkout_date.substring(checkout_date.indexOf(" ")));
			}
				
			
			
		}		
		
		
		
		fb.setCrew_id((String[])crewid.toArray(new String[crewid.size()]));
		fb.setBed_no((String[])bedno.toArray(new String[bedno.size()]));;
		fb.setRoom_no((String[])roomno.toArray(new String[roomno.size()]));
		fb.setCheckin((String[])checkin.toArray(new String[checkin.size()]));
		fb.setCheckin_time((String[])checkin_time.toArray(new String[checkin_time.size()]));
		fb.setCheckout((String[])checkout.toArray(new String[checkout.size()]));
		fb.setCheckout_time((String[])checkout_time.toArray(new String[checkout_time.size()]));
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

	
 
 		forward = mapping.findForward("RunningRoomReport");
 	
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  runningRoomReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}



public ActionForward runningRoomReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  runningRoomReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	

	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomReportForm fb = (RunningRoomReportForm) form;
	String checkin_date;
	String checkout_date;
	
	String fromdate = fb.getFrom_date();
	String todate = fb.getTo_date();
	String crewid_filter = fb.getCrew_id_filter();
	String roomno_filter = fb.getRoom_no_filter();
	String location = request.getSession().getAttribute("location").toString();

	
	ArrayList<String> crewid = new ArrayList<String>();
	ArrayList<String> bedno = new ArrayList<String>();
	ArrayList<String> roomno = new ArrayList<String>();
	ArrayList<String> checkin = new ArrayList<String>();
	ArrayList<String> checkin_time = new ArrayList<String>();
	ArrayList<String> checkout = new ArrayList<String>();
	ArrayList<String> checkout_time = new ArrayList<String>();
	ArrayList<String> resthrs = new ArrayList<String>();
	ArrayList<String> wakeuptime = new ArrayList<String>();
	
	
	try{
		
		String query1="";
		String where_clause="";
		
		
		if(crewid_filter.trim() != "")
		{
			where_clause = " AND USER_ID_V='" + crewid_filter + "' ";
		}
		
		if(!roomno_filter.equals("Select"))
		{
			where_clause += " AND ROOM_NO_I=" + roomno_filter + " ";
		}
		
		
		if(fromdate.trim() == "" || todate.trim() == "")
		{
			query1 = "SELECT USER_ID_V,BED_NO_I,ROOM_NO_I,DATE_FORMAT(CHECK_IN_D,'%d-%m-%Y %H:%i') CHECK_IN_D, DATE_FORMAT(CHECK_OUT_D,'%d-%m-%Y %H:%i') CHECK_OUT_D FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND USER_ID_V IS NOT NULL " +  where_clause;
		}
		else
		{
			query1 = "SELECT USER_ID_V,BED_NO_I,ROOM_NO_I,DATE_FORMAT(CHECK_IN_D,'%d-%m-%Y %H:%i') CHECK_IN_D, DATE_FORMAT(CHECK_OUT_D,'%d-%m-%Y %H:%i') CHECK_OUT_D, TIMESTAMPDIFF(HOUR,CHECK_IN_D,CHECK_OUT_D) AS 'DIFF' FROM BED_ALLOCATION_HIS"
					+ " WHERE CHECK_OUT_D IS NOT NULL AND LOCATION_ID_V='" + location + "' AND STR_TO_DATE(CHECK_IN_D,'%Y-%m-%d') BETWEEN STR_TO_DATE('" + fromdate + "','%d/%m/%Y') AND STR_TO_DATE('" + todate + "','%d/%m/%Y') " + where_clause;
					
		}
			
		
		ResultSet rs = db.executeQuery(query1);
		
		while(rs.next())
		{
			checkin_date = rs.getString("CHECK_IN_D");
			checkout_date = rs.getString("CHECK_OUT_D");
			
			//System.out.println("checkin_date : " + checkin_date.substring(0,checkin_date.indexOf(" ")) + " Time : " + checkin_date.substring(checkin_date.indexOf(" ")));
			//System.out.println("checkout_date : " + checkout_date.substring(0,checkout_date.indexOf(" ")) + " Time : " + checkout_date.substring(checkout_date.indexOf(" ")));
			
			crewid.add(rs.getString("USER_ID_V"));
			bedno.add(rs.getString("BED_NO_I"));
			roomno.add(rs.getString("ROOM_NO_I"));
			checkin.add(checkin_date.substring(0,checkin_date.indexOf(" ")));
			checkin_time.add(checkin_date.substring(checkin_date.indexOf(" ")));
			
			if(checkout_date == null)
			{
				checkout.add("-");
				checkout_time.add("-");
				resthrs.add("-");
				wakeuptime.add("-");
			}
			else
			{
				checkout.add(checkout_date.substring(0,checkout_date.indexOf(" ")));
				checkout_time.add(checkout_date.substring(checkout_date.indexOf(" ")));
				resthrs.add(rs.getString("DIFF"));
				wakeuptime.add("-");
			}
				
			
			
			
			
		}		
		
		
		
		fb.setCrew_id((String[])crewid.toArray(new String[crewid.size()]));
		fb.setBed_no((String[])bedno.toArray(new String[bedno.size()]));;
		fb.setRoom_no((String[])roomno.toArray(new String[roomno.size()]));
		fb.setCheckin((String[])checkin.toArray(new String[checkin.size()]));
		fb.setCheckin_time((String[])checkin_time.toArray(new String[checkin_time.size()]));
		fb.setCheckout((String[])checkout.toArray(new String[checkout.size()]));
		fb.setCheckout_time((String[])checkout_time.toArray(new String[checkout_time.size()]));
		fb.setRest_hrs((String[])resthrs.toArray(new String[resthrs.size()]));
		fb.setWakeup_time((String[])wakeuptime.toArray(new String[wakeuptime.size()]));
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

	
 
 		forward = mapping.findForward("RunningRoomReport");
 	
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  runningRoomReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}



public ActionForward occupancyCountReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  occupancyCountReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	

	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomReportForm fb = (RunningRoomReportForm) form;
	
	
	String fromdate = fb.getFrom_date();
	String todate = fb.getTo_date();
	String hourlydate = fb.getHourly_date();
	String frequency = fb.getFrequency();
	String location = request.getSession().getAttribute("location").toString();

	
	ArrayList<String> date = new ArrayList<String>();
	ArrayList<String> hour = new ArrayList<String>();
	ArrayList<String> crewcount = new ArrayList<String>();
	ResultSet rs = null;
	
	try{
		
		String query1="";
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date datefrom = df.parse(fromdate);
		Date dateto = df.parse(todate);
		
	
		
		if(frequency.equals("day"))			
		{
			
			
			while(!datefrom.after(dateto))
			{
				query1 = "SELECT COUNT(*) AS COUNT FROM BED_ALLOCATION_HIS WHERE OCCUPANCY_I=1 AND LOCATION_ID_V='" + location + "' AND (STR_TO_DATE(CHECK_IN_D,'%Y-%m-%d') = STR_TO_DATE('" + df.format(datefrom) + "','%d/%m/%Y')  OR STR_TO_DATE(CHECK_OUT_D,'%Y-%m-%d') = STR_TO_DATE('" + df.format(datefrom) + "','%d/%m/%Y') )";
				
				rs = db.executeQuery(query1);
				
				if(rs.next())
				{
					date.add(df.format(datefrom));			
					hour.add("-");
					crewcount.add(rs.getString("COUNT"));
				}
				datefrom = new Date(datefrom.getTime() + (1000 * 60 * 60 * 24));
			}
			
		
			
		}
		else
		{
			
			int count = 0;
			int total=0;
			while(count < 24)
			{
				query1 = "SELECT LPAD(" + count + ",2,'0') AS HR, LPAD(" + (count + 1) + ",2,'0') AS TR,  COUNT(*) AS COUNT FROM `bed_allocation_his` WHERE OCCUPANCY_I=1 AND LOCATION_ID_V='BKSC' AND STR_TO_DATE(CONCAT('" + hourlydate + "', LPAD(" + count + ",2,'0'),':00'),'%d/%m/%Y %H:%i') BETWEEN CHECK_IN_D AND CHECK_OUT_D";
						
				rs = db.executeQuery(query1);
				if(rs.next())
				{
					date.add(hourlydate);
					if(rs.getString("TR").equals("24"))
						hour.add(rs.getString("HR") + ":00	-	00:00");
					else
						hour.add(rs.getString("HR") + ":00	-	" + rs.getString("TR") + ":00");
					crewcount.add(rs.getString("COUNT"));
					
					total = total + Integer.parseInt(rs.getString("COUNT"));
				}
				count++;
			}
			
			
		}
		
			
			
		
		
		fb.setDate((String[])date.toArray(new String[date.size()]));
		fb.setHour((String[])hour.toArray(new String[hour.size()]));
		fb.setCrew_count((String[])crewcount.toArray(new String[crewcount.size()]));
		
	}catch(Exception e)
	{
		e.printStackTrace();
		
	}
	finally
	{
		 db.closeCon();
		 
	}

 		forward = mapping.findForward("OccupancyCountReport");
 	
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  occupancyCountReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}



public ActionForward getWakeUpCalls(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getWakeUpCalls   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomReportForm fb = (RunningRoomReportForm) form;
	
	String location = request.getSession().getAttribute("location").toString();

	
		
	
	
	ArrayList<String> crewid = new ArrayList<String>();
	ArrayList<String> bedno = new ArrayList<String>();
	ArrayList<String> roomno = new ArrayList<String>();
	ArrayList<String> checkin = new ArrayList<String>();
	ArrayList<String> checkin_time = new ArrayList<String>();
	ArrayList<String> checkout = new ArrayList<String>();
	ArrayList<String> checkout_time = new ArrayList<String>();	
	ArrayList<String> wakeuptime = new ArrayList<String>();
	
	
	try{
		
		String query="";
		
		query = "SELECT USER_ID_V,BED_NO_I,ROOM_NO_I,DATE_FORMAT(WAKE_UP_TIME_D,'%d-%m-%Y %H:%i') WAKE_UP_TIME_D FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND WAKE_UP_TIME_D IS NOT NULL";
		
		
		ResultSet rs = db.executeQuery(query);
		
		while(rs.next())
		{			
			crewid.add(rs.getString("USER_ID_V"));
			bedno.add(rs.getString("BED_NO_I"));
			roomno.add(rs.getString("ROOM_NO_I"));
			checkin.add("-");
			checkin_time.add("-");
			checkout.add("-");
			checkout_time.add("-");			
			wakeuptime.add(rs.getString("WAKE_UP_TIME_D"));	
			
		}		
		
		
		
		fb.setCrew_id((String[])crewid.toArray(new String[crewid.size()]));
		fb.setBed_no((String[])bedno.toArray(new String[bedno.size()]));;
		fb.setRoom_no((String[])roomno.toArray(new String[roomno.size()]));
		fb.setCheckin((String[])checkin.toArray(new String[checkin.size()]));
		fb.setCheckin_time((String[])checkin_time.toArray(new String[checkin_time.size()]));
		fb.setCheckout((String[])checkout.toArray(new String[checkout.size()]));
		fb.setCheckout_time((String[])checkout_time.toArray(new String[checkout_time.size()]));
		fb.setWakeup_time((String[])wakeuptime.toArray(new String[wakeuptime.size()]));
	
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

 
 		forward = mapping.findForward("WakeUpReport");
 	
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getWakeUpCalls   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}



public ActionForward messReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  messReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	MessReportForm fb = (MessReportForm) form;
	
		
	String fromdate = fb.getFrom_date();
	String todate = fb.getTo_date();
	String location = request.getSession().getAttribute("location").toString();
	
	
	ArrayList<String> crewid = new ArrayList<String>();
	ArrayList<String> meal_type = new ArrayList<String>();
	ArrayList<String> food_type = new ArrayList<String>();
	
	
	try{
		
		String query1="";
		
		
		if(fromdate.trim() == "" || todate.trim() == "")
		{
			query1 = "SELECT USER_ID_V,MEAL_TYPE_V,FOOD_TYPE_V FROM MESS_AVAILED_MST WHERE WHERE LOCATION_ID_V='" + location + "'  AND DATE(DATE_TIME_D) = CURDATE()";
		}
		else
		{
			query1 = "SELECT USER_ID_V,MEAL_TYPE_V,FOOD_TYPE_V FROM MESS_AVAILED_MST WHERE LOCATION_ID_V='" + location + "' AND STR_TO_DATE(CHECK_IN_D,'%Y-%m-%d') BETWEEN STR_TO_DATE('" + fromdate + "','%d/%m/%Y') AND STR_TO_DATE('" + todate + "','%d/%m/%Y') "
					+ " UNION "
					+ "SELECT USER_ID_V,MEAL_TYPE_V,FOOD_TYPE_V FROM MESS_AVAILED_HIS WHERE LOCATION_ID_V='" + location + "' AND STR_TO_DATE(CHECK_IN_D,'%Y-%m-%d') BETWEEN STR_TO_DATE('" + fromdate + "','%d/%m/%Y') AND STR_TO_DATE('" + todate + "','%d/%m/%Y') ";
				
		}
			
		
		
		
		
		System.out.println("query1 : " + query1);
		ResultSet rs = db.executeQuery(query1);
		
		while(rs.next())
		{
			//checkin_date = rs.getString("CHECK_IN_D");
			//checkout_date = rs.getString("CHECK_OUT_D");
			
			//System.out.println("checkin_date : " + checkin_date.substring(0,checkin_date.indexOf(" ")) + " Time : " + checkin_date.substring(checkin_date.indexOf(" ")));
			//System.out.println("checkout_date : " + checkout_date.substring(0,checkout_date.indexOf(" ")) + " Time : " + checkout_date.substring(checkout_date.indexOf(" ")));
			
			crewid.add(rs.getString("USER_ID_V"));
			meal_type.add(rs.getString("MEAL_TYPE_V"));
			food_type.add(rs.getString("FOOD_TYPE_V"));
			
						
		}		
		
		
		
		fb.setCrew_id((String[])crewid.toArray(new String[crewid.size()]));
		fb.setMeal_type((String[])meal_type.toArray(new String[meal_type.size()]));
		fb.setFood_type((String[])food_type.toArray(new String[food_type.size()]));
		
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}

 
 		forward = mapping.findForward("MessReport");
 	
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  messReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}







public ActionForward getCurrentOccupantReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getCurrentOccupantReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	RunningRoomReportForm fb = (RunningRoomReportForm) form;
	
		
	
	
	ArrayList<String> crewid = new ArrayList<String>();
	ArrayList<String> bedno = new ArrayList<String>();
	ArrayList<String> roomno = new ArrayList<String>();
	
	try{
		
		String query1="";
		
		
			query1 = "SELECT * FROM BED_ALLOCATION_MST";
		
		
		
		System.out.println("query1 : " + query1);
		ResultSet rs = db.executeQuery(query1);
		
		while(rs.next())
		{
			if(rs.getString("USER_ID_V") != null)
			{
				crewid.add(rs.getString("USER_ID_V"));				
				roomno.add(rs.getString("ROOM_NO_I"));
				bedno.add(rs.getString("BED_NO_I"));
			}
		
		}		
		
		
		
		fb.setCrew_id((String[])crewid.toArray(new String[crewid.size()]));
		fb.setBed_no((String[])bedno.toArray(new String[bedno.size()]));;
		fb.setRoom_no((String[])roomno.toArray(new String[roomno.size()]));
		
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	finally
	{
		 db.closeCon();
		 
	}

 
 		forward = mapping.findForward("CurrentOccupancyReport");
 	
 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getCurrentOccupantReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return (forward);



}








public ActionForward getGuestInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  RunningRoomAction - getGuestInfo   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	String room = rf.getBookedroom();
	String bed = rf.getBookedbed();
	
	PrintWriter out = response.getWriter();
	
	String crewid = "";
	String checkin = "";
	String name = "";
	String desig = "";
	String mobile = "";
	String occupancy="";
	String location = request.getSession().getAttribute("location").toString();
	
	
	
try {
	
	
	

	
	try{
		String query1 = "SELECT USER_ID_V,CHECK_IN_D,OCCUPANCY_I FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "' AND BED_NO_I=" + bed + " AND ROOM_NO_I=" +room;
		
		ResultSet rs2 = db.executeQuery(query1);
		
		if(rs2.next())
		{
			crewid = rs2.getString("USER_ID_V");
			checkin = rs2.getString("CHECK_IN_D");
			
			
			if (rs2.getInt("OCCUPANCY_I") == 0)
				occupancy = "Available";
			else if (rs2.getInt("OCCUPANCY_I") == 1)
				occupancy = "Occupied";
			else
				occupancy = "Blocked";
		}					
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	
	

	try{
		String query1 = "SELECT FIRST_NAME_V,LAST_NAME_V,DESIG_V,MOBILE1_I FROM Crew_Biodata WHERE USER_ID_V='" + crewid + "'";
		ResultSet rs2 = db.executeQuery(query1);
		
		if(rs2.next())
		{
			name  = rs2.getString("FIRST_NAME_V") + " " + rs2.getString("LAST_NAME_V");
			desig = rs2.getString("DESIG_V");
			mobile = rs2.getString("MOBILE1_I");
		}					
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	
	String result = "";
	
	if(crewid == null)
	{
		result = "Room : " + room + " Bed : " + bed + "\n"
				+ "===================\n\n"
				+ "Bed Status : " + occupancy + "\n"	;		
	}
	else
	{
		result = "Room : " + room + " Bed : " + bed + "\n"
				+ "===================\n\n"
				+ "Bed Status : " + occupancy + "\n"			
				+ "Crew ID : " + crewid + " \n"
				+ "Name : " + name + " \n"
				+ "Desig : " + desig + " \n"
				+ "Check In Date : " + checkin.substring(0,10) + " \n"
				+ "Check In Time : " + checkin.substring(11,16) + " \n"
				+ "Mobile : " + mobile;
	}
	
	 out.println(result);
	 out.flush();
	
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}
	
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  RunningRoomAction - getGuestInfo   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward getWakeupInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  RunningRoomAction - getWakeupInfo   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	
	DBConnection db = new DBConnection(); 
	
	PrintWriter out = response.getWriter();
	
	String result = "";
	String name="";
	String time="-";
	String date="-";
	int diff=0;
	String outtrain="-";
	
	
	String location = request.getSession().getAttribute("location").toString();
	
	
	try{
		String query1 = "SELECT TIMESTAMPDIFF(hour,NOW(),WAKE_UP_TIME_D) AS DIFF, A.USER_ID_V,B.FIRST_NAME_V,OUTWARD_TRAIN_V,ROOM_NO_I,BED_NO_I,"
					  + "WAKE_UP_TIME_D, DATE_FORMAT(WAKE_UP_TIME_D,'%d:%m:%Y') WAKE_UP_DATE ,DATE_FORMAT(WAKE_UP_TIME_D,'%H:%i') WAKE_UP_TIME "
					  + "FROM BED_ALLOCATION_MST A, CREW_BIODATA B "
					  + "WHERE A.LOCATION_ID_V='" + location + "'  AND A.USER_ID_V IS NOT NULL AND A.USER_ID_V=B.USER_ID_V  "
					  + "AND (	(TIMESTAMPDIFF(hour,NOW(),WAKE_UP_TIME_D) >= 0) OR (WAKE_UP_TIME_D IS NULL)		)  ORDER BY WAKE_UP_TIME_D";
		
		ResultSet rs2 = db.executeQuery(query1);
		
		result +="<div class='col-sm-12'>";
		result += "<table border='1'>";
		result += "<thead>";
		result += "<th class='text-center'>&nbsp;Date</th>";
		result += "<th class='text-center'>&nbsp;&nbsp;Time&nbsp;&nbsp;</th>";
		result += "<th class='text-center'>&nbsp;Crew</th>";
		result += "<th class='text-center'>&nbsp;Name</th>";		
		result += "<th class='text-center' style='white-space: nowrap'>&nbsp;&nbsp;Out Train&nbsp;&nbsp;</th>";
		result += "<th class='text-center'>&nbsp;&nbsp;Room&nbsp;&nbsp;</th>";
		result += "<th class='text-center'>&nbsp;&nbsp;Bed&nbsp;&nbsp;</th>";
		
		result += "</thead>";
		
		
		
		
		while(rs2.next())
		{
			if(rs2.getString("FIRST_NAME_V") != null)
				name = rs2.getString("FIRST_NAME_V").substring(0, 5);
			
			if(rs2.getString("WAKE_UP_TIME_D") != null)
			{
				date = rs2.getString("WAKE_UP_DATE");
				time = rs2.getString("WAKE_UP_TIME");
			}
				
			if(rs2.getString("OUTWARD_TRAIN_V") != null)
				outtrain = rs2.getString("OUTWARD_TRAIN_V");
			
			if(rs2.getString("DIFF") == null)
			{
				System.out.println(">>>> NULL");
				diff = 2;
			}				
			else
			{
				System.out.println(">>>> NOT NULL");
				diff = rs2.getInt("DIFF");
			}
				
			
			
			
			result += "<tr>";
			result += "<th class='text-center' >" + date + "</th>";
			
			if(diff > 1)
			{
				System.out.println(">>>> NULL" + diff);
				result += "<th class='text-center' bgcolor='white'  >" + time + "</th>";
			}				
			else
			{
				System.out.println(">>>> NOT NULL" + diff);
				result += "<th class='text-center' bgcolor='white' id='time' >" + time + "</th>";
			}
				
			
			
			result += "<th>" + rs2.getString("USER_ID_V") + "&nbsp;&nbsp;</th>";
			result += "<th>" + name + "&nbsp;&nbsp;</th>";			
			result += "<th class='text-center' style='white-space: nowrap'>" + outtrain + "</th>";
			result += "<th class='text-center'>" + rs2.getString("ROOM_NO_I") + "</th>";
			result += "<th class='text-center'>" + rs2.getString("BED_NO_I") + "</th>";
			
			result += "</tr>";
			
		}					
		
		result += "</table>";
		result += "</div>";
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
		
	
	
	 out.println(result);
	 out.flush();
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  RunningRoomAction - getWakeupInfo   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}





public ActionForward block(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  RunningRoomAction - block Bed / Room    >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	RunningRoomForm rf = (RunningRoomForm) form;
	
	DBConnection db = new DBConnection(); 
	
	
	String roomselected = rf.getRoom_selected();
	String bedselected = rf.getBed_selected();
	String blockType = rf.getBlock_type();
	int operation = rf.getOperation_type();
	String location = request.getSession().getAttribute("location").toString();
	

try {
	
	
	
	
	
try{
	String query ="";
    		    			
    		
			if(blockType.equals("ROOM"))
				query = "UPDATE BED_ALLOCATION_MST SET OCCUPANCY_I=" + operation + " WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + roomselected ; 
			else
				query = "UPDATE BED_ALLOCATION_MST SET OCCUPANCY_I=" + operation + "  WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + roomselected + " AND BED_NO_I=" + bedselected ; 
			
    		System.out.println("QUERY   : " + query);
    		int rs = db.executeUpdate(query);
    		System.out.println("Rows Updated : " + rs);
    		
    		if(rs > 0 )
    			rf.setMessage("Record saved successfully");
    		else
    			rf.setMessage("Failure : Please report to supervisor");
    		
    		
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}



HashMap<String,Integer> hmap = new HashMap<String,Integer>();

PrintWriter out = response.getWriter();

try{


	String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "'  ORDER BY ROOM_NO_I";
	ResultSet rs2 = db.executeQuery(query1);
	while(rs2.next())
	{
		
		hmap.put(rs2.getString("ROOM_NO_I") + rs2.getString("BED_NO_I"), rs2.getInt("OCCUPANCY_I"));
		
	}
	
}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}


		
String lt="";

try{

		    			
		String query = "SELECT * FROM ROOM_MST WHERE LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";    		
		
		ResultSet rs = db.executeQuery(query);
		
		while(rs.next())
		{
			int room = rs.getInt("ROOM_NO_I");
			int beds = rs.getInt("NO_OF_BEDS_I");
			
			lt +="<div class='col-sm-" + beds + "'>";
			lt +="<table class='table table-bordered' >";
			lt +="<thead><tr><th bgcolor='grey' class='text-center' colspan='" + beds + "' style='white-space: nowrap'> Room " + room + " </th></tr></thead>";
			//System.out.println("rowcounter  : " + rowcounter  + "Result : " +  (rowcounter % 3));
			
		
			
			lt += "<tbody><tr>"; 
			
			for(int z=0;z<beds;z++)
			{
				
				String rb = room + "" + (z+1);
				int oc = hmap.get(rb);
				
				
				
				lt += "<td bgcolor='grey'>"; 
				
				if(oc == 0)
					lt += "<table class='table table-bordered' id='" + room + "" + (z+1) + "'><thead  onclick=getInfo('" + room + "','" + (z+1) + "')><tr  bgcolor='lightgreen'><th class='text-center'>" + (z+1) + "</th></tr><tbody><tr><td><span style='color:red' class='glyphicon glyphicon-off' onclick=\"block('-1','BED','" + room + "','" + (z+1) + "')\"></span></td></tr></tbody></table>";
				else if(oc == -1)
					lt += "<table class='table table-bordered' id='" + room + "" + (z+1) + "' ><thead onclick=getInfo('" + room + "','" + (z+1) + "')><tr  bgcolor='red'><th class='text-center'>" + (z+1) + "</th></tr><tbody><tr><td><span style='color:green' class='glyphicon glyphicon-off' onclick=\"block('0','BED','" + room + "','" + (z+1) + "')\"></span></td></tr></tbody></table>";
				else
					lt += "<table class='table table-bordered' id='" + room + "" + (z+1) + "' ><thead onclick=getInfo('" + room + "','" + (z+1) + "')><tr  bgcolor='red'><th class='text-center'>" + (z+1) + "</th></tr><tbody><tr><td>&nbsp;</td></tr></tbody></table>";
				
				lt += "</td>"; 
				
			}
			lt += "</tr>";
			lt += "</tbody>"; 
			lt += "</table>";
			lt += "</div>";
			
			
			
			
			
			
		}
		
		
		 
		System.out.println("lt : " + lt);
    	rs.close();
    
    	 out.println(lt);
    	 out.flush();

}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}
	 

}catch(Exception e)
{
	System.out.println("Ex : " + e);
	
}finally
{
	 db.closeCon();
	 
}
	
    	 

	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  block Bed / Room   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 return null;
}





public void populateCrewIdDropDown(HttpServletRequest request)
{
	
	
	 // POPULATE DROPDOWNS
	DBConnection db = new DBConnection();
	String location = request.getSession().getAttribute("location").toString(); 
	 try{
		 
		 String crewid_query = "SELECT DISTINCT USER_ID_V FROM Crew_Biodata ORDER BY USER_ID_V";
		 String desig_query = "SELECT DESIG_V FROM DESIG_MST";
		 System.out.println("Query  : " + crewid_query);
		 ResultSet rs1  = db.executeQuery(crewid_query);	
		 ArrayList crewlist = new ArrayList();
		 ArrayList daylist = new ArrayList();
		 ArrayList monthlist = new ArrayList();
		 ArrayList yearlist = new ArrayList();
		 ArrayList genderlist = new ArrayList();
		 ArrayList desiglist = new ArrayList();
		 ArrayList biostatuslist = new ArrayList();
		 
		 // CREW LIST DROPDOWN
		 
		 crewlist.add("Select");
		 while(rs1.next())
		 {
			crewlist.add(rs1.getString("USER_ID_V"));
		 }
		 
		 
		 
		 request.setAttribute("crewlist", crewlist);
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }

	 
	 
	 
}




public void populateRoomDropDown(HttpServletRequest request)
{
	
	
	 // POPULATE DROPDOWNS
	DBConnection db = new DBConnection();
	String location = request.getSession().getAttribute("location").toString();

	
	 try{
		 
		 String crewid_query = "SELECT DISTINCT ROOM_NO_I FROM bed_allocation_mst WHERE LOCATION_ID_V='" + location + "' ORDER BY ROOM_NO_I";
		 
		
		 ResultSet rs1  = db.executeQuery(crewid_query);	
		 ArrayList<String> roomlist = new ArrayList<String>();
		
		 // CREW LIST DROPDOWN
		 
		 roomlist.add("Select");
		 while(rs1.next())
		 {
			 roomlist.add(rs1.getString("ROOM_NO_I"));
		 }
		 
		 
		 
		 request.setAttribute("roomlist", roomlist);
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }

	 
	 
	 
}





public ActionForward isCrewBooked(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  isCrewBooked   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	DBConnection db = new DBConnection(); 
	RunningRoomForm rf = (RunningRoomForm) form;
	
	PrintWriter out = response.getWriter();
	
	
	String crewid = rf.getCrew_id();
	String result = "";
	
	try{
		String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE USER_ID_V='" + crewid + "'";
		ResultSet rs2 = db.executeQuery(query1);
		
		if(rs2.next())
			result = "Y";
		else
			result = "N";
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}
	 finally
	 {		
		 db.closeCon();
	 }

	
	 out.println(result);
	 out.flush();
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  isCrewBooked   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}


}
















