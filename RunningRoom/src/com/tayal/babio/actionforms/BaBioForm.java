package com.tayal.babio.actionforms;



import java.util.logging.Logger;

import org.apache.struts.action.ActionForm;

/**
 * @author cms213
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class BaBioForm extends ActionForm{
	
	/**
	 * @return Returns the railwayList.
	 */
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	
	

	
	private String method = null;
	private String back = null;
	private String ok = null;
	private String output = null;
	private String crewid = null;
	private String crewname = null;
	private String crewdivision = null;
	private String crewzone = null;
	private String finger = null;
	private String first_finger = null;
	private String second_finger = null;
	private String reregistration = "false";
	private String timeout = "10";	
	private String camstatus = null;
	
	
	
	

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

	

	public String getOk() {
		return ok;
	}

	public void setOk(String ok) {
		this.ok = ok;
	}

	

	public String getTimeout() {
		return timeout;
	}

	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
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

	public String getBack() {
		return back;
	}

	public void setBack(String back) {
		this.back = back;
	}

	
	
	
}