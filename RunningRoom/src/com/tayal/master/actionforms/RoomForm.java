package com.tayal.master.actionforms;



/*
 * Created on Nov 3, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */


import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

/**
 * @author cms213
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class RoomForm extends ActionForm{
	
	/**
	 * @return Returns the railwayList.
	 */

	
	
	private String message;
	private String location_id;
	private String location_name;
	
	private String roomno;
	private String floorno;
	private String noofbeds;
	private String roomtype;
	
	
	
	private String[] room_no;
	private String[] floor_no;
	private String[] no_of_beds;
	private String[] room_type;
	private String[] category_list;
	private String[] lobby_category_list;
	private String[] assigned_list;
	private String[] lobby_assigned_list;
	
	

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getLocation_id() {
		return location_id;
	}

	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	
	
	public String getRoomno() {
		return roomno;
	}

	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}

	public String getFloorno() {
		return floorno;
	}

	public void setFloorno(String floorno) {
		this.floorno = floorno;
	}

	public String getNoofbeds() {
		return noofbeds;
	}

	public void setNoofbeds(String noofbeds) {
		this.noofbeds = noofbeds;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public String[] getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String[] room_no) {
		this.room_no = room_no;
	}

	public String[] getFloor_no() {
		return floor_no;
	}

	public void setFloor_no(String[] floor_no) {
		this.floor_no = floor_no;
	}

	public String[] getNo_of_beds() {
		return no_of_beds;
	}

	public void setNo_of_beds(String[] no_of_beds) {
		this.no_of_beds = no_of_beds;
	}

	


	public String[] getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String[] room_type) {
		this.room_type = room_type;
	}




	public String[] getCategory_list() {
		return category_list;
	}

	public void setCategory_list(String[] category_list) {
		this.category_list = category_list;
	}




	public String[] getAssigned_list() {
		return assigned_list;
	}

	public void setAssigned_list(String[] assigned_list) {
		this.assigned_list = assigned_list;
	}




	public String[] getLobby_category_list() {
		return lobby_category_list;
	}

	public void setLobby_category_list(String[] lobby_category_list) {
		this.lobby_category_list = lobby_category_list;
	}




	public String[] getLobby_assigned_list() {
		return lobby_assigned_list;
	}

	public void setLobby_assigned_list(String[] lobby_assigned_list) {
		this.lobby_assigned_list = lobby_assigned_list;
	}




	public class Myrow
	{
		
		private String room_no;
		private String floor_no;
		private String no_of_beds;
		private String room_type;
		
		
		
		public String getRoom_no() {
			return room_no;
		}
		public void setRoom_no(String room_no) {
			this.room_no = room_no;
		}
		public String getFloor_no() {
			return floor_no;
		}
		public void setFloor_no(String floor_no) {
			this.floor_no = floor_no;
		}
		public String getNo_of_beds() {
			return no_of_beds;
		}
		public void setNo_of_beds(String no_of_beds) {
			this.no_of_beds = no_of_beds;
		}
		public String getRoom_type() {
			return room_type;
		}
		public void setRoom_type(String room_type) {
			this.room_type = room_type;
		}
		
		
		
		
		
		
		
		

		
	}
	
	
	public ArrayList getMyrows()
	{
		
		int len = room_no.length;
		
		ArrayList selrow = new ArrayList();
		
		
		try{
			RoomForm.Myrow rowobj = this.new Myrow();
			
			for(int i=0;i<len;i++)
			{
				rowobj.room_no = room_no[i];
				rowobj.floor_no = floor_no[i];
				rowobj.no_of_beds = no_of_beds[i];
				rowobj.room_type = room_type[i];
				
				selrow.add(rowobj);
				
			}
		}catch(Exception e)
		 {
			 System.out.println("Error : " + e);
		 }
		
		return selrow;
		
	}
	
	
	
}