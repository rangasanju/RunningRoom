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

<html:form action="Master" >
 <html:hidden name="MasterForm" property="message" /> 
 
 
 
 
 
   
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg" > 
             <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="/runningroom.do?method=initiateCrewOptions" >Home</html:link></li>
                  <li><html:link action="/Login.do?method=initiateKiosk" >Logout</html:link></li>
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
			           	<div class="col-sm-4"></div>		
			           	<div class="col-sm-4">
			           			
			           			
			           			<table class='table table-condensed table-responsive table-borderless'>
			           		 		
				          	 		<tbody>
				          	 			<tr >
				          	 			
				          	 				<td >
				          	 					 Crew Id
				          	 				</td>
				          	 				<td >
				          	 					 <bean:write name="CrewBiodataForm" property="crew_id" />
				          	 				</td>
				          	 				
				          	 			</tr>
				          	 			
				          	 		</tbody>
				          	 	</table>
			           			
			           			
			           	</div>
			           	<div class="col-sm-4"></div>
			           
			           		 	
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
																	<html:text name="CrewBiodataForm" property="firstname"   readonly="true"/> 
																</td>				
																</tr>					
															
														<tr >					
																<td  colspan="2" align="right">
																	Last Name
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="lastname"   readonly="true"/> 
																</td>				
														</tr>					
								
														<tr >					
																<td  colspan="2" align="right">
																	Designation
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="desig"  readonly="true" /> 
																</td>				
														</tr>					
								
														<tr >					
																<td  colspan="2" align="right">
																	Father's Name
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="fathername"   readonly="true"/> 
																</td>				
														</tr>			
														<tr >					
																<td  colspan="2" align="right">
																	Gender
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="gender"   readonly="true"/> 					
																</td>				
														</tr>			
														<tr >					
																<td  colspan="2" align="right">
																	DOB (dd/mm/yyyy)
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="day"   style="width:20px;" readonly="true"/> -		
																	<html:text name="CrewBiodataForm" property="month" style="width:20px;" readonly="true"/> -	
																	<html:text name="CrewBiodataForm" property="year"  style="width:40px;" readonly="true"/> 		
																	
																</td>				
														</tr>			<tr >					
																<td  colspan="2" align="right">
																	Blood Group
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="bloodgroup"  readonly="true" /> 
																</td>				
														</tr>			<tr >					
																<td  colspan="2" align="right">
																	Mobile No
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="mobile1"   readonly="true"/> 
																</td>				
														</tr>			
																
														<tr >					
																<td  colspan="2" align="right">
																	Alternate No
																</td>				
																<td  colspan="2">
																	<html:text name="CrewBiodataForm" property="mobile2"   readonly="true"/> 
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
																<html:textarea cols="23" rows="5" name="CrewBiodataForm" property="address"   readonly="true"/> 
															</td>				
													</tr>					
														
													<tr >					
															<td  colspan="2" align="right">
																City
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="city"   readonly="true"/> 
															</td>				
													</tr>					
							
													<tr >					
															<td  colspan="2" align="right">
																State
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="state"   readonly="true"/> 
															</td>				
													</tr>					
							
													<tr >					
															<td  colspan="2" align="right">
																Pincode
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="pincode"   readonly="true"/> 
															</td>				
													</tr>			
													<tr >					
															<td  colspan="2" align="right">
																Emergency Contact
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="emergency_contact"   readonly="true"/> 
															</td>				
													</tr>		
													<tr >					
															<td  colspan="2" align="right">
																Emergency Mobile
															</td>				
															<td  colspan="2">
																<html:text name="CrewBiodataForm" property="emergency_mobile"  readonly="true" /> 
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





</script>
 </html:form>
</body>
</html>

