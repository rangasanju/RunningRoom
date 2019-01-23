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
<link href="misc/css/bootstrap-datetimepicker.css" rel="stylesheet">






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

<html:form action="runningroom" >

	
 <html:hidden name="RunningRoomForm" property="room_selected" />  
 <html:hidden name="RunningRoomForm" property="bed_selected" />  
 <html:hidden name="RunningRoomForm" property="checkin_date" />  
 <html:hidden name="RunningRoomForm" property="checkout_date" />  
 <html:hidden name="RunningRoomForm" property="booked" />  
 
   
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
             <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="Master.do?method=home" >Home</html:link></li>
                 <li><html:link forward="LOGOUTKIOSK" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
          	<logic:equal name="RunningRoomForm" property="booked" value="lightgreen">
          		<h1 class="cover-heading"><i18n:message key="label.PAGETITLE.checkin"/></h1>     
          	</logic:equal>
          	<logic:equal name="RunningRoomForm" property="booked" value="pink">
          		<h1 class="cover-heading"><i18n:message key="label.PAGETITLE.checkout"/></h1>     
          	</logic:equal>
                   
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
           
          <div class="row">
          
          
          
          	 <div class="col-sm-12">
			           	<div class="col-sm-1"></div>		
			           	<div class="col-sm-10">			           			
			           			<table class='table' >
			           		 		
				          	 		<tbody>
				          	 			<tr >
				          	 			
				          	 				<td align="left" bgcolor='lightgreen'>
				          	 					 Room No :
				          	 				</td>
				          	 				<td align="left">
				          	 					<bean:write name="RunningRoomForm" property="room_selected" />
				          	 				</td>
				          	 				
				          	 			</tr>
				          	 			<tr >
				          	 			
				          	 				<td align="left" bgcolor='lightgreen'>
				          	 					 Bed No :
				          	 				</td>
				          	 				<td align="left">
				          	 					<bean:write name="RunningRoomForm" property="bed_selected" />
				          	 				</td>
				          	 				
				          	 			</tr>
				          	 			<tr >
				          	 			
				          	 				<td align="left" bgcolor='lightgreen'>
				          	 					 Crew Id :
				          	 				</td>
				          	 				<td class="pull-left">
				          	 					 <html:text name="RunningRoomForm" property="crew_id" onkeyup="this.value = this.value.toUpperCase();"/>
				          	 				</td>
				          	 				
				          	 			</tr>
								          	 			
								  <logic:equal name="RunningRoomForm" property="booked" value="pink">
									    <tr >				          	 			
				          	 				<td align="left" bgcolor='lightgreen'>
				          	 					 Check In :
				          	 				</td>
				          	 				<td class="pull-left">
				          	 					<bean:write name="RunningRoomForm" property="checkin_date" />
				          	 				</td>
				          	 				
				          	 			</tr>
								  </logic:equal> 	 			
								          	 			
								          	 			
								          	 			
								          	 			
								          	 			
								          	 			
				          	 			<tr >
				          	 			
				          	 				<td align="left" bgcolor='lightgreen'>
				          	 					<logic:equal name="RunningRoomForm" property="booked" value="lightgreen">
									          		<h6 class="cover-heading"><i18n:message key="label.PAGETITLE.checkin"/></h6>     
									          	</logic:equal>
									          	<logic:equal name="RunningRoomForm" property="booked" value="pink">
									          		<h6 class="cover-heading"><i18n:message key="label.PAGETITLE.checkout"/></h6>     
									          	</logic:equal>
                   
				          	 				</td>
				          	 				<td align="left">
				          	 					<div class='input-group date' id='checkInOutDatePicker'>
								                    <input type='text' class="form-control" id="checkInOutDate"/>
								                    <span class="input-group-addon">
								                        <span class="glyphicon glyphicon-calendar"></span>
								                    </span>
								                </div>
				          	 				</td>
				          	 				
				          	 			</tr>
								          	 				
				          	 			
				          	 							          	 			
				          	 		</tbody>
				          	 	</table>
			           	</div>
			           	<div class="col-sm-1"></div>		           		 	
			   </div>
			   
			   
         
			   
			
	          
		           <div>	    	  
		    	  	&nbsp;
		    	   </div>
	    	  
		    	   <div>	    	  
		    	  	&nbsp;
		    	   </div>
		    	   
		    	   
		    	   
		    	   
		    	   
          
	    	  
	    
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	    
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  
	    	  <div class="col-sm-4">	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  <div class="col-sm-2" >	    	  
	    	  	<logic:equal name="RunningRoomForm" property="booked" value="lightgreen">
					<html:button property="method" value="Check In" styleClass="smallbutton" onclick="checkInOut()" />	
				</logic:equal>
				<logic:equal name="RunningRoomForm" property="booked" value="pink">
				    <html:button property="method" value="Check Out" styleClass="smallbutton" onclick="checkInOut()" />	
				</logic:equal>
					
                       	  	
	    	  </div >
	    	   <div class="col-sm-2">	    	  
	    	  	<html:button property="method" value="Back" styleClass="smallbutton" onclick="runningRoom()" />	
	    	  </div>

 			  <div class="col-sm-4">	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	   <div>	    	  
	    	  	&nbsp;
	    	   </div>
			
          	   <div>	    	  
	    	  	&nbsp;
	    	   </div>
          </div>
          
         

        </div>

      </div>
 
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="misc/js/moment-with-locales.js"></script>
    <script src="misc/js/bootstrap-datetimepicker.js"></script>
    
  
  
  

<script>

var isCrewBooked="N";

function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


$(function () {
	 $('#checkInOutDatePicker').datetimepicker({
         
         format: 'DD/MM/YYYY HH:mm'
     });
});




function onLoad()
{	
	var prev_color = document.forms[0].booked.value;
	if(prev_color == "pink")
	{
		document.forms[0].crew_id.disabled = true;
	}
	
}

function runningRoom()
{		
			 document.forms[0].action ="runningroom.do?method=initiateRunningRoom";
			 document.forms[0].submit();	
	
}



function crewBooked()
{
	
	
	
		var url="runningroom.do?method=isCrewBooked&crew_id=" + document.forms[0].crew_id.value;
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveCrewBooked;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveCrewBooked;
							reqFeature.send(null);
						}
					}	
	
	
}





function receiveCrewBooked(){

			var status;
			try{
				status=reqFeature.status;
									
						if (reqFeature.readyState == 4 && reqFeature.status == 200)
						{ // OK response
							xmlhtp =trim(reqFeature.responseText);	
						
							if(xmlhtp == "Y")
								alert("The crew is already CHECKED-IN");
							else
							{
								
								var checkInOutDate = document.getElementById("checkInOutDate").value;
								document.forms[0].checkout_date.value = checkInOutDate;
								
								document.forms[0].checkin_date.value = checkInOutDate;
								document.forms[0].action ="runningroom.do?method=checkInByAdmin";
								document.forms[0].submit();	
							}
							
						}
					
				}
				catch(e)
				{
					status="Not found";
				}
		}




function checkInOut()
{		
	
	
			var checkInOutDate = document.getElementById("checkInOutDate").value;
			var crewid = trim(document.forms[0].crew_id.value);
			
			if(trim(crewid) == "")
			{
				alert("Please select a crew");
			}else if((trim(checkInOutDate)).length < 10)
			{
				alert("Please enter a valid Date");
			}else
			{
				var prev_color = document.forms[0].booked.value
				
				
				if(prev_color == "lightgreen")
				{
					crewBooked();
				
				}
				else
				{
					
					document.forms[0].checkout_date.value = checkInOutDate;
					document.forms[0].action ="runningroom.do?method=checkOutByAdmin";
					document.forms[0].submit();	
				}
					
				
				
			}
			
			
			
}











</script>
 </html:form>
</body>
</html>

