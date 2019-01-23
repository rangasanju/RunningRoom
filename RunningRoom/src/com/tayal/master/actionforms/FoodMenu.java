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
public class FoodMenu extends ActionForm{
	
	/**
	 * @return Returns the railwayList.
	 */

	
	private String message;
	private String item_name;
	private String weekday;
	private String meal_type;		// Breakfast / Lunch / Dinner
	private String food_type;		// Veg / Non-Veg
	
	
	

	
	
	
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getFood_type() {
		return food_type;
	}
	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	
	
	
	
	
	
	
	
	
}