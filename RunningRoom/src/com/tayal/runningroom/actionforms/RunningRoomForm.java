package com.tayal.runningroom.actionforms;



/*
 * Created on Nov 3, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */


import java.util.ArrayList;
import java.util.logging.Logger;

import org.apache.struts.action.ActionForm;

/**
 * @author cms213
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class RunningRoomForm extends ActionForm{
	
	/**
	 * @return Returns the railwayList.
	 */
	
	
	private String message;
	private String crew_id;
	private String category;
	private String booked;
	private String bookedroom;
	private String bookedbed;
	private String checkin_date;
	private String checkout_date;
	private String location_id;
	private String method;
	
	private String room_selected;
	private String bed_selected;
	private String mess_availed;
	private String meal_type;
	private String food_type;
	private String block_type;
	private int operation_type;
	
	private String subsidy;
	private String breakfast;
	private String breakfast_cat;	
	private String breakfast_qty;
	
	private String lunch;
	private String lunch_cat;	
	private String lunch_qty;
		
	private String dinner;
	private String dinner_cat;
	private String dinner_qty;
	
	private String parcel;
	
	private String wakeup_time;
	
	




	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	public String getBookedroom() {
		return bookedroom;
	}
	public void setBookedroom(String bookedroom) {
		this.bookedroom = bookedroom;
	}
	public String getBookedbed() {
		return bookedbed;
	}
	public void setBookedbed(String bookedbed) {
		this.bookedbed = bookedbed;
	}
	public String getBooked() {
		return booked;
	}
	public void setBooked(String booked) {
		this.booked = booked;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCrew_id() {
		return crew_id;
	}
	public void setCrew_id(String crew_id) {
		this.crew_id = crew_id;
	}
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getRoom_selected() {
		return room_selected;
	}
	public void setRoom_selected(String room_selected) {
		this.room_selected = room_selected;
	}
	public String getBed_selected() {
		return bed_selected;
	}
	public void setBed_selected(String bed_selected) {
		this.bed_selected = bed_selected;
	}
	public int getOperation_type() {
		return operation_type;
	}
	public void setOperation_type(int operation_type) {
		this.operation_type = operation_type;
	}
	public String getMess_availed() {
		return mess_availed;
	}
	public void setMess_availed(String mess_availed) {
		this.mess_availed = mess_availed;
	}
	public String getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}
	public String getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}
	public String getFood_type() {
		return food_type;
	}
	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}
	public String getBlock_type() {
		return block_type;
	}
	public void setBlock_type(String block_type) {
		this.block_type = block_type;
	}





	public String getSubsidy() {
		return subsidy;
	}
	public void setSubsidy(String subsidy) {
		this.subsidy = subsidy;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getBreakfast_cat() {
		return breakfast_cat;
	}
	public void setBreakfast_cat(String breakfast_cat) {
		this.breakfast_cat = breakfast_cat;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getLunch_cat() {
		return lunch_cat;
	}
	public void setLunch_cat(String lunch_cat) {
		this.lunch_cat = lunch_cat;
	}
	public String getDinner() {
		return dinner;
	}
	public void setDinner(String dinner) {
		this.dinner = dinner;
	}
	public String getDinner_cat() {
		return dinner_cat;
	}
	public void setDinner_cat(String dinner_cat) {
		this.dinner_cat = dinner_cat;
	}
	public String getBreakfast_qty() {
		return breakfast_qty;
	}
	public void setBreakfast_qty(String breakfast_qty) {
		this.breakfast_qty = breakfast_qty;
	}
	public String getLunch_qty() {
		return lunch_qty;
	}
	public void setLunch_qty(String lunch_qty) {
		this.lunch_qty = lunch_qty;
	}
	public String getDinner_qty() {
		return dinner_qty;
	}
	public void setDinner_qty(String dinner_qty) {
		this.dinner_qty = dinner_qty;
	}
	public String getWakeup_time() {
		return wakeup_time;
	}
	public void setWakeup_time(String wakeup_time) {
		this.wakeup_time = wakeup_time;
	}
	public String getParcel() {
		return parcel;
	}
	public void setParcel(String parcel) {
		this.parcel = parcel;
	}





	private String[] room_no;
	private String[] no_of_beds;
	
	
	public String[] getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String[] room_no) {
		this.room_no = room_no;
	}
	public String[] getNo_of_beds() {
		return no_of_beds;
	}
	public void setNo_of_beds(String[] no_of_beds) {
		this.no_of_beds = no_of_beds;
	}
	
	
	
	
	
	
	public class Myrow
	{
		

		
		private String room_no;
		private String no_of_beds;
		
		
		
		public String getRoom_no() {
			return room_no;
		}
		public void setRoom_no(String room_no) {
			this.room_no = room_no;
		}
		public String getNo_of_beds() {
			return no_of_beds;
		}
		public void setNo_of_beds(String no_of_beds) {
			this.no_of_beds = no_of_beds;
		}
				
		
		
	}	//CLASS Myrow ENDS HERE
	
	
	
	
	
	public ArrayList getMyrows()
	{
		
		
		int length = room_no.length;
		
		ArrayList selrow = new ArrayList();
		
		
		try{
			
			if(length != 0)
			{
				for(int i=0; i<length; i++)
				{
					RunningRoomForm.Myrow rowobj = this.new Myrow();
					
					
					rowobj.room_no = room_no[i];
					rowobj.no_of_beds = no_of_beds[i];
					
					selrow.add(rowobj);
				}
			}
			
		}catch(Exception e)
		{
			
		}
		
		
		return selrow;
	}
	
	
	
	
	private String[] category_list;

	
	public String[] getCategory_list() {
		return category_list;
	}
	public void setCategory_list(String[] category_list) {
		this.category_list = category_list;
	}






	public class Mycategory
	{
		
		private String category_list;

		public String getCategory_list() {
			return category_list;
		}

		public void setCategory_list(String category_list) {
			this.category_list = category_list;
		}
		
		
	}	//CLASS Myrow ENDS HERE
	
	
	

	
	public ArrayList getMycategorys()
	{
		
		
		int length = category_list.length;
		
		ArrayList selrow = new ArrayList();
		
		
		try{
			
			if(length != 0)
			{
				for(int i=0; i<length; i++)
				{
					RunningRoomForm.Mycategory rowobj = this.new Mycategory();
					
					
					rowobj.category_list = category_list[i];
					
					selrow.add(rowobj);
				}
			}
			
		}catch(Exception e)
		{
			
		}
		
		
		return selrow;
	}
	
	
	
	
	
	
	
}