/*
 * Created on Nov 3, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.tayal.login.actionforms;

import java.util.ArrayList;
import java.util.logging.Logger;

import org.apache.struts.action.ActionForm;

/**
 * @author cms213
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
/**
 * @author babio-dev
 *
 */
public class LoginForm extends ActionForm{
	
	/**
	 * @return Returns the railwayList.
	 */
	
	
	
	private String location;
	private String mac_address;
	private ArrayList<String> mac_address_list;
	private String user_id;
	private String user_name;
	private String crewid;
	private String crewname;
	private String password = null;
	private String crewdivision;
	private String crewzone;
	private String finger;
	private String first_finger;
	private String second_finger;
	private String reregistration = "false";
	private String timeout = "10";		
	private String camstatus = null;
	
	private String message;
	private String division_code;
	private String lobby_code;
	private String mobile;
	private String oldpassword = null;
	private String re_password = null;
	private String password_enable_status;

	public String getDivision_code() {
		return division_code;
	}

	public void setDivision_code(String division_code) {
		this.division_code = division_code;
	}

	
	
	
	public ArrayList<String> getMac_address_list() {
		return mac_address_list;
	}

	public void setMac_address_list(ArrayList<String> mac_address_list) {
		this.mac_address_list = mac_address_list;
	}

	public String getMac_address() {
		return mac_address;
	}

	public void setMac_address(String mac_address) {
		this.mac_address = mac_address;
	}

	public String getLobby_code() {
		return lobby_code;
	}

	public void setLobby_code(String lobby_code) {
		this.lobby_code = lobby_code;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCamstatus() {
		return camstatus;
	}

	public void setCamstatus(String camstatus) {
		this.camstatus = camstatus;
	}

	public String getCrewname() {
		return crewname;
	}

	public void setCrewname(String crewname) {
		this.crewname = crewname;
	}

	public String getCrewdivision() {
		return crewdivision;
	}

	public void setCrewdivision(String crewdivision) {
		this.crewdivision = crewdivision;
	}

	public String getCrewzone() {
		return crewzone;
	}

	public void setCrewzone(String crewzone) {
		this.crewzone = crewzone;
	}
	
	public String getTimeout() {
		return timeout;
	}

	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}	

	public String getCrewid() {
		return crewid;
	}

	public void setCrewid(String crewid) {
		this.crewid = crewid;
	}

	public String getFinger() {
		return finger;
	}

	public void setFinger(String finger) {
		this.finger = finger;
	}

	public String getFirst_finger() {
		return first_finger;
	}

	public void setFirst_finger(String first_finger) {
		this.first_finger = first_finger;
	}

	public String getSecond_finger() {
		return second_finger;
	}

	public void setSecond_finger(String second_finger) {
		this.second_finger = second_finger;
	}

	public String getReregistration() {
		return reregistration;
	}

	public void setReregistration(String reregistration) {
		this.reregistration = reregistration;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getRe_password() {
		return re_password;
	}

	public void setRe_password(String re_password) {
		this.re_password = re_password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword_enable_status() {
		return password_enable_status;
	}

	public void setPassword_enable_status(String password_enable_status) {
		this.password_enable_status = password_enable_status;
	}

	

	
	
	
}