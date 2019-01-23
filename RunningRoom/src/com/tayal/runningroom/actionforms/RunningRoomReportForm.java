package com.tayal.runningroom.actionforms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;


public class RunningRoomReportForm extends ActionForm{ 
	
	
	String from_date;
	String to_date;
	String hourly_date;
	String crew_id_filter;
	String room_no_filter;
	String frequency;
	
	
	String[] date;
	String[] crew_id;
	String[] bed_no;
	String[] room_no;
	String[] checkin;
	String[] checkin_time;
	String[] checkout;
	String[] checkout_time;
	String[] rest_hrs;
	String[] wakeup_time;
	String[] crew_count;
	String[] hour;
	
	
	
	
	
	
	public String getFrom_date() {
		return from_date;
	}
	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}
	public String getTo_date() {
		return to_date;
	}
	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}
	
	public String getCrew_id_filter() {
		return crew_id_filter;
	}
	
	public String getRoom_no_filter() {
		return room_no_filter;
	}
	public void setRoom_no_filter(String room_no_filter) {
		this.room_no_filter = room_no_filter;
	}
	public void setCrew_id_filter(String crew_id_filter) {
		this.crew_id_filter = crew_id_filter;
	}
	public String[] getCrew_id() {
		return crew_id;
	}
	public void setCrew_id(String[] crew_id) {
		this.crew_id = crew_id;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getHourly_date() {
		return hourly_date;
	}
	public void setHourly_date(String hourly_date) {
		this.hourly_date = hourly_date;
	}

	public String[] getBed_no() {
		return bed_no;
	}
	public void setBed_no(String[] bed_no) {
		this.bed_no = bed_no;
	}
	public String[] getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String[] room_no) {
		this.room_no = room_no;
	}
	public String[] getCheckin() {
		return checkin;
	}
	public void setCheckin(String[] checkin) {
		this.checkin = checkin;
	}
	public String[] getCheckout() {
		return checkout;
	}
	public void setCheckout(String[] checkout) {
		this.checkout = checkout;
	}
	
	public String[] getWakeup_time() {
		return wakeup_time;
	}
	public void setWakeup_time(String[] wakeup_time) {
		this.wakeup_time = wakeup_time;
	}
	public String[] getCheckin_time() {
		return checkin_time;
	}
	public void setCheckin_time(String[] checkin_time) {
		this.checkin_time = checkin_time;
	}
	public String[] getCheckout_time() {
		return checkout_time;
	}
	public void setCheckout_time(String[] checkout_time) {
		this.checkout_time = checkout_time;
	}
	
	public String[] getRest_hrs() {
		return rest_hrs;
	}
	public void setRest_hrs(String[] rest_hrs) {
		this.rest_hrs = rest_hrs;
	}

	public String[] getDate() {
		return date;
	}
	public void setDate(String[] date) {
		this.date = date;
	}
	public String[] getCrew_count() {
		return crew_count;
	}
	public void setCrew_count(String[] crew_count) {
		this.crew_count = crew_count;
	}


	public String[] getHour() {
		return hour;
	}
	public void setHour(String[] hour) {
		this.hour = hour;
	}










	public class Myrow
	{

		
		String crew_id;
		String bed_no;
		String room_no;
		String checkin;
		String checkin_time;
		String checkout;
		String checkout_time;
		String rest_hrs;
		String wakeup_time;
		
		
		
		public String getCrew_id() {
			return crew_id;
		}
		public void setCrew_id(String crew_id) {
			this.crew_id = crew_id;
		}
		public String getBed_no() {
			return bed_no;
		}
		public void setBed_no(String bed_no) {
			this.bed_no = bed_no;
		}
		public String getRoom_no() {
			return room_no;
		}
		public void setRoom_no(String room_no) {
			this.room_no = room_no;
		}
		public String getCheckin() {
			return checkin;
		}
		public void setCheckin(String checkin) {
			this.checkin = checkin;
		}
		public String getCheckout() {
			return checkout;
		}
		public void setCheckout(String checkout) {
			this.checkout = checkout;
		}
		public String getCheckin_time() {
			return checkin_time;
		}
		public void setCheckin_time(String checkin_time) {
			this.checkin_time = checkin_time;
		}
		public String getCheckout_time() {
			return checkout_time;
		}
		public void setCheckout_time(String checkout_time) {
			this.checkout_time = checkout_time;
		}
		
		public String getRest_hrs() {
			return rest_hrs;
		}
		public void setRest_hrs(String rest_hrs) {
			this.rest_hrs = rest_hrs;
		}
		public String getWakeup_time() {
			return wakeup_time;
		}
		public void setWakeup_time(String wakeup_time) {
			this.wakeup_time = wakeup_time;
		}
		
		
		
		
		
		
	}
	
	
	

	public ArrayList getMyrows()
	{
		int len=crew_id.length;
		
		
		ArrayList selrow=new ArrayList();
		try
		{
		
			
			if(len!=0)
			{
				for(int i=0; i < len ;i++)
				{
				RunningRoomReportForm.Myrow rowobj=this.new Myrow();
					try{
				
						
						rowobj.crew_id = (crew_id[i] == null ) ? "-" : crew_id[i];
						rowobj.bed_no = (bed_no[i] == null ) ? "-" : bed_no[i];
						rowobj.room_no = (room_no[i] == null ) ? "-" : room_no[i];
						rowobj.checkin = (checkin[i] == null ) ? "-" : checkin[i];
						rowobj.checkin_time = (checkin_time[i] == null ) ? "-" : checkin_time[i];
						rowobj.checkout = (checkout[i] == null ) ? "-" : checkout[i];
						rowobj.checkout_time = (checkout_time[i] == null ) ? "-" : checkout_time[i];
						rowobj.rest_hrs = (rest_hrs[i] == null ) ? "-" : rest_hrs[i];
						rowobj.wakeup_time = (wakeup_time[i] == null ) ? "-" : wakeup_time[i];
						
										
						
					}catch(Exception e)
					{	
					e.printStackTrace();
					}
					
				selrow.add(rowobj);
				}
			}
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}
		return selrow;
	} // GETMYROWS ENDS 


	public class Mycount
	{

		
		String date;
		String hour;
		String crew_count;
		
		
		
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getHour() {
			return hour;
		}
		public void setHour(String hour) {
			this.hour = hour;
		}
		public String getCrew_count() {
			return crew_count;
		}
		public void setCrew_count(String crew_count) {
			this.crew_count = crew_count;
		}		
		
		
	}

	

	public ArrayList getMycounts()
	{
		int len=date.length;
		
		
		ArrayList selrow=new ArrayList();
		try
		{
		
			
			if(len!=0)
			{
				for(int i=0; i < len ;i++)
				{
				RunningRoomReportForm.Mycount rowobj=this.new Mycount();
					try{
				
						
						rowobj.date = (date[i] == null ) ? "-" : date[i];
						rowobj.hour = (hour[i] == null ) ? "-" : hour[i];
						rowobj.crew_count = (crew_count[i] == null ) ? "-" : crew_count[i];
						
										
						
					}catch(Exception e)
					{	
					e.printStackTrace();
					}
					
				selrow.add(rowobj);
				}
			}
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}
		return selrow;
	} // GETMYROWS ENDS 




	

}

