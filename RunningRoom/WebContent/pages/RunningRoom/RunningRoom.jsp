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

.table-wrapper-scroll-y {
  display: block;
  max-height: 450px;
  overflow-y: auto;
  -ms-overflow-style: -ms-autohiding-scrollbar;
}



.table-borderless > tbody > tr > td,
.table-borderless > tbody > tr > th,
.table-borderless > tfoot > tr > td,
.table-borderless > tfoot > tr > th,
.table-borderless > thead > tr > td,
.table-borderless > thead > tr > th {
    border: none;
}

</style>

</head>
<body   onload="onLoad()">	

<html:form action="Master" >
 
 <html:hidden name="RunningRoomForm" property="message" />  
 <html:hidden name="RunningRoomForm" property="crew_id" />  
 <html:hidden name="RunningRoomForm" property="location_id" />  
 <html:hidden name="RunningRoomForm" property="booked" />
 <html:hidden name="RunningRoomForm" property="bookedroom" /> 
 <html:hidden name="RunningRoomForm" property="bookedbed" />  
  
    <div class="site-wrapper">
      <div class="site-wrapper-inner">
          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                   <li class="active"><html:link action="/runningroom.do?method=initiateCrewOptions" >Home</html:link></li>
                  <li><html:link forward="LOGOUTKIOSK" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover hidden-xs">
            <h2 class="cover-heading"><i18n:message key="label.PAGETITLE.roomlayout"/></h2>
          </div>
          
          <div class="inner cover hidden-xs">
            &nbsp;
          </div>
          
          
          <div class="row">
              <div class="col-sm-1">
			         &nbsp;
	          </div>
              <div class="col-sm-8">
			         <div class="table-wrapper-scroll-y " id="layout" ></div>	
	          </div>
	    
          	 <div class="col-sm-3" >
          	 	<table class='table table-borderless table-condensed'>
          	 		<tbody>
          	 			<tr class="visible-lg">
          	 				<td colspan="2">
          	 					&nbsp;
          	 				</td>          	 				
          	 			</tr>
          	 			<tr class="visible-lg">
          	 				<td colspan="2">
          	 					&nbsp;
          	 				</td>          	 				
          	 			</tr>
          	 			<tr class="hidden-xs">          	 				
          	 				<td>
          	 					<img height="120"  width="120" class="img-responsive"  src="images/up.png" onclick="up()" >
          	 				</td>
          	 				<td>
          	 					<img height="120"  width="120" class="img-responsive" src="images/down.png" onclick="down()" >
          	 				</td>
          	 			</tr>
          	 			<tr class="visible-lg">
          	 				<td colspan="2">
          	 					&nbsp;
          	 				</td>
          	 			</tr>
          	 			<tr>
          	 				<td colspan="2">
          	 						<logic:equal name="RunningRoomForm" property="booked" value="Y">
										<html:button  property="method" value="CheckOut" styleClass="mediumbutton" onclick="checkOut()" />							
									</logic:equal>
									<logic:notEqual name="RunningRoomForm" property="booked" value="Y">
										<html:button  property="method" value="Book" styleClass="mediumbutton" onclick="bookBed()" />	
									</logic:notEqual>
          	 				</td>
          	 			</tr>
          	 		</tbody>
          	 	</table>
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
    
  
  

  

<script>

var room_selected="0";
var bed_selected="0";

var previous_selected_id="00";



function onLoad()
{
	
	getLayout(document.forms[0].bookedbed.value,document.forms[0].bookedroom.value);
	
	if(trim(document.forms[0].message.value) != "")
	{
		alert(document.forms[0].message.value);
		document.forms[0].message.value = "";
	}
	
	
}



function selectBed(room,bed)
{

	
	if(document.forms[0].booked.value == 'Y')
		alert("You are alraedy checked in !");
	else
	{
		var id = room + "" + bed;
		
		if(room.substring(0,1) == "0")
			alert("Bed Ocupied");
		else if(room == "-1")
		{
			alert("Bed blocked for maintainance");
		}else
		{
			room_selected = room;
			bed_selected = bed;
			
			var myTab = document.getElementById(id);
			var rows = myTab.getElementsByTagName('tr');
			
			if(previous_selected_id != "00")
			{
				var myPrevTab = document.getElementById(previous_selected_id);
				var prevRows = myPrevTab.getElementsByTagName('tr');
				prevRows[0].style.backgroundColor ="lightgreen";
			}
			
					
			
			rows[0].style.backgroundColor ="yellow";
			previous_selected_id = id;
		}
		
	}
	
	
}



function down()
{
	var el = document.getElementById("layout").offsetTop;
	 document.getElementById("layout").scrollTop = document.getElementById("layout").scrollTop + 20;
}
function up()
{
	var el = document.getElementById("layout").offsetTop;
	 document.getElementById("layout").scrollTop = document.getElementById("layout").scrollTop - 20;
}



function bookBed()
{
	//alert("cHECK 1");
	
	var booked = document.forms[0].booked.value;
	document.forms[0].bookedroom.value = room_selected;
	document.forms[0].bookedbed.value = bed_selected;
	if(booked=="N")
	{
		document.forms[0].booked.value="Y";
		if(room_selected=="0")
		{
			alert("Please select a room");
		}
		else
		{
			var r = confirm("You have selected Bed No " + bed_selected + " of Room No " + room_selected + ". Do you want to proceed with the booking ?");
			
			if(r == true)
			{
				 document.forms[0].action ="runningroom.do?method=bookBed&room_selected=" + room_selected + "&bed_selected=" + bed_selected;
				 document.forms[0].submit();
			}
		}
	}
	else
	{
		alert("You have already booked Bed No " + bed_selected + " of Room No " + room_selected );
	}
	
	
	
	
}





function getLayout(bookedbed,bookedroom)
{
	
	
	
		var url="runningroom.do?method=getRunningRoomLayout&bookedroom=" + bookedroom + "&bookedbed=" + bookedbed;
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveLayout;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveLayout;
							reqFeature.send(null);
						}
					}	
	
	
}





function receiveLayout(){

			var status;
			try{
				status=reqFeature.status;
								
					if (reqFeature.readyState == 4 && reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;						
							document.getElementById("layout").innerHTML=xmlhtp;
							//document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
						
						}
					
				}
				catch(e)
				{
					status="Not found";
				}
		}







function checkOut()
{
	var r = confirm("Do you wish to Check Out ?");
	
	if(r == true)
	{
		 alert("Have a safe journey");
		 document.forms[0].action ="runningroom.do?method=checkOut";
		 document.forms[0].submit();
	}
	
			
		
}


function home()
{
			 document.forms[0].action ="runningroom.do?method=initiateCrewOptions";
			 document.forms[0].submit();
		
}



function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}



function fillText(val)
{
	
	if(val == "reset")
	{
		document.forms[0].crewid.value ="";
		
	}
	else if(val == "back")
	{
		document.forms[0].crewid.value = document.forms[0].crewid.value.substring(0,document.forms[0].crewid.value.length-1);
	}
	else
	document.forms[0].crewid.value = document.forms[0].crewid.value + val;
	
	

	
}







</script>
</html:form>
</body>
</html>

