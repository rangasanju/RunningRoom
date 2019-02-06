<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<%@ taglib uri="/WEB-INF/taglibs-i18n.tld" prefix="i18n"%>

<i18n:bundle baseName="com.tayal.runningroom.properties.ApplicationResources" localeRef="userLocale"/>
   
<html >
<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/tayallogo.ico">
    
<title><i18n:message key="label.PAGETITLE.title"/></title>
<link rel="stylesheet" href="css/mybuttons.css" />

  <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
.table th {
    text-align: center;
}

.table {
    border-radius: 5px;
    width: 50%;
    float: none;
    margin: 0px auto;
}

</style>

</head>
<body  onload="onLoad()">

<html:form action="/CrewBiodata" >
 <html:hidden name="CrewBiodataForm" property="message" /> 
 
 
 
 
 
   
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="Master.do?method=home" >Home</html:link></li>
                  <li><html:link forward="LOGOUTADMIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          
          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.crewbiodata"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
     
		          <div class="row">
		          
		                     <div class="col-sm-12">
			           			<div class="col-sm-3"></div>		
			           			<div class="col-sm-6">
			           			
			           			
			           			<table class='table table-condensed table-responsive table-borderless'>
			           		 		
				          	 		<tbody>
				          	 			<tr >
				          	 			
				          	 				<td >
				          	 					 Crew Id
				          	 				</td>
				          	 				<td >
				          	 					<html:text name="CrewBiodataForm" property="crew_id"  styleClass="form-control" onkeyup="this.value = this.value.toUpperCase();"/> 												
				          	 				</td>
				          	 				<td >
				          	 					<img height="42" width="42" src="images/go.png" onclick="getCrewBiodata()"> 												
				          	 				</td>
				          	 				
				          	 			</tr>
				          	 			
				          	 		</tbody>
				          	 	</table>
			           			
			           			
			           			</div>
			           			<div class="col-sm-6"></div>
			           
			           		 	
			          </div>
			          
	          
	          
	           <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	   <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	           		<div class="col-sm-6">
		           
		           
		           		 	
													<table class='table table-borderless table-condensed table-responsive'>
													<tbody>
														<tr >					
																<td  colspan="2" align="right">
																	First Name
																</td>				
																<td  colspan="2" >
																	<html:text name="CrewBiodataForm" property="firstname"  styleClass="form-control" /> 
																</td>				
																</tr>					
															
														<tr >					
																<td  colspan="2" align="right">
																	Last Name
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="lastname"  styleClass="form-control" /> 
																</td>				
														</tr>					
								
														<tr >					
																<td  colspan="2" align="right">
																	Designation
																</td>				
																<td  colspan="2">
																	  <html:select name="CrewBiodataForm" property="desig" styleClass="form-control">
																	   <html:options name="desiglist" /> 
										  							</html:select>
																</td>				
														</tr>					
								
														<tr >					
																<td  colspan="2" align="right">
																	Father's Name
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="fathername"  styleClass="form-control" /> 
																</td>				
														</tr>			
														<tr >					
																<td  colspan="2" align="right">
																	Gender
																</td>				
																<td  colspan="2">
																	<html:select name="CrewBiodataForm" property="gender" styleClass="form-control">
																		<html:options name="genderlist" /> 
										  							</html:select>
																</td>				
														</tr>			
														<tr >					
																<td  colspan="2" align="right">
																	DOB (dd/mm/yyyy)
																</td>				
																<td  colspan="2">
																	<html:select name="CrewBiodataForm" property="day" styleClass="form-control" >
										   									<html:options name="daylist" /> 
										  							</html:select>
										  							<html:select name="CrewBiodataForm" property="month" styleClass="form-control">
										   									<html:options name="monthlist" /> 
										  							</html:select>
										  							<html:select name="CrewBiodataForm" property="year" styleClass="form-control">
										   									<html:options name="yearlist" /> 
										  							</html:select>
																	
																</td>				
														</tr>			<tr >					
																<td  colspan="2" align="right">
																	Blood Group
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="bloodgroup"  styleClass="form-control"/> 
																</td>				
														</tr>			<tr >					
																<td  colspan="2" align="right">
																	Mobile No
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="mobile1" styleClass="form-control" /> 
																</td>				
														</tr>			
																
														<tr >					
																<td  colspan="2" align="right">
																	Alternate No
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="mobile2"  styleClass="form-control"/> 
																</td>				
														</tr>		
														
																
														</tbody>									
													</table>
												
				      
				        
				        
				        
		          </div>
          
                <div class="col-sm-6">
	           
	           
	           		 
													<table class='table table-borderless table-condensed table-responsive'>
													<tbody >
													<tr >					
															<td  colspan="2" align="right">
																Address
															</td>				
															<td  colspan="2" >
																<html:textarea cols="23" rows="5" name="CrewBiodataForm" property="address"  styleClass="form-control"/> 
															</td>				
													</tr>					
														
													<tr >					
															<td  colspan="2" align="right">
																City
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="city"  styleClass="form-control"/> 
															</td>				
													</tr>					
							
													<tr >					
															<td  colspan="2" align="right">
																State
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="state"  styleClass="form-control"/> 
															</td>				
													</tr>					
							
													<tr >					
															<td  colspan="2" align="right">
																Pincode
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="pincode"  styleClass="form-control"/> 
															</td>				
													</tr>			
													<tr >					
															<td  colspan="2" align="right">
																Emergency Contact
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="emergency_contact" styleClass="form-control" /> 
															</td>				
													</tr>		
													<tr >					
															<td  colspan="2" align="right">
																Emergency Mobile
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="emergency_mobile" styleClass="form-control" /> 
															</td>				
													</tr>	
													<tr >					
																<td  colspan="2" align="right">
																	Biometric
																</td>				
																<td  colspan="2">
																	<html:select name="CrewBiodataForm" property="biostatus" styleClass="form-control">
										   									<html:options name="biostatuslist" /> 
										  							</html:select>
																	
																</td>				
													</tr>
														
														
													<tr >					
																<td  colspan="2" align="right">
																	Password Enable
																</td>				
																<td  colspan="2">
																	<html:select name="CrewBiodataForm" property="password_enable" styleClass="form-control">
										   									<html:options name="biostatuslist" /> 
										  							</html:select>
																	
																</td>				
														</tr>
													</tbody>										
												</table>
								
			        
			        
	          </div>
	          
	            
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	    
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  
	    	  <div class="col-sm-12">
	    	  
	    	   	  <div class="col-sm-2">	    	  
		    	  	&nbsp;
		    	  </div>
		    	  <div class="col-sm-3">	    	  
		    	  	<html:button property="method" value="Save" styleClass="smallbutton" onclick="saveBiodata()" />	
		    	  </div>	    	  
		    	  <div class="col-sm-3">	    	  
		    	  	<html:button property="method" value="Reset PIN" styleClass="smallbutton" onclick="resetPin()" />	
		    	  </div>
		    	  
		    	  <div class="col-sm-3">	    	  
		    	  	<html:button property="method" value="Back" styleClass="smallbutton" onclick="back()" />		
		    	  </div>
		    	   <div class="col-sm-1">	    	  
		    	  	&nbsp;
		    	  </div>
			  </div>
 			  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
			  <div class="col-sm-12">
   			  	<div id="rooms" ></div>
   			  </div>
          	
          </div>
          
         

        </div>

      </div>
 
 


<script>


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{		
			if(trim(document.forms[0].message.value) != "")
			{
				alert(document.forms[0].message.value);
				document.forms[0].message.value = "";
			}
}



function getCrewBiodata()
{		
	
	if(trim(document.forms[0].crew_id.value) == "")
	{
		alert("Please enter a crew id");
	}
	else
	{
		document.forms[0].action ="CrewBiodata.do?method=getCrewBiodata";
		 document.forms[0].submit();	
	}
			 
	
}



function saveBiodata()
{		
	var valid = true;
	
	if(trim(document.forms[0].firstname.value).length == 0)
	{
	   alert("Please enter a valid Crew ID");	
	}
	else
	{

		if(trim(document.forms[0].mobile1.value).length != 0)
		{
			if(!isValidMobile(document.forms[0].mobile1.value))
			{
				valid = false;
				alert("Please enter a valid Mobile number");
			}
				
		}
		
		if(trim(document.forms[0].mobile2.value).length != 0)
		{
			if(!isValidMobile(document.forms[0].mobile2.value))
			{
				valid = false;
				alert("Please enter a valid Alternate mobile number");
			}
				
		}
		if(trim(document.forms[0].emergency_mobile.value).length != 0)
		{
			
			if(!isValidMobile(document.forms[0].emergency_mobile.value))
			{
				valid = false;
				alert("Please enter a valid Emergency Contact Mobile number");
			}					
		}
		if(trim(document.forms[0].pincode.value).length != 0)
		{				
			if(isNaN(document.forms[0].pincode.value) || (trim(document.forms[0].pincode.value).length > 10))
			{
				valid = false;
				alert("Please enter a valid Pincode");
			}
		
		}	
		
		if(valid)
		{				
			 document.forms[0].action ="CrewBiodata.do?method=saveCrewBiodata";
			 document.forms[0].submit();	
		}


	}
			
	
	
}




function resetPin()
{		

	if(trim(document.forms[0].firstname.value).length == 0)
	{
	   alert("Please enter a valid Crew ID");	
	}
	else
	{
						
		document.forms[0].action ="CrewBiodata.do?method=resetPin";
		document.forms[0].submit();	
		
	}
}

function back()
{		
			 document.forms[0].action ="Master.do?method=home";
			 document.forms[0].submit();	
	
}



function isValidMobile(mobile)
{
	var str = /^\d{10}$/;
	
	if(mobile.match(str))
		return true;
	else
		return false;
	
}




</script>
 </html:form>
</body>
</html>

