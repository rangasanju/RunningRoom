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

svg > g > g:last-child { pointer-events: none }

</style>

</head>
<body   onload="onLoad()">

<html:form action="Master" >
 <html:hidden name="TayalLoginForm" property="message" />
 <html:hidden name="TayalLoginForm" property="location" />  

  
    <div class="site-wrapper">
      <div class="site-wrapper-inner">

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="Master.do?method=divisionhome" >Home</html:link></li>
                  <li><html:link forward="LOGOUTADMIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

       
           	  <div class="col-sm-9">	
			        
		    	
	              <div class="col-sm-6">	
				        <div id="Occupancy"></div>
		          </div>
		          <div class="col-sm-6">	
				        <div id="Mess"></div>
		          </div>
	          
	   	      </div>
	   	      
	   	      
	   	      
	   	      
          	 <div class="col-sm-3">
          	 
          	   <%-- 
			        	<div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	        		        
				        <div class="col-sm-12 ">
					       <html:button property="method" value="Add Division" styleClass="smallbutton" onclick="addDivision()" />		
				        </div>	
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	        
			         	<div class="col-sm-12 ">
					       <html:button property="method" value="Add Lobby" styleClass="smallbutton" onclick="addLobby()" />		
				        </div>			
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			     --%>   
			     
			     		<div class="col-sm-12 ">
					       <html:button property="method" value="Add Lobby" styleClass="smallbutton" onclick="addLobby()" />	
				        </div>				      
 				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			     		<div class="col-sm-12 ">
					       <html:button property="method" value="Add Rooms" styleClass="smallbutton" onclick="addRooms()" />	
				        </div>			
				        	      
 				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			          	<div class="col-sm-12 ">
					       <html:button property="method" value="Running Room" styleClass="smallbutton" onclick="runningRoom()" />		
				        </div>				 
				        
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			     
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Crew Biodata" styleClass="smallbutton" onclick="crewBiodata()" />		
				        </div>		
				        				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
					      
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Occupancy Report" styleClass="smallbutton" onclick="runningRoomReport()" />	
				        </div>		
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
					    
					            
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Occupancy Count" styleClass="smallbutton" onclick="occupancyCountReport()" />	
				        </div>		
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
					    
					    
					    <div class="col-sm-12 ">
					       <html:button property="method" value="Mess Report" styleClass="smallbutton" onclick="messReport()" />	
				        </div>		
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			        	
			        	
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Change Password" styleClass="smallbutton" onclick="changePass()" />		
				        </div>				    
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			  
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Food Menu" styleClass="smallbutton" onclick="foodMenu()" />		
				        </div>				      
            
            	        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			  
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Wake Up Calls" styleClass="smallbutton" onclick="wakeUpCalls()" />		
				        </div>				      
                      
            	        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			  
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="CreateCrew" styleClass="smallbutton" onclick="createCrew()" />		
				        </div>			
				        
				             
            	        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			  <%-- 
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Upload Image" styleClass="smallbutton" onclick="uploadImage()" />		
				        </div>				      
                       --%>
	       
	           
	          </div>
          	
         

        </div>

      </div>

    
    
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/jquery.min.js"></script>
    <script src="static/loader.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    
  
  




<script type="text/javascript">
//Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

//Draw the chart and set the chart values
function drawChart(type,pidata) {
	
	
var data = google.visualization.arrayToDataTable(pidata);

// Optional; add a title and set the width and height of the chart
var options = {
    title: type + " Status",
    backgroundColor: 'transparent',
    width: '550', 
    height: '400',
    colors: ['blue', 'green', 'red', 'pink', '#f6c7b6']
    
};

// Display the chart inside the <div> element with id="piechart"
var chart = new google.visualization.PieChart(document.getElementById(type));
chart.draw(data, options);
}




window.addEventListener("message", function(ev) {
	 var msg;
	 msg = ev.data.message;	
	 ev.source.close();
	 
	 
});


function uploadImage()
{
	mode="load";
	window.open("http://localhost:8080/RRService/uploadImage","_blank");
	//bypass();
}


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{		
	//drawChart("dashboard1");
	//drawChart("dashboard2");
	getDashboard();
	
	
			if(trim(document.forms[0].message.value) != "")
			{
				alert(document.forms[0].message.value);
				document.forms[0].message.value = "";
			}
			
}


function addDivision()
{		
			 document.forms[0].action ="Master.do?method=initiateAddDivision";
			 document.forms[0].submit();	
	
}



function addLobby()
{		
			 document.forms[0].action ="Master.do?method=initiateAddLobby";
			 document.forms[0].submit();	
	
}

function addLocation()
{		
			 document.forms[0].action ="Master.do?method=initiateAddLocation";
			 document.forms[0].submit();	
	
}



function addRooms()
{		
			 document.forms[0].action ="Rooms.do?method=initiateAddRooms";
			 document.forms[0].submit();	
	
}

function runningRoom()
{		
			 document.forms[0].action ="runningroom.do?method=initiateRunningRoom";
			 document.forms[0].submit();	
	
}


function crewBiodata()
{		
			 document.forms[0].action ="CrewBiodata.do?method=initiateCrewBiodata";
			 document.forms[0].submit();	
	
}


function runningRoomReport()
{		
			 document.forms[0].action ="runningroomreport.do?method=initiateRunningRoomReport";
			 document.forms[0].submit();	
	
}



function occupancyCountReport()
{		
			 document.forms[0].action ="runningroomreport.do?method=initiateOccupancyCountReport";
			 document.forms[0].submit();	
	
}



function messReport()
{		
			 document.forms[0].action ="messreport.do?method=messReport";
			 document.forms[0].submit();	
	
}




function changePass()
{		
			 document.forms[0].action ="Login.do?method=initiateChangePass";
			 document.forms[0].submit();	
	
}



function foodMenu()
{		
			 document.forms[0].action ="MiscMaster.do?method=initiateFoodMenuEntry";
			 document.forms[0].submit();	
	
}


function wakeUpCalls()
{		
			
			document.forms[0].action ="runningroomreport.do?method=getWakeUpCalls";
			document.forms[0].submit();	
			
}



function getOccupants()
{		
			
			document.forms[0].action ="runningroomreport.do?method=getCurrentOccupantReport";
			document.forms[0].submit();	
			
}











function getDashboard()
{
	
	
	
		var url="Master.do?method=getDashboard";
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveDashboard;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveDashboard;
							reqFeature.send(null);
						}
					}	
	
	
}





function receiveDashboard(){

			var status;
			try{
				status=reqFeature.status;
								
					if (reqFeature.readyState == 4 && reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;		
						
						var total = parseInt(xmlhtp.substring(xmlhtp.indexOf("Total")+5,xmlhtp.indexOf("Occupancy")));
						var occupancy = parseInt(xmlhtp.substring(xmlhtp.indexOf("Occupancy")+9,xmlhtp.indexOf("Availability")));
						var availability = parseInt(xmlhtp.substring(xmlhtp.indexOf("Availability")+12,xmlhtp.indexOf("Blocked")));
						var blocked = parseInt(xmlhtp.substring(xmlhtp.indexOf("Blocked")+7,xmlhtp.indexOf("TotalAvailed")));
						
						
						var occ_data = [["Occupancy","Occupancy"],
										 ["Occupancy",occupancy],
										 ["Availability",availability],
										 ["Blocked",blocked]
						                ];
						drawChart("Occupancy",occ_data);
						
						
						var totalavailed = parseInt(xmlhtp.substring(xmlhtp.indexOf("TotalAvailed")+12,xmlhtp.indexOf("Breakfast")));
						var breakfast = parseInt(xmlhtp.substring(xmlhtp.indexOf("Breakfast")+9,xmlhtp.indexOf("Lunch")));
						var lunch = parseInt(xmlhtp.substring(xmlhtp.indexOf("Lunch")+5,xmlhtp.indexOf("Dinner")));
						var dinner = parseInt(xmlhtp.substring(xmlhtp.indexOf("Dinner")+6));
						
						
						
						var mess_data = [["TotalAvailed","TotalAvailed"],
										 ["Breakfast",breakfast],
										 ["Lunch",lunch],
										 ["Dinner",dinner]
						                ];
						drawChart("Mess",mess_data);
						
						
						
						
							
							//alert(xmlhtp.substring(11,xmlhtp.indexOf("</occupancy>")));
							
						   // alert(xmlhtp.substring(12,xmlhtp.indexOf("</occupancy>")));
						   // alert(xmlhtp.substring(xmlhtp.indexOf("<mess>")+ 7, xmlhtp.indexOf("</occupancy>")));
						
						
							//document.getElementById("dashboard").innerHTML=xmlhtp;
							//document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
						
						}
					
				}
				catch(e)
				{
					status="Not found";
				}
		}



function createCrew()
{		
			 document.forms[0].action ="Login.do?method=initiateCreateCrew";
			 document.forms[0].submit();	
	
}











</script>
 </html:form>
</body>
</html>

