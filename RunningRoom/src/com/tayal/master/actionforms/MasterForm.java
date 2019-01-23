package com.tayal.master.actionforms;



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
public class MasterForm extends ActionForm{
	
	/**
	 * @return Returns the railwayList.
	 */

	
	
	private String message;
	private String location;
	
	private String division_code;
	private String division_name;
	
	private String lobby_name;
	private String lobby_code;
	
	
	private String location_id;
	private String location_name;
	private String location_address;
	private String location_city;
	private String location_state;
	private String location_pin;
	private String mobile;
	
	
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLobby_name() {
		return lobby_name;
	}

	public void setLobby_name(String lobby_name) {
		this.lobby_name = lobby_name;
	}

	public String getLobby_code() {
		return lobby_code;
	}

	public void setLobby_code(String lobby_code) {
		this.lobby_code = lobby_code;
	}

	public String getDivision_code() {
		return division_code;
	}

	public void setDivision_code(String division_code) {
		this.division_code = division_code;
	}

	public String getDivision_name() {
		return division_name;
	}

	public void setDivision_name(String division_name) {
		this.division_name = division_name;
	}

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

	public String getLocation_address() {
		return location_address;
	}

	public void setLocation_address(String location_address) {
		this.location_address = location_address;
	}

	public String getLocation_city() {
		return location_city;
	}

	public void setLocation_city(String location_city) {
		this.location_city = location_city;
	}

	public String getLocation_state() {
		return location_state;
	}

	public void setLocation_state(String location_state) {
		this.location_state = location_state;
	}

	public String getLocation_pin() {
		return location_pin;
	}

	public void setLocation_pin(String location_pin) {
		this.location_pin = location_pin;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	
	
	
}