package com.tayal.master.action;


import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.tayal.login.actionforms.LoginForm;
import com.tayal.master.actionforms.FoodMenu;
import com.tayal.master.actionforms.MasterForm;
import com.tayal.master.actionforms.RoomForm;
import com.tayal.runningroom.actionforms.RunningRoomForm;
import com.tayal.utility.DBConnection;

// STEP 1 OF ROTATE IMAGE
//public class LoginAction extends DispatchAction implements WebcamImageTransformer{


public class MasterAction extends DispatchAction{
	
	//private final BufferedImageOp filter = new JHFlipFilter(JHFlipFilter.FLIP_90CW);
	
	
	
	


public ActionForward home(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - home >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - home <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("MasterHome");
    return (forward);
}


public ActionForward operatorHome(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - operatorHome >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - operatorHome <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("OperatorHome");
    return (forward);
}





public ActionForward divisionhome(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - divisionhome >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();

	 HttpSession session = request.getSession(true);
	 String role = session.getAttribute("role").toString().trim();
	
	 if(role.equals("DIVISIONADMIN"))
	 {
		 populateLobbyDropDown(request);
		 forward = mapping.findForward("DivisionMaster");
	 }		 
	 else
		 forward = mapping.findForward("MasterHome");
	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - divisionhome <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return (forward);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//ADD DIVISION FUNCTIONALITY BEGINS

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




public ActionForward initiateAddDivision(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - initiateAddDivision >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 
	 
	 
	 
	 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - initiateAddDivision <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddDivision");
    return (forward);
}



public ActionForward getDivisionList(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - getDivisionList >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	
DBConnection db = new DBConnection();


	 try{
		 
		 PrintWriter out = response.getWriter();
		 String res = "<table width='60%' border='0'>"
		 				+ "<tr bgcolor='lightgrey' >"
		 					+ "<td align='center' bgcolor='#ff9933'>Division Code</td>"
		 					+ "<td align='center' bgcolor='#ff9933'>Division Name</td>"
		 					+ "<td align='center' bgcolor='#ff9933'>Delete</td>"
		 				+ "</tr>";
		 
		 
			 
		 
		 String query = "SELECT * FROM DIVISION_LIST";
		 System.out.println("Query  : " + query);
		 ResultSet rs  = db.executeQuery(query);				
		 
		 while(rs.next())
		 {
			 
			 res+= "<tr>";
			 res+= "<td align='center' bgcolor='#ffd9b3'> " + rs.getString("DIVISION_ID_V") + "</td>";
			 res+= "<td align='center' bgcolor='#ffd9b3'> " + rs.getString("DIVISION_NAME_V") + "</td>";
			 res+= "<td align='center' bgcolor='#ffd9b3'><img src='images/delete.png' height='20' width='20' onclick=\"deleteRecord('" + rs.getString("DIVISION_ID_V") + "')\"></td>";	
			 res+= "</tr>";
			
		 }
		 System.out.println("Res  : " + res);
		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - getDivisionList <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}




public ActionForward deleteDivision(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - deleteDivision >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
MasterForm fb = (MasterForm) form;	
DBConnection db = new DBConnection();
String divisiondode = fb.getDivision_code();
String res = "FAIL";

	 try{
		 
		 PrintWriter out = response.getWriter();
		
		 
		 String query = "DELETE FROM DIVISION_LIST WHERE DIVISION_ID_V='" + divisiondode + "'";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);		
		 
		
		 System.out.println("Res  : " + rs);
		 
		 if(rs > 0)
			 res = "SUCCESS";
		 else
			 res = "FAIL";
		 
		 
		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - deleteDivision <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}






public ActionForward addDivision(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - addDivision >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 MasterForm fb = (MasterForm) form;
	 
	 
	 String divisioncode = fb.getDivision_code();
	 String divisionname = fb.getDivision_name();
	 
	 DBConnection db = new DBConnection();
	 
	 
	 try{
		 
		 String query = "INSERT INTO DIVISION_LIST VALUES('" + divisioncode + "','" + divisionname + "')";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);				
		
		 fb.setDivision_code("");
		 fb.setDivision_name("");
		 
		 if(rs == 1)
			 fb.setMessage("Division added successfully");
		 else
			 fb.setMessage("Add location failed");
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - addDivision <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddDivision");
    return (forward);
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ADD DIVISION FUNCTIONALITY ENDS

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//ADD LOBBY FUNCTIONALITY BEGINS

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



public ActionForward initiateAddLobby(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - initiateAddLobby >>>>>>>>>>>>>>>>>>>>>>");
	ActionForward forward = new ActionForward();
	 
	 
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - initiateAddLobby <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddLobby");
    return (forward);
}



public ActionForward getLobbyList(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - getLobbyList >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	
DBConnection db = new DBConnection();

MasterForm fb = (MasterForm) form;
HttpSession session = request.getSession(true);

String divisioncode = session.getAttribute("division").toString().trim();

	 try{
		 
		 PrintWriter out = response.getWriter();
		 
		 
		 String res = "<table class='table table-striped table-bordered table-condensed table-responsive'>"
			 		+ "<thead><tr>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Lobby Code</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Lobby Name</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Delete</th>"
			 		+ "</tr></thead>"
			 		+ "<tbody>";
			 
		 
		 
		 String query = "SELECT * FROM LOBBY_LIST WHERE DIVISION_ID_V='" + divisioncode + "' ORDER BY LOBBY_ID_V";
		 System.out.println("Query  : " + query);
		 ResultSet rs  = db.executeQuery(query);				
		 
		 
			
		 while(rs.next())
		 {
			 
			 res+= "<tr>";
			 res+= "<td align='center' > " + rs.getString("LOBBY_ID_V") + "</td>";
			 res+= "<td align='center' > " + rs.getString("LOBBY_NAME_V") + "</td>";
			 res+= "<td align='center' ><img src='images/delete.png' height='20' width='20' onclick=\"deleteRecord('" + rs.getString("LOBBY_ID_V") + "')\"></td>";
			 res+= "</tr>";
			
		 }
		 
			 
		 System.out.println("Res  : " + res);
		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - getLobbyList <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}





public ActionForward deleteLobby(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - deleteLobby >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
MasterForm fb = (MasterForm) form;	
DBConnection db = new DBConnection();
String lobbycode = fb.getLobby_code();
String res = "FAIL";
HttpSession session = request.getSession(true);
String divisioncode = session.getAttribute("division").toString().trim();

	 try{
		 
		 PrintWriter out = response.getWriter();
		
		 
		 String query = "DELETE FROM LOBBY_LIST WHERE LOBBY_ID_V='" + lobbycode + "' AND DIVISION_ID_V='" + divisioncode + "'";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);		
		 
		
		 System.out.println("Res  : " + rs);
		 
		 if(rs > 0)
			 res = "SUCCESS";
		 else
			 res = "FAIL";
		 
		 
		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - deleteLobby <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}





public ActionForward addLobby(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - addLobby >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 MasterForm fb = (MasterForm) form;
	 
	 
	 
	 String lobbycode = fb.getLobby_code();
	 String lobbyname = fb.getLobby_name();
	 HttpSession session = request.getSession(true);
	 String divisioncode = session.getAttribute("division").toString().trim();
	 DBConnection db = new DBConnection();
	 
	 	
	 try{
		 
		 String query = "INSERT INTO LOBBY_LIST VALUES('" + divisioncode + "','" + lobbycode + "','" + lobbyname + "')";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);				
		
		 fb.setLobby_code("");
		 fb.setLobby_name("");
		 
		 if(rs == 1)
			 fb.setMessage("Lobby added successfully");
		 else
			 fb.setMessage("Add Lobby failed");
		
		 
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - addLobby <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddLobby");
    return (forward);
}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//ADD LOBBY FUNCTIONALITY ENDS

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






public ActionForward initiateAddLocation(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - initiateAddLocation >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - initiateAddLocation <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddLocation");
    return (forward);
}




public ActionForward addLocation(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - addLocation >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 MasterForm fb = (MasterForm) form;
	 
	 String locationid = fb.getLocation_id();
	 String name = fb.getLocation_name();
	 String address = fb.getLocation_address();
	 String city = fb.getLocation_city();
	 String state = fb.getLocation_state();
	 int pin = (fb.getLocation_pin() == null) ? 0: Integer.parseInt(fb.getLocation_pin());
	 
	
	 DBConnection db = new DBConnection();
	 
	 
	 try{
		 
		 String query = "INSERT INTO LOCATION_MST VALUES('" + locationid + "','" + name + "','" + address + "','" + city + "','" + state + "'," + pin + ")";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);				
		
		 fb.setLocation_id("");
		 fb.setLocation_name("");
		 fb.setLocation_address("");
		 fb.setLocation_city("");
		 fb.setLocation_state("");
		 fb.setLocation_pin("");
		 
		 if(rs == 1)
			 fb.setMessage("Location added successfully");
		 else
			 fb.setMessage("Add location failed");
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - addLocation <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddLocation");
    return (forward);
}






public ActionForward initiateAddRooms(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - initiateAddRooms >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	
	 DBConnection db = new DBConnection();

	
	try{
		 
		 //String location = request.getSession().getAttribute("location").toString();
		 String query = "SELECT * FROM ROOM_TYPE ";
		 System.out.println("Query  : " + query);
		 ResultSet rs  = db.executeQuery(query);				
		 ArrayList<String> roomtypelist = new ArrayList<String>();
		 roomtypelist.add("SELECT");
		 while(rs.next())
		 {
			 roomtypelist.add(rs.getString("CATEGORY_V"));
						
		 }
		 request.setAttribute("roomtypelist", roomtypelist);
		
		 
	}catch(Exception e)
	{
		 System.out.println("Error : " + e);
	}
	


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - initiateAddRooms <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddRooms");
    return (forward);
}

/*

public ActionForward getRooms(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - getRooms >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	
DBConnection db = new DBConnection();
ArrayList locationlist = new ArrayList();
RoomForm fb = (RoomForm) form;	 
	 try{
		 
		 PrintWriter out = response.getWriter();
		 
		 ArrayList roomno = new ArrayList();
		 ArrayList floorno = new ArrayList();
		 ArrayList noofbeds = new ArrayList();
		 ArrayList occupancy = new ArrayList();
		 
		 
		 
		 
		 
		 String query = "SELECT * FROM ROOM_MST WHERE LOCATION_ID_V='" + fb.getLocation_id().trim() + "'";
		 System.out.println("Query  : " + query);
		 ResultSet rs  = db.executeQuery(query);				
		 
		 while(rs.next())
		 {
			 roomno.add(rs.getString("ROOM_NO_I"));
			 floorno.add(rs.getString("FLOOR_I"));
			 noofbeds.add(rs.getString("NO_OF_BEDS_I"));
			 occupancy.add(rs.getString("OCCUPANCY_I"));
			 
			 
		 }
		 
		 
		 fb.setRoom_no((String[]) roomno.toArray(new String[roomno.size()]));
		 fb.setFloor_no((String[]) floorno.toArray(new String[floorno.size()]));
		 fb.setNo_of_beds((String[]) noofbeds.toArray(new String[noofbeds.size()]));
		 fb.setOccupancy((String[]) occupancy.toArray(new String[occupancy.size()]));
		 
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - getRooms <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AddRooms");
    return (forward);
}



*/


public ActionForward getRooms(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - getRooms >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
	
DBConnection db = new DBConnection();
RoomForm fb = (RoomForm) form;	 
	 try{
		 
		 
		 PrintWriter out = response.getWriter();
		 
		 String location = request.getSession().getAttribute("location").toString();
			
			
		 String res_room_cat="";
		 String res = "<table class='table table-striped table-bordered table-responsive'>"
		 		+ "<thead><tr>"
		 		+ "<th class='text-center' style='white-space: nowrap'>Room No</th>"
		 		+ "<th class='text-center' style='white-space: nowrap'>Floor</th>"
		 		+ "<th class='text-center' style='white-space: nowrap'>No Of Beds</th>"
		 		+ "<th class='text-center' style='white-space: nowrap'>Room Type</th>"
		 		+ "<th class='text-center' style='white-space: nowrap'>Assigned</th>"
		 		+ "<th class='text-center' style='white-space: nowrap'>Delete</th>"
		 		+ "<th class='text-center' style='white-space: nowrap'>Re-Assign</th>"
		 		+ "</tr></thead>"
		 		+ "<tbody>";
		 

		 String query = "SELECT * FROM ROOM_MST WHERE LOCATION_ID_V='" + location + "' AND FLOOR_I='" + fb.getFloorno().trim() + "' ORDER BY ROOM_NO_I";
		 System.out.println("Query  : " + query);
		 ResultSet rs  = db.executeQuery(query);				
		 
		 while(rs.next())
		 {
			
			 // GET ROOM ASSIGNMENT FOR THIS ROOM
			 try{
				 query = "SELECT DESIG_V FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + rs.getString("ROOM_NO_I");
				 ResultSet rs_cat  = db.executeQuery(query);				
				 
				 res_room_cat = "<table class='table table-striped table-bordered table-condensed table-responsive'><tbody>";
				 while(rs_cat.next())
				 {
					 res_room_cat+= "<tr><td align='center' style='white-space: nowrap' > " + rs_cat.getString("DESIG_V") + "</td></tr>";					
				 }
				 
				 res_room_cat += "</tbody></table>";
				 
			}catch(Exception e)
			{
				 System.out.println("Error : " + e);
			}
			
			 
			 
			 res+= "<tr>";
			 res+= "<td align='center' > " + rs.getString("ROOM_NO_I") + "</td>";
			 res+= "<td align='center' > " + ((rs.getString("FLOOR_I").trim().equals("0")) ? "G" : rs.getString("FLOOR_I")) + "</td>";
			 res+= "<td align='center' > " + rs.getString("NO_OF_BEDS_I") + "</td>";
			 res+= "<td align='center' > " + rs.getString("ROOM_TYPE_V") + "</td>";
			 res+= "<td align='center' > " + res_room_cat + "</td>";
			 res+= "<td align='center' ><img src='images/delete.png' height='20' width='20' onclick=\"deleteRecord('" + rs.getString("ROOM_NO_I") + "')\"></td>";
			 res+= "<td align='center' ><img src='images/assign.png' height='20' width='20' onclick=\"assignRoom('" + rs.getString("ROOM_NO_I") + "')\"></td>";
			 res+= "</tr>";
					
		 }
		 
		 res+= "</tbody>";
		 res+= "</table>";
		 System.out.println("Res  : " + res);
		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - getRooms <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}




public ActionForward initiateAssignRoom(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - initiateAssignRoom >>>>>>>>>>>>>>>>>>>>>>");
	ActionForward forward = new ActionForward();
	
	DBConnection db = new DBConnection();
	
	ArrayList<String> categorylist = new ArrayList<String>();
	ArrayList<String> assignedlist = new ArrayList<String>();
	
	ArrayList<String> lobbycategorylist = new ArrayList<String>();
	ArrayList<String> lobbyassignedlist = new ArrayList<String>();
	
	
	
	//Populate Category List
	String location="";
	RoomForm fb = (RoomForm) form;	 
	fb.setCategory_list(null);
	try{
		 
		 location = request.getSession().getAttribute("location").toString();
		 //String query = "SELECT * FROM CREW_CAT_MST WHERE LOCATION_ID_V='" + location + "'";
		 String query = "SELECT * FROM CREW_CAT_MST";
		 ResultSet rs  = db.executeQuery(query);				
		 
		 
		 while(rs.next())
		 {
			 categorylist.add(rs.getString("CATEGORY_V"));
						
		 }
		
		
		 
	}catch(Exception e)
	{
		 System.out.println("Error : " + e);
	}
	

	try{
		 String query = "SELECT DESIG_V FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
		 ResultSet rs  = db.executeQuery(query);				
		 
		 
		 while(rs.next())
		 {
			 if(categorylist.contains(rs.getString("DESIG_V").trim()))
			 {
				 assignedlist.add(rs.getString("DESIG_V").trim());
				 categorylist.remove(categorylist.indexOf(rs.getString("DESIG_V").trim()));
			 }
			
		 }
		 request.setAttribute("categorylist", categorylist);
		 request.setAttribute("assignedlist", assignedlist);
		 
		 
	}catch(Exception e)
	{
		 System.out.println("Error : " + e);
	}
	
	
	lobbycategorylist = populateLobbyDropDown(request);
	
	try{
		 String query = "SELECT LOBBY_V FROM LOBBY_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
		 ResultSet rs  = db.executeQuery(query);				
		 
		 
		 while(rs.next())
		 {
			 if(lobbycategorylist.contains(rs.getString("LOBBY_V").trim()))
			 {
				 lobbyassignedlist.add(rs.getString("LOBBY_V").trim());
				 lobbycategorylist.remove(lobbycategorylist.indexOf(rs.getString("LOBBY_V").trim()));
			 }
			
		 }
		 
		 if(lobbycategorylist != null)
			 lobbycategorylist.remove("Select");
		 
		 
		 request.setAttribute("lobbycategorylist", lobbycategorylist);
		 request.setAttribute("lobbyassignedlist", lobbyassignedlist);
		 
		 
	}catch(Exception e)
	{
		 System.out.println("Error : " + e);
	}
	
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - initiateAssignRoom <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("AssignRoom");
    return (forward);
}





public ActionForward assignRoom(ActionMapping mapping, ActionForm form,
	HttpServletRequest request, HttpServletResponse response)
throws Exception{

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - assignRoom >>>>>>>>>>>>>>>>>>>>>>");
 ActionForward forward = new ActionForward();

 RoomForm fb = (RoomForm) form;
 
 String query="";
 String roomno = fb.getRoomno();
 String category_list[] = fb.getCategory_list();
 ArrayList<String> queries = new ArrayList<String>();
 String locationid ="";
 DBConnection db = new DBConnection();
 fb.setMessage("");
	 
	 
	  
	 try{
		 //System.out.println(">>>> Length " + category_list.length);
		 
		 locationid = request.getSession().getAttribute("location").toString();
		 for(int i=0; i < category_list.length; i++)
		 {
			 query = "INSERT INTO ROOM_CAT_MST VALUES('" + locationid + "'," + roomno + ",'" + category_list[i] + "')";
			 queries.add(query);
			 //System.out.println(">>>> Room Cat " + category_list[i]);
		 }
		 //System.out.println("Query  : " + query);
		 int rs  = db.executeMyBatch(queries);
		 
		 if(rs <= 0)
			 fb.setMessage("Something went wronge. Please contact Tayaltech");
		 
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	

		ArrayList<String> categorylist = new ArrayList<String>();
		ArrayList<String> assignedlist = new ArrayList<String>();
		
		
		ArrayList<String> lobbycategorylist = new ArrayList<String>();
		ArrayList<String> lobbyassignedlist = new ArrayList<String>();
		
		
		
		
		String location="";
		fb.setCategory_list(null);
		try{
			 
			 location = request.getSession().getAttribute("location").toString();
			 //query = "SELECT * FROM CREW_CAT_MST WHERE LOCATION_ID_V='" + location + "'";
			 query = "SELECT * FROM CREW_CAT_MST";
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 categorylist.add(rs.getString("CATEGORY_V"));
							
			 }
			
			
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		

		try{
			 query = "SELECT DESIG_V FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(categorylist.contains(rs.getString("DESIG_V").trim()))
				 {
					 assignedlist.add(rs.getString("DESIG_V").trim());
					 categorylist.remove(categorylist.indexOf(rs.getString("DESIG_V").trim()));
				 }
				
			 }
			 request.setAttribute("categorylist", categorylist);
			 request.setAttribute("assignedlist", assignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		
		
lobbycategorylist = populateLobbyDropDown(request);
		
		try{
			 query = "SELECT LOBBY_V FROM LOBBY_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(lobbycategorylist.contains(rs.getString("LOBBY_V").trim()))
				 {
					 lobbyassignedlist.add(rs.getString("LOBBY_V").trim());
					 lobbycategorylist.remove(lobbycategorylist.indexOf(rs.getString("LOBBY_V").trim()));
				 }
				
			 }
			 
			 if(lobbycategorylist != null)
				 lobbycategorylist.remove("Select");
			 
			 
			 request.setAttribute("lobbycategorylist", lobbycategorylist);
			 request.setAttribute("lobbyassignedlist", lobbyassignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		
		


		


System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - assignRoom <<<<<<<<<<<<<<<<<<<<<<");
forward = mapping.findForward("AssignRoom");

return (forward);
}



public ActionForward deAssignRoom(ActionMapping mapping, ActionForm form,
	HttpServletRequest request, HttpServletResponse response)
throws Exception{

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - deAssignRoom >>>>>>>>>>>>>>>>>>>>>>");
 ActionForward forward = new ActionForward();

 RoomForm fb = (RoomForm) form;
 
 String query="";
 String roomno = fb.getRoomno();
 String assigned_list[] = fb.getAssigned_list();
 ArrayList<String> queries = new ArrayList<String>();
 String locationid ="";
 DBConnection db = new DBConnection();
 fb.setMessage("");
	 
	  
	 try{
		 //System.out.println(">>>> Length " + category_list.length);
		 
		 locationid = request.getSession().getAttribute("location").toString();
		 for(int i=0; i < assigned_list.length; i++)
		 {
			 query = "DELETE FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + locationid + "' AND ROOM_NO_I=" + roomno + " AND DESIG_V='" + assigned_list[i] + "'";
			 queries.add(query);
			 //System.out.println(">>>> Room Cat " + category_list[i]);
		 }
		 //System.out.println("Query  : " + query);
		 int rs  = db.executeMyBatch(queries);
		 
		 if(rs <= 0)
			 fb.setMessage("Something went wronge. Please contact Tayaltech");
		 
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	

		ArrayList<String> categorylist = new ArrayList<String>();
		ArrayList<String> assignedlist = new ArrayList<String>();
		
		ArrayList<String> lobbycategorylist = new ArrayList<String>();
		ArrayList<String> lobbyassignedlist = new ArrayList<String>();
		
		
		
		
		String location="";
		fb.setCategory_list(null);
		try{
			 
			 location = request.getSession().getAttribute("location").toString();
			 //query = "SELECT * FROM CREW_CAT_MST WHERE LOCATION_ID_V='" + location + "'";
			 query = "SELECT * FROM CREW_CAT_MST";
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 categorylist.add(rs.getString("CATEGORY_V"));
				 System.out.println("categorylist >>>>> : " + rs.getString("CATEGORY_V"));
							
			 }
			
			
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		

		try{
			 query = "SELECT DESIG_V FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(categorylist.contains(rs.getString("DESIG_V").trim()))
				 {
					 assignedlist.add(rs.getString("DESIG_V").trim());
					 categorylist.remove(categorylist.indexOf(rs.getString("DESIG_V").trim()));
				 }
				
			 }
			 request.setAttribute("categorylist", categorylist);
			 request.setAttribute("assignedlist", assignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		
lobbycategorylist = populateLobbyDropDown(request);
		
		try{
			 query = "SELECT LOBBY_V FROM LOBBY_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(lobbycategorylist.contains(rs.getString("LOBBY_V").trim()))
				 {
					 lobbyassignedlist.add(rs.getString("LOBBY_V").trim());
					 lobbycategorylist.remove(lobbycategorylist.indexOf(rs.getString("LOBBY_V").trim()));
				 }
				
			 }
			 
			 if(lobbycategorylist != null)
				 lobbycategorylist.remove("Select");
			 
			 
			 request.setAttribute("lobbycategorylist", lobbycategorylist);
			 request.setAttribute("lobbyassignedlist", lobbyassignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		
		



System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - deAssignRoom <<<<<<<<<<<<<<<<<<<<<<");
forward = mapping.findForward("AssignRoom");

return (forward);
}





public ActionForward assignLobbyToRoom(ActionMapping mapping, ActionForm form,
	HttpServletRequest request, HttpServletResponse response)
throws Exception{

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - assignLobbyToRoom >>>>>>>>>>>>>>>>>>>>>>");
 ActionForward forward = new ActionForward();

 RoomForm fb = (RoomForm) form;
 
 String query="";
 String roomno = fb.getRoomno();
 String lobby_category_list[] = fb.getLobby_category_list();
 ArrayList<String> queries = new ArrayList<String>();
 String locationid ="";
 DBConnection db = new DBConnection();
 fb.setMessage("");
	 
	 
	  
	 try{
		 //System.out.println(">>>> Length " + category_list.length);
		 
		 locationid = request.getSession().getAttribute("location").toString();
		 for(int i=0; i < lobby_category_list.length; i++)
		 {
			 query = "INSERT INTO LOBBY_CAT_MST VALUES('" + locationid + "'," + roomno + ",'" + lobby_category_list[i] + "')";
			 queries.add(query);
			 //System.out.println(">>>> Room Cat " + category_list[i]);
		 }
		 //System.out.println("Query  : " + query);
		 int rs  = db.executeMyBatch(queries);
		 
		 if(rs <= 0)
			 fb.setMessage("Something went wronge. Please contact Tayaltech");
		 
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	

		ArrayList<String> categorylist = new ArrayList<String>();
		ArrayList<String> assignedlist = new ArrayList<String>();
		
		ArrayList<String> lobbycategorylist = new ArrayList<String>();
		ArrayList<String> lobbyassignedlist = new ArrayList<String>();
		
		
		String location="";
		fb.setCategory_list(null);
		try{
			 
			 location = request.getSession().getAttribute("location").toString();
			 //query = "SELECT * FROM CREW_CAT_MST WHERE LOCATION_ID_V='" + location + "'";
			 query = "SELECT * FROM CREW_CAT_MST";
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 categorylist.add(rs.getString("CATEGORY_V"));
							
			 }
			
			
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		

		try{
			 query = "SELECT DESIG_V FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(categorylist.contains(rs.getString("DESIG_V").trim()))
				 {
					 assignedlist.add(rs.getString("DESIG_V").trim());
					 categorylist.remove(categorylist.indexOf(rs.getString("DESIG_V").trim()));
				 }
				
			 }
			 request.setAttribute("categorylist", categorylist);
			 request.setAttribute("assignedlist", assignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		
				
		lobbycategorylist = populateLobbyDropDown(request);
		
		try{
			 query = "SELECT LOBBY_V FROM LOBBY_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(lobbycategorylist.contains(rs.getString("LOBBY_V").trim()))
				 {
					 lobbyassignedlist.add(rs.getString("LOBBY_V").trim());
					 lobbycategorylist.remove(lobbycategorylist.indexOf(rs.getString("LOBBY_V").trim()));
				 }
				
			 }
			 
			 if(lobbycategorylist != null)
				 lobbycategorylist.remove("Select");
			 
			 
			 request.setAttribute("lobbycategorylist", lobbycategorylist);
			 request.setAttribute("lobbyassignedlist", lobbyassignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		
		


System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - assignRoom <<<<<<<<<<<<<<<<<<<<<<");
forward = mapping.findForward("AssignRoom");

return (forward);
}



public ActionForward deAssignLobbyToRoom(ActionMapping mapping, ActionForm form,
	HttpServletRequest request, HttpServletResponse response)
throws Exception{

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - deAssignLobbyToRoom >>>>>>>>>>>>>>>>>>>>>>");
 ActionForward forward = new ActionForward();

 RoomForm fb = (RoomForm) form;
 
 String query="";
 String roomno = fb.getRoomno();
 String lobby_assigned_list[] = fb.getLobby_assigned_list();
 ArrayList<String> queries = new ArrayList<String>();
 String locationid ="";
 DBConnection db = new DBConnection();
 fb.setMessage("");
	 
	  
	 try{
		 //System.out.println(">>>> Length " + category_list.length);
		 
		 locationid = request.getSession().getAttribute("location").toString();
		 for(int i=0; i < lobby_assigned_list.length; i++)
		 {
			 query = "DELETE FROM LOBBY_CAT_MST WHERE LOCATION_ID_V='" + locationid + "' AND ROOM_NO_I=" + roomno + " AND LOBBY_V='" + lobby_assigned_list[i] + "'";
			 queries.add(query);
			 //System.out.println(">>>> Room Cat " + category_list[i]);
		 }
		 //System.out.println("Query  : " + query);
		 int rs  = db.executeMyBatch(queries);
		 
		 if(rs <= 0)
			 fb.setMessage("Something went wronge. Please contact Tayaltech");
		 
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	

		ArrayList<String> categorylist = new ArrayList<String>();
		ArrayList<String> assignedlist = new ArrayList<String>();
		

		ArrayList<String> lobbycategorylist = new ArrayList<String>();
		ArrayList<String> lobbyassignedlist = new ArrayList<String>();
		
		
		String location="";
		fb.setCategory_list(null);
		try{
			 
			 location = request.getSession().getAttribute("location").toString();
			// query = "SELECT * FROM CREW_CAT_MST WHERE LOCATION_ID_V='" + location + "'";
			 query = "SELECT * FROM CREW_CAT_MST";
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 categorylist.add(rs.getString("CATEGORY_V"));
							
			 }
			
			
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		

		try{
			 query = "SELECT DESIG_V FROM ROOM_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(categorylist.contains(rs.getString("DESIG_V").trim()))
				 {
					 assignedlist.add(rs.getString("DESIG_V").trim());
					 categorylist.remove(categorylist.indexOf(rs.getString("DESIG_V").trim()));
				 }
				
			 }
			 request.setAttribute("categorylist", categorylist);
			 request.setAttribute("assignedlist", assignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		

		lobbycategorylist = populateLobbyDropDown(request);
		
		try{
			 query = "SELECT LOBBY_V FROM LOBBY_CAT_MST WHERE LOCATION_ID_V='" + location + "' AND ROOM_NO_I=" + fb.getRoomno();
			 ResultSet rs  = db.executeQuery(query);				
			 
			 
			 while(rs.next())
			 {
				 if(lobbycategorylist.contains(rs.getString("LOBBY_V").trim()))
				 {
					 lobbyassignedlist.add(rs.getString("LOBBY_V").trim());
					 lobbycategorylist.remove(lobbycategorylist.indexOf(rs.getString("LOBBY_V").trim()));
				 }
				
			 }
			 
			 if(lobbycategorylist != null)
				 lobbycategorylist.remove("Select");
			 
			 
			 request.setAttribute("lobbycategorylist", lobbycategorylist);
			 request.setAttribute("lobbyassignedlist", lobbyassignedlist);
			 
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		


System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - deAssignRoom <<<<<<<<<<<<<<<<<<<<<<");
forward = mapping.findForward("AssignRoom");

return (forward);
}








public ActionForward deleteRoom(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - deleteRoom >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
RoomForm fb = (RoomForm) form;	
DBConnection db = new DBConnection();
String roomno = fb.getRoomno();
String res = "FAIL";
String query="";

	 try{
		 
		 PrintWriter out = response.getWriter();
		
		 String location = request.getSession().getAttribute("location").toString();
		 String userid =  request.getSession().getAttribute("username").toString();
		 ArrayList<String> queries = new ArrayList<String>();	
		 

		 //INSERT INTO HISTORY
		 query = "INSERT INTO ROOM_MST_HIS (SELECT *,CURRENT_TIMESTAMP,'" + userid + "' FROM ROOM_MST WHERE ROOM_NO_I='" + roomno + "' AND LOCATION_ID_V='" + location + "')";
		 queries.add(query);
		 query = "INSERT INTO room_cat_mst_his (SELECT *,CURRENT_TIMESTAMP,'" + userid + "' FROM room_cat_mst WHERE ROOM_NO_I='" + roomno + "' AND LOCATION_ID_V='" + location + "')";
		 queries.add(query);
		 
		 
		 //DELETE ENTRIES
		 query = "DELETE FROM ROOM_MST WHERE ROOM_NO_I='" + roomno + "' AND LOCATION_ID_V='" + location + "'";
		 queries.add(query);
		 query = "DELETE FROM bed_allocation_mst WHERE ROOM_NO_I='" + roomno + "' AND LOCATION_ID_V='" + location + "'";
		 queries.add(query);
		 query = "DELETE FROM room_cat_mst WHERE ROOM_NO_I='" + roomno + "' AND LOCATION_ID_V='" + location + "'";
		 queries.add(query);
		 
		 
		 
		 int rs  = db.executeMyBatch(queries);
		 
		
		 System.out.println("Res  : " + rs);
		 
		 if(rs > 0)
			 res = "SUCCESS";
		 else
			 res = "FAIL";
		 
		 System.out.println("Res  : " + res);

		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - deleteRoom <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}







public ActionForward addRoom(ActionMapping mapping, ActionForm form,
	HttpServletRequest request, HttpServletResponse response)
throws Exception{

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - addRoom >>>>>>>>>>>>>>>>>>>>>>");
 ActionForward forward = new ActionForward();

 RoomForm fb = (RoomForm) form;
 
 String query="";
 String roomno = fb.getRoomno();
 String floorno = fb.getFloorno();
 String noofbeds = fb.getNoofbeds();
 String roomtype = fb.getRoomtype();
 
 String room_type[] = fb.getRoom_type();
 ArrayList<String> queries = new ArrayList<String>();
 boolean duplicate = false;

 
 
 String locationid ="";
 
 int beds = Integer.parseInt(noofbeds);
 
 
  
  DBConnection db = new DBConnection();
	 
	 
  
try{
	
	 locationid = request.getSession().getAttribute("location").toString();
	 query = "SELECT * FROM ROOM_MST WHERE LOCATION_ID_V='" + locationid + "' AND ROOM_NO_I=" + roomno ;
	 ResultSet rs1 = db.executeQuery(query);
	 
	 if(rs1.next())
	 {
		 fb.setMessage("Room already exists");
		 duplicate = true;
		
	 }
	 
	  
}catch(Exception e)
{
	 System.out.println("Error : " + e);
}



if(!duplicate)
{

	 try{
		 locationid = request.getSession().getAttribute("location").toString();
		 query = "INSERT INTO ROOM_MST VALUES('" + locationid + "'," + roomno + "," + floorno + "," + noofbeds + ",'" + roomtype + "')";
		 queries.add(query);
		 
		 
		 //System.out.println("Query  : " + query);
		 //int rs  = db.executeUpdate(query);				
		
		 fb.setRoomno("");
		 //fb.setFloorno("0");
		 fb.setRoomtype("SELECT");
		 
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 
	 

	 
	 try{
		 query="";
		 
		 for(int i=1;i<=beds;i++)
		 {
			 
			 query = "INSERT INTO BED_ALLOCATION_MST (LOCATION_ID_V,ROOM_NO_I,BED_NO_I,OCCUPANCY_I) VALUES('" + locationid + "'," + roomno + "," + i + ",0)";
			 queries.add(query);
			 		 
		 }
		 
		 
	  int rs = db.executeMyBatch(queries);
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	 

}
  	 
	 
		
		try{
			 
			
			 query = "SELECT * FROM ROOM_TYPE";
			 System.out.println("Query  : " + query);
			 ResultSet rs  = db.executeQuery(query);				
			 ArrayList roomtypelist = new ArrayList();
			 //roomtypelist.add("SELECT");
			 while(rs.next())
			 {
				 roomtypelist.add(rs.getString("CATEGORY_V"));
							
			 }
			 request.setAttribute("roomtypelist", roomtypelist);
			
			 
		}catch(Exception e)
		{
			 System.out.println("Error : " + e);
		}
		


	

System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - addRoom <<<<<<<<<<<<<<<<<<<<<<");
forward = mapping.findForward("AddRooms");

return (forward);
}




public ActionForward initiateLogin(ActionMapping mapping, ActionForm form,
	HttpServletRequest request, HttpServletResponse response)
throws Exception{

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - initiateLogin >>>>>>>>>>>>>>>>>>>>>>");
 ActionForward forward = new ActionForward();

 LoginForm lf = (LoginForm) form;
 String userid = lf.getUser_id();
 String pwd = lf.getPassword();
 
 
 
 System.out.println("Crew Id : " + userid);
 
  
  DBConnection db = new DBConnection();
	 
		 
	 try{
		 
		 ResultSet rs  = db.executeQuery("SELECT * FROM USER_MAST WHERE USER_ID_V='" + userid + "'");				
		 
		if(rs.next())
		{
			if(rs.getString("PASSWORD_V").trim().equals(pwd))
			{
				forward = mapping.findForward("Master");
			}
			else
			{
				lf.setMessage("Invalid user id / password");
				forward = mapping.findForward("Login");
			}
		}else
		{
			lf.setMessage("Invalid user id / password");
			forward = mapping.findForward("Admin");
		}
		 
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	 


System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< LoginAction - initiateLogin <<<<<<<<<<<<<<<<<<<<<<");
  

return (forward);
}




public ActionForward initiateMess(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateMess   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	ActionForward forward = new ActionForward();
	
	ArrayList<String> foodtypelist = new ArrayList<String> (); 	
 	foodtypelist.add("Select");
 	foodtypelist.add("VEG");
 	foodtypelist.add("NONVEG"); 	
 	request.setAttribute("foodtypelist", foodtypelist);	
 	
 	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateMess   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
	forward = mapping.findForward("MessMenu");
    return (forward);



}


public ActionForward initiateFoodMenuEntry(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  initiateFoodMenuEntry   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	ActionForward forward = new ActionForward();
	FoodMenu fb = (FoodMenu) form;
	fb.setMessage("");
	fb.setWeekday("Select");
	fb.setMeal_type("Select");
	fb.setFood_type("Select");
	
	
	ArrayList<String> weekdaylist = new ArrayList<String> (); 	
	weekdaylist.add("Select");
	weekdaylist.add("SUN");
	weekdaylist.add("MON");
	weekdaylist.add("TUE"); 
	weekdaylist.add("WED"); 
	weekdaylist.add("THU"); 
	weekdaylist.add("FRI"); 
	weekdaylist.add("SAT"); 
 	request.setAttribute("weekdaylist", weekdaylist);	
 	
 	 	
	ArrayList<String> mealtypelist = new ArrayList<String> (); 	
	mealtypelist.add("Select");
	mealtypelist.add("BREAKFAST");
	mealtypelist.add("LUNCH");
	mealtypelist.add("DINNER"); 	
 	request.setAttribute("mealtypelist", mealtypelist);	
 	
 	
 	
	ArrayList<String> foodtypelist = new ArrayList<String> (); 	
 	foodtypelist.add("Select");
 	foodtypelist.add("VEG");
 	foodtypelist.add("NONVEG"); 	
 	request.setAttribute("foodtypelist", foodtypelist);	
 	
 	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  initiateFoodMenuEntry   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
	forward = mapping.findForward("ModifyMenu");
    return (forward);



}




public ActionForward saveMenu(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - saveMenu >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	 FoodMenu fb = (FoodMenu) form;
	 String location = request.getSession().getAttribute("location").toString();
	 
	 

		ArrayList<String> weekdaylist = new ArrayList<String> (); 	
		weekdaylist.add("Select");
		weekdaylist.add("SUN");
		weekdaylist.add("MON");
		weekdaylist.add("TUE"); 
		weekdaylist.add("WED"); 
		weekdaylist.add("THU"); 
		weekdaylist.add("FRI"); 
		weekdaylist.add("SAT"); 
	 	request.setAttribute("weekdaylist", weekdaylist);	
	 	
	 	
		ArrayList<String> mealtypelist = new ArrayList<String> (); 	
		mealtypelist.add("Select");
		mealtypelist.add("BREAKFAST");
		mealtypelist.add("LUNCH");
		mealtypelist.add("DINNER"); 
	 	request.setAttribute("mealtypelist", mealtypelist);	
	 	
	 	
		ArrayList<String> foodtypelist = new ArrayList<String> (); 	
	 	foodtypelist.add("Select");
	 	foodtypelist.add("VEG");
	 	foodtypelist.add("NONVEG"); 	
	 	request.setAttribute("foodtypelist", foodtypelist);
	 	
	 	
	 String weekday = fb.getWeekday();
	 String item = fb.getItem_name();
	 String type = fb.getFood_type();
	 String meal_type = fb.getMeal_type();
	 
	 DBConnection db = new DBConnection();
	 
	 
	 try{
		 
		 String query = "INSERT INTO FOOD_MENU_MST (WEEKDAY_V, ITEM_V, MEAL_TYPE_V, TYPE_V, LOCATION_ID_V) VALUES('" + weekday + "','" + item + "','" + meal_type + "','" + type + "','" + location + "')";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);				
		
		
		 if(rs == 1)
			 fb.setMessage( item + " added successfully to the " + type + " menu");
		 else
			 fb.setMessage("Failed !!!");
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	
	 
	
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - saveMenu <<<<<<<<<<<<<<<<<<<<<<");
	  
    forward = mapping.findForward("ModifyMenu");
    return (forward);
}





public ActionForward getMenuForAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getMenuForAdmin   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	ActionForward forward = new ActionForward();
	DBConnection db = new DBConnection(); 
	FoodMenu rf = (FoodMenu) form;
	
	
	String weekday = rf.getWeekday();
	String meal_type = rf.getMeal_type();
	String food_type = rf.getFood_type();
	PrintWriter out = response.getWriter();
	String location = request.getSession().getAttribute("location").toString();

	

	
	String res = "";
		
	try{
		String query1 = "SELECT * FROM FOOD_MENU_MST WHERE LOCATION_ID_V='" + location + "' AND WEEKDAY_V='" + weekday + "' AND MEAL_TYPE_V='" + meal_type + "' ORDER BY TYPE_V DESC";
		System.out.println(" QUERY : " + query1 );
		ResultSet rs2 = db.executeQuery(query1);
		
		  res = "<table class='table table-striped table-bordered table-condensed table-responsive'>"
			 		+ "<thead><tr>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Sr. No</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Item</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Type</th>"
			 		+ "<th class='text-center' style='white-space: nowrap'>Delete</th>"
			 		+ "</tr></thead>"
			 		+ "<tbody>";
			 
		int counter = 1;
		while(rs2.next())
		{
			 res+= "<tr>";
			 res+= "<td align='center' > " + counter + "</td>";
			 res+= "<td align='center' > " + rs2.getString("ITEM_V") + "</td>";
			 
			 if(rs2.getString("TYPE_V").equals("VEG"))
				 res+= "<td align='center' > <img src='images/veg.png' height='20' width='20'/></td>";
			 else
				 res+= "<td align='center' > <img src='images/nonveg.png' height='20' width='20'/></td>";
			 
			 res+= "<td align='center' ><img src='images/delete.png' height='20' width='20' onclick=\"deleteRecord('" + rs2.getString("ITEM_V") + "')\"></td>";
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
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getMenuForAdmin   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward deleteMenuItem(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
 throws Exception{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> MasterAction - deleteMenuItem >>>>>>>>>>>>>>>>>>>>>>");
	 ActionForward forward = new ActionForward();
	
	
FoodMenu fb = (FoodMenu) form;	
DBConnection db = new DBConnection();
String item = fb.getItem_name();
String res = "FAIL";

	 try{
		 
		 PrintWriter out = response.getWriter();
		
		 
		 String query = "DELETE FROM FOOD_MENU_MST WHERE ITEM_V='" + item + "'";
		 System.out.println("Query  : " + query);
		 int rs  = db.executeUpdate(query);		
		 
		
		 System.out.println("Res  : " + rs);
		 
		 if(rs > 0)
			 res = "SUCCESS";
		 else
			 res = "FAIL";
		 
		 
		 out.println(res);
		 out.flush();
		
		
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		// db.closeCon();
	 }
	
	 


	 
	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<< MasterAction - deleteMenuItem <<<<<<<<<<<<<<<<<<<<<<");
	  
    
    return null;
}







public ActionForward getDashboard_old_tableformat(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getDashboard   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	
	DBConnection db = new DBConnection(); 
	
	PrintWriter out = response.getWriter();
	
	int total = 0;
	int occupancy = 0;
	int availability = 0;
	int blocked = 0;
	int breakfast = 0;
	int lunch = 0;
	int dinner = 0;
	boolean availed=false;
	int total_mess_availed = 0;
	String lt = "";
	
	try{
		String query1 = "SELECT * FROM BED_ALLOCATION_MST";
		ResultSet rs = db.executeQuery(query1);
		while(rs.next())
		{
			total++; 
			
			if(rs.getInt("OCCUPANCY_I") == 1)
				occupancy++;
			if(rs.getInt("OCCUPANCY_I") == 0)
				availability++;			
			if(rs.getInt("OCCUPANCY_I") == -1)
				blocked++;
			
			if(rs.getInt("OCCUPANCY_I") == 1)
			{
				if(rs.getString("BREAKFAST_V").equals("Y"))
				{
					availed = true;
					breakfast++;
				}
					
				if(rs.getString("LUNCH_V").equals("Y"))
				{
					availed = true;
					lunch++;
				}
					
				if(rs.getString("DINNER_V").equals("Y"))
				{
					availed = true;
					dinner++;
				}
										
			}
			
			if(availed)
			{
				total_mess_availed++;
				availed=false;
			}
			
			
		}
		
		
		
		
		
		
	
	
		lt +="<div >";
		lt +="<table class='table table-bordered table-condensed'  >";
		lt +="<thead>"
				+ "<tr><th colspan='4' bgcolor='lightgreen'> Occupancy Status </th></tr>"
				+ "<tr>"
				+ "<th class='text-center' style='white-space: nowrap'> Total <span class='badge'>" + total + "</span></th>"
				+ "<th class='text-center' style='white-space: nowrap'> Occupied <span class='badge'>" + occupancy + "</span></th>"
				+ "<th class='text-center' style='white-space: nowrap'> Available <span class='badge'>" + availability + "</span></th>"
				+ "<th class='text-center' style='white-space: nowrap'> Maintainance <span class='badge'>" + blocked + "</span></th>"
				+ "</tr>"
		   + "</thead>"
		   + "<tbody>"
		   		+ "<tr>"
		   		+ "<td>" + total + "</td>"
		   		+ "<td><a href='#' onclick='getOccupants()'>" + occupancy + "<a></td>"
		   		+ "<td>" + availability + "</td>"
		   		+ "<td>" + blocked + "</td>"
		   		+ "</tr>"
		   + "</tbody>";
	
		lt +="<thead>"
				+ "<tr><th colspan='4' bgcolor='lightblue'> Mess Status </th></tr>"
				+ "<tr>"				
				+ "<th class='text-center' style='white-space: nowrap'> Availed</th>"				
				+ "<th class='text-center' style='white-space: nowrap'> Breakfast </th>"
				+ "<th class='text-center' style='white-space: nowrap'> Lunch</th>"
				+ "<th class='text-center' style='white-space: nowrap'> Dinner</th>"
		   + "</tr></thead>"
		   + "<tbody><tr>"
		   		+ "<td>" + total_mess_availed + "</td>"		   		
		   		+ "<td>" + breakfast + "</td>"
		   		+ "<td>" + lunch + "</td>"
		   		+ "<td>" + dinner + "</td>"
		   	+ "</tr></tbody></table>"
		    + "</div>";

		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	System.out.println("" + lt);
		
	
	 out.println(lt);
	 out.flush();
			

	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getDashboard   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}




public ActionForward getDashboard(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getDashboard   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	
	DBConnection db = new DBConnection(); 
	
	PrintWriter out = response.getWriter();
	
	int total = 0;
	int occupancy = 0;
	int availability = 0;
	int blocked = 0;
	int breakfast = 0;
	int lunch = 0;
	int dinner = 0;
	boolean availed=false;
	int total_mess_availed = 0;
	String lt = "";
	
	try{
		
		
		String location = request.getSession().getAttribute("location").toString();
		
		String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "'" ;
		ResultSet rs = db.executeQuery(query1);
		while(rs.next())
		{
			total++; 
			
			if(rs.getInt("OCCUPANCY_I") == 1)
				occupancy++;
			if(rs.getInt("OCCUPANCY_I") == 0)
				availability++;			
			if(rs.getInt("OCCUPANCY_I") == -1)
				blocked++;
			
			if(rs.getInt("OCCUPANCY_I") == 1)
			{
				if(rs.getString("BREAKFAST_V").equals("Y"))
				{
					availed = true;
					breakfast++;
				}
					
				if(rs.getString("LUNCH_V").equals("Y"))
				{
					availed = true;
					lunch++;
				}
					
				if(rs.getString("DINNER_V").equals("Y"))
				{
					availed = true;
					dinner++;
				}
										
			}
			
			if(availed)
			{
				total_mess_availed++;
				availed=false;
			}
			
			
			
		}
		
		
		lt ="Total" + total + "Occupancy" + occupancy + "Availability" + availability + "Blocked" + blocked ;
		lt +="TotalAvailed"+ total_mess_availed + "Breakfast" + breakfast + "Lunch" + lunch + "Dinner" + dinner ;
		
		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	System.out.println("" + lt);
		
	
	 out.println(lt);
	 out.flush();
			

	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getDashboard   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}






public ActionForward getDashboardForKiosk(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getDashboardForKiosk   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	
	DBConnection db = new DBConnection(); 
	
	PrintWriter out = response.getWriter();
	
	int total = 0;
	int occupancy = 0;
	int availability = 0;
	int blocked = 0;
	
	String lt = "";
	String location = request.getSession().getAttribute("location").toString();

	
	try{
		String query1 = "SELECT * FROM BED_ALLOCATION_MST WHERE LOCATION_ID_V='" + location + "'";
		ResultSet rs = db.executeQuery(query1);
		while(rs.next())
		{
			total++; 
			
			if(rs.getInt("OCCUPANCY_I") == 1)
				occupancy++;
			if(rs.getInt("OCCUPANCY_I") == 0)
				availability++;
			if(rs.getInt("OCCUPANCY_I") == -1)
				blocked++;
		
		}
		
		
		
		lt +="<div >";
		lt +="<table class='table table-bordered table-condensed'  >";
		lt +="<thead>"
				
				+ "<tr>"
				+ "<th class='text-center' style='white-space: nowrap' bgcolor='lightblue'> Total <h4>(" + total + ") </h4></th>"
				+ "<th class='text-center' style='white-space: nowrap' bgcolor='pink'> Booked <h4>(" + occupancy + ")  </h4></th>"
				+ "<th class='text-center' style='white-space: nowrap' bgcolor='lightgreen'> Available<h4> (" + availability + ") </h4> </th>"
				+ "<th class='text-center' style='white-space: nowrap' bgcolor='lightgrey'> Maint. <h4>(" + blocked + ")  </h4></th>"
				+ "</tr>"
		   + "</thead>"
		  
		   + "</table>"
		   + "</div>";

		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	System.out.println("" + lt);
		
	
	 out.println(lt);
	 out.flush();
			

	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getDashboardForKiosk   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}











public ActionForward getCurrentOccupantReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
{
	
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  getCurrentOccupantReport   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	
	
	
	DBConnection db = new DBConnection(); 
	
	PrintWriter out = response.getWriter();
	
	int total = 0;
	int occupancy = 0;
	int availability = 0;
	int veg = 0;
	int nonveg = 0;
	String lt = "";
	
	try{
		String query1 = "SELECT * FROM BED_ALLOCATION_MST";
		ResultSet rs = db.executeQuery(query1);
		while(rs.next())
		{
			total++; 
			
			if(rs.getInt("OCCUPANCY_I") == 1)
				occupancy++;
			if(rs.getInt("OCCUPANCY_I") == 0)
				availability++;
			if(rs.getString("FOOD_TYPE_V").equals("VEG"))
				veg++;
			if(rs.getString("FOOD_TYPE_V").equals("NONVEG"))
				nonveg++;
			
		}
		
		
		int total_mess_availed = veg + nonveg;
		
		
		
	
		
	
		lt +="<div >";
		lt +="<table class='table table-bordered table-condensed'  >";
		lt +="<thead>"
				+ "<tr><th colspan='3' bgcolor='lightgreen'> Occupancy Status </th></tr>"
				+ "<tr>"
				+ "<th class='text-center' style='white-space: nowrap'> Total</th>"
				+ "<th class='text-center' style='white-space: nowrap'> Occupied</th>"
				+ "<th class='text-center' style='white-space: nowrap'> Available</th>"
				+ "</tr>"
		   + "</thead>"
		   + "<tbody>"
		   		+ "<tr>"
		   		+ "<td>" + total + "</td>"
		   		+ "<td><a href='#' onclick='getOccupants()'>" + occupancy + "<a></td>"
		   		+ "<td>" + availability + "</td>"
		   		+ "</tr>"
		   + "</tbody>"
		   + "</table>"
		   + "</div>";
		
		
		lt +="<div>&nbsp;</div>";
		
		lt +="<div>";
		lt +="<table class='table table-bordered table-condensed' >";
		lt +="<thead>"
				+ "<tr><th colspan='3' bgcolor='lightblue'> Mess Status </th></tr>"
				+ "<tr>"				
				+ "<th class='text-center' style='white-space: nowrap'> Availed</th>"				
				+ "<th class='text-center' style='white-space: nowrap'> Veg </th>"
				+ "<th class='text-center' style='white-space: nowrap'> Non Veg</th>"
		   + "</tr></thead>"
		   + "<tbody><tr>"
		   		+ "<td>" + total_mess_availed + "</td>"		   		
		   		+ "<td>" + veg + "</td>"
		   		+ "<td>" + nonveg + "</td>"
		   	+ "</tr></tbody></table>"
		    + "</div>";

		
		
	}catch(Exception e)
	{
		System.out.println("Ex : " + e);
		
	}finally
	{
		 db.closeCon();
		 
	}
	System.out.println("" + lt);
		
	
	 out.println(lt);
	 out.flush();
			

	
	System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  getCurrentOccupantReport   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
	System.out.println("\n\n\n\n\n");
	
	 
    
    return null;



}






public ArrayList<String> populateLobbyDropDown(HttpServletRequest request)
{

	
	 // POPULATE DROPDOWNS
	DBConnection db = new DBConnection();
	String division = request.getSession().getAttribute("division").toString();
	ArrayList<String> lobbylist = new ArrayList<String>();
	 try{
		 
		     String query = "SELECT * FROM LOBBY_LIST WHERE DIVISION_ID_V='" + division + "' ORDER BY LOBBY_ID_V";
	 		 ResultSet rs  = db.executeQuery(query);	
	 		 
	 		lobbylist.add("Select");
	 		 while(rs.next())
	 		 {
	 			lobbylist.add(rs.getString("LOBBY_ID_V").trim());
	 		 }
	 		
	 		 request.setAttribute("lobbylist", lobbylist);	
		 
	 }catch(Exception e)
	 {
		 System.out.println("Error : " + e);
	 }
	 finally
	 {		
		 db.closeCon();
	 }
	 
	 return lobbylist;

}












}
















