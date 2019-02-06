package com.tayal.runningroom.actionforms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;


public class MessReportForm extends ActionForm{ 
	
	
	String from_date;
	String to_date;
	
	
	String[] crew_id;
	String[] meal_type;
	String[] food_type;
	
	
	
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
	public String[] getCrew_id() {
		return crew_id;
	}
	public void setCrew_id(String[] crew_id) {
		this.crew_id = crew_id;
	}
	
	
	


	public String[] getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String[] meal_type) {
		this.meal_type = meal_type;
	}
	public String[] getFood_type() {
		return food_type;
	}
	public void setFood_type(String[] food_type) {
		this.food_type = food_type;
	}



	public class Myrow
	{

		
		String crew_id;
		String meal_type;
		String food_type;
		
		
		
		public String getCrew_id() {
			return crew_id;
		}
		public void setCrew_id(String crew_id) {
			this.crew_id = crew_id;
		}
		public String getMeal_type() {
			return meal_type;
		}
		public void setMeal_type(String meal_type) {
			this.meal_type = meal_type;
		}
		public String getFood_type() {
			return food_type;
		}
		public void setFood_type(String food_type) {
			this.food_type = food_type;
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
				MessReportForm.Myrow rowobj=this.new Myrow();
					try{
				
						
						rowobj.crew_id = crew_id[i];
						rowobj.meal_type = meal_type[i];
						rowobj.food_type = food_type[i];
										
						
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

