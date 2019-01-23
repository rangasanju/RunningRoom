
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-i18n.tld" prefix="i18n"%>
<i18n:bundle baseName="com.tayal.runningroom.properties.ApplicationResources" localeRef="userLocale"/>

   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%; width:100%;">
<head>
<title>Hello World</title>
<link rel="stylesheet" href="css/mybuttons.css" />
</head>
<body  style="height:100%; width:100%;">

<html:form action="welcome" >
 <html:hidden name="MasterForm" property="message" /> 
  <table   style="height:100%; width:100%;"  border="1" align="center" >
		<tr style="background-color: #ff9933;">					
		<td style="height:10%; width:100%;" align="center" colspan="2">
			<table   style="height:100%; width:100%; " border="0" align="center" >
				<tr style="background-color: #ff9933;">					
					
					<td style="height:10%; width:20%;" align="center" >
								
					</td>	
					<td style="height:10%; width:60%;" align="center" >
								<h2><i18n:message key="label.PAGETITLE.addlocation"/></h2> 			
					</td>
					<td style="height:10%; width:20%;" align="right" >
								<html:link action="Master.do?method=home" ><img src="images/home.png" height="80%" width="15%"></html:link>
								<html:link forward="LOGOUTADMIN" ><img src="images/logout.png" height="80%" width="15%"></html:link>
					</td>
					
				</tr>	
			</table>					
		</td>		
		</tr>
			
		
		<tr >		
		<td style="height:100%; width:70%;" align="center">
		
		
		
			<table>
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>					
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				
				
				<tr >					
					<td style=" width:48%;"align="right" >
						   Location Code :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="MasterForm" property="location_id"  /> 
					</td>	
					
				</tr>	
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td style=" width:48%;"align="right" >
						   Location Name :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="MasterForm" property="location_name"  /> 
					</td>	
					
				</tr>	
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td style=" width:48%;"align="right" >
						   Location Address :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="MasterForm" property="location_address"  /> 
					</td>	
					
				</tr>	
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td style=" width:48%;"align="right" >
						   Location City :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="MasterForm" property="location_city"  /> 
					</td>	
					
				</tr>	
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td style=" width:48%;"align="right" >
						   Location State :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="MasterForm" property="location_state"  /> 
					</td>	
					
				</tr>	
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td style=" width:48%;"align="right" >
						   Location Pincode :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="MasterForm" property="location_pin"  /> 
					</td>	
					
				</tr>	
				
				<tr >					
					<td valign="middle" align="center" colspan="2" >
							<html:button property="method" value="Save" styleClass="button" onclick="saveLocation()" />									
					</td>		
					
				</tr>			
				
				
				
			</table>
		
				
		
		
		
		
		
		
		
		
		
		
		
		</td>
		<td style="height:60%; width:30%;" align="center" valign="top" bgcolor="#ffd9b3">
		
			<table   style="width:100% " border="0" align="center" cellpadding="1" >
				<tr >					
					<td style=" width:48%;"align="right" colspan="2">
						    &nbsp;
					</td>						
				</tr>	
				<tr >					
					<td valign="middle" align="center" colspan="2" >
							<html:button property="method" value="Add Location" styleClass="button" onclick="addLocation()" />									
					</td>		
					
				</tr>						
				<tr >					
					<td valign="middle" align="center" colspan="2" >
							<html:button property="method" value="Add Rooms" styleClass="button" onclick="signin()" />									
					</td>					
				</tr>						
			</table>
					
		</td>	
		</tr>	
		
		<tr style="background-color: #ff9933;">					
		<td style="height:10%; width:100%;" align="center" colspan="2">
		
			<table   style="height:100%; width:100%; " border="0" align="center" >
				<tr style="background-color: #ff9933;">					
					
					<td style="height:10%; width:60%;" align="center" >
								&nbsp;		
					</td>
						
				</tr>	
			</table>
					
		</td>		
		</tr>

		
  </table>    
	 


  

<script>



function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}



function addLocation()
{		
	if(trim(document.forms[0].location_id.value) == "")
		alert("Please specify a location id");
	else if(trim(document.forms[0].location_name.value) == "")
		alert("Please specify a location name");
	else if(trim(document.forms[0].location_address.value) == "")
		alert("Please specify a location address");
	else if(trim(document.forms[0].location_city.value) == "")
		alert("Please specify a location city");
	else if(trim(document.forms[0].location_state.value) == "")
		alert("Please specify a location state");
	else if(trim(document.forms[0].location_pin.value) == "")
		alert("Please specify a location pincode");
	else{
		 document.forms[0].action ="Login.do?method=initiateAddLocation";
		 document.forms[0].submit();		
	}
				
	
}




function saveLocation()
{		
			 document.forms[0].action ="Master.do?method=addLocation";
			 document.forms[0].submit();	
	
}





</script>
 </html:form>
</body>
</html>

