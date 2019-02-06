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


</head>
<body   onload="onLoad()">

<html:form action="Master" >
 <html:hidden name="RunningRoomForm" property="message" /> 
 <html:hidden name="RunningRoomForm" property="crew_id" /> 
 
 <html:hidden name="RunningRoomForm" property="bookedroom" /> 
 <html:hidden name="RunningRoomForm" property="bookedbed" />  

  
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg" > 
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


          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.runningroom.crewoptions"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
           
          <div class="col-sm-12">
              <div class="col-sm-4">		        
              
              		<logic:equal name="RunningRoomForm" property="booked" value="Y">
							<html:button property="method" value="CheckOut" styleClass="buttonActivity" onclick="checkOut()" />						
					</logic:equal>
					<logic:notEqual name="RunningRoomForm" property="booked" value="Y">
							<html:button property="method" value="CheckIn" styleClass="buttonActivity" onclick="checkIn()" />	
					</logic:notEqual>
			        
	          </div>   
	          <div class="col-sm-4">		        
			        <html:button property="method" value="Personal Info" styleClass="buttonActivity" onclick="personalInfo()" />	
	          </div>       	
              <div class="col-sm-4">		        
			        <html:button property="method" value="Wake Me" styleClass="buttonActivity" onclick="wakeme()" />
	          </div>   
	      </div>
	      
	      <div class="col-sm-12">
              &nbsp;
	      </div>
	      
	      
	       <div class="col-sm-12">
	          <div class="col-sm-4">		        
			        <html:button property="method" value="Meals" styleClass="buttonActivity" onclick="mess()" />
	          </div>       	
              <div class="col-sm-4">		        
			        <div id="bio" ><html:button property="method" value="Change Pin" styleClass="buttonActivity" onclick="changePin()" /></div>
	          </div>   
	          <div class="col-sm-4">		        
			        <div id="bio" ><html:button property="method" value="Outward Train" styleClass="buttonActivity" onclick="enterOutwardTrain()" /></div>
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

function runningRoom()
{		
			 document.forms[0].action ="runningroom.do?method=initiateCategoryOptions";
			 document.forms[0].submit();
}



function personalInfo()
{		
	var crewid= document.forms[0].crew_id.value;
			 document.forms[0].action ="CrewBiodata.do?method=getCrewBiodata&crew_id=" + crewid;
			 document.forms[0].submit();		
}


function wakeme()
{	var crewid= document.forms[0].crew_id.value;
			 document.forms[0].action ="runningroom.do?method=initiateWakeMe&crew_id=" + crewid;
			 document.forms[0].submit();		
}


function mess()
{		
			 document.forms[0].action ="runningroom.do?method=initiateMess";
			 document.forms[0].submit();		
}


function changePin()
{		
			 document.forms[0].action ="Login.do?method=initiateChangePass";
			 document.forms[0].submit();		
}


function enterOutwardTrain()
{		
			 document.forms[0].action ="runningroom.do?method=initiateOutwardTrainEntry";
			 document.forms[0].submit();		
}





function checkIn(bookedbed,bookedroom)
{
	
	
		var crewid= document.forms[0].crew_id.value;
		var url="runningroom.do?method=getAvailableBed&crew_id=" + crewid;
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveAvailableBed;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveAvailableBed;
							reqFeature.send(null);
						}
					}	
	
	
}

function receiveAvailableBed(){

			var status;
			try{
				status=reqFeature.status;
								
					if (reqFeature.readyState == 4 && reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;					
						
							if(xmlhtp.indexOf("@"))
							{
								document.forms[0].bookedroom.value = xmlhtp.substring(0,xmlhtp.indexOf("@"));
								document.forms[0].bookedbed.value = xmlhtp.substring(xmlhtp.indexOf("@")+1);
								
								var r = confirm("Room No : " + document.forms[0].bookedroom.value + " Bed No : " + document.forms[0].bookedbed.value + " .\n Confirm Booking ");
								if (r == true) {
								  alert("You pressed OK!");
								  document.forms[0].action ="runningroom.do?method=bookBed&room_selected=" + document.forms[0].bookedroom.value + "&bed_selected=" + document.forms[0].bookedbed.value;
								  document.forms[0].submit();
								} else {
									alert("cancel");
								} 
								
							}
							else
								alert("Bed not available. Please contact supervisor");
							
							
						
						}
					
				}
				catch(e)
				{
					status="Not found";
				}
		}




function checkOut()
{
	
	var r = confirm("You are Checing Out. Do you want to proceed ?");
	
	if (r == true) {
		
			 document.forms[0].action ="runningroom.do?method=checkOut";
			 document.forms[0].submit();
	}
	
		
}




</script>




</html:form>
</body>
</html>

