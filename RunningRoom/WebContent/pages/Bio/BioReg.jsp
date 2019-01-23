
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
<title>CMS</title>
<style>/* Stylesheet 1: */



textarea {
font-family: Georgia, Serif; 
color: black;
font-size: 25px;
align: center;
border: 0;
}


.button {
   border-top: 1px solid #96d1f8;
   background: #81c1eb;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#81c1eb));
   background: -webkit-linear-gradient(top, #3e779d, #81c1eb);
   background: -moz-linear-gradient(top, #3e779d, #81c1eb);
   background: -ms-linear-gradient(top, #3e779d, #81c1eb);
   background: -o-linear-gradient(top, #3e779d, #81c1eb);

   -webkit-border-radius: 29px;
   -moz-border-radius: 29px;
   border-radius: 29px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 20px;
   font-family: Georgia, Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 200px;
   height: 40px;
   position:absolute; TOP:510px; LEFT:120px; 
   }
.button:hover {
   border-top-color: #28597a;
   background: #28597a;
   color: #ccc;
   }
.button:active {
   border-top-color: #2a4c63;
   background: #2a4c63;
   }
   
   
   
   
   

.buttonC {
   border-top: 1px solid #96d1f8;
   background: #81c1eb;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#81c1eb));
   background: -webkit-linear-gradient(top, #3e779d, #81c1eb);
   background: -moz-linear-gradient(top, #3e779d, #81c1eb);
   background: -ms-linear-gradient(top, #3e779d, #81c1eb);
   background: -o-linear-gradient(top, #3e779d, #81c1eb);

   -webkit-border-radius: 29px;
   -moz-border-radius: 29px;
   border-radius: 29px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 20px;
   font-family: Georgia, Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 200px;
   height: 40px;
   position:absolute; TOP:510px; LEFT:380px; 
   }
.buttonC:hover {
   border-top-color: #28597a;
   background: #28597a;
   color: #ccc;
   }
.buttonC:active {
   border-top-color: #2a4c63;
   background: #2a4c63;
   }
   
   
   
   

.circleBase {
    border-radius: 50%;
    width: 35px;
    height: 35px;
    background: white;
    border: 1px solid blue;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */
    
}

.type1 {
    
    position:absolute; TOP:265px; LEFT:103px; 
}

.type2 {
   
    position:absolute; TOP:230px; LEFT:150px; 
}


.type3 {
   
    position:absolute; TOP:215px; LEFT:210px; 
}

.type4 {
   
    position:absolute; TOP:235px; LEFT:270px; 
}

.type5 {
   
    position:absolute; TOP:325px; LEFT:310px; 
}

.type6 {
   
    position:absolute; TOP:325px; LEFT:355px; 
}

.type7{
   
    position:absolute; TOP:233px; LEFT:392px; 
}

.type8 {
   
    position:absolute; TOP:215px; LEFT:460px; 
}

.type9 {
   
    position:absolute; TOP:230px; LEFT:520px; 
}

.type10 {
    
    position:absolute; TOP:265px; LEFT:565px; 
}

.imgclass {
    
    position:absolute; TOP:218px; LEFT:100px; 
    opacity: 0.4;
}

</style>
</head>
<body onload="onLoad()">

<html:form action="biometric" >
<html:hidden property="crewid" />  
<html:hidden property="finger" /> 
<html:hidden property="reregistration" /> 


  
<table   style="height:100%; width:100%; " border="0" align="center" cellpadding="1">
	<tr style="background-color: #ff9933;">					
		<td style="height:10%; width:100%;"align="center" colspan="2">
		<table   style="height:100%; width:100%; " border="0" align="center" cellpadding="1">
				<tr style="background-color: #ff9933;">					
					<td style="height:10%; width:20%;"align="center" >
								Crew ID :    <bean:write name="BaBioForm" property="crewid" /> 	
					</td>	
					
					<td style="height:10%; width:60%;"align="center" >
								<div id="blink1" > <h1><i18n:message key="label.PAGETITLE.bio.registration"/></h1></div> 			
					</td>
					<td style="height:10%; width:20%;"align="center" >
								
					</td>	
				</tr>	
			</table>
					
		</td>					
	</tr>	
	
	<tr >					
		<td style="height:10%; width:100%;" align="left" colspan="2">
			
			<textarea  id="output"  cols="100" rows="1" style="border:0;  text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select a finger to register and click on register.	</textarea>   
	    </td>									
	</tr>
				
				
	<tr style="height:50%, width:100%;">
					<td align="center" valign="middle" colspan="2">
					
					
					<img align="middle" class="imgclass" src = "images/hands.png" />
					
					<div id="L1" class="circleBase type1" onclick="selectFinger('L1')"></div>
					<div id="L2" class="circleBase type2" onclick="selectFinger('L2')"></div>
					<div id="L3" class="circleBase type3" onclick="selectFinger('L3')"></div>
					<div id="L4" class="circleBase type4" onclick="selectFinger('L4')"></div>
					<div id="L5" class="circleBase type5" onclick="selectFinger('L5')"></div>
					<div id="R5" class="circleBase type6" onclick="selectFinger('R5')"></div>
					<div id="R4" class="circleBase type7" onclick="selectFinger('R4')"></div>
					<div id="R3" class="circleBase type8" onclick="selectFinger('R3')"></div>
					<div id="R2" class="circleBase type9" onclick="selectFinger('R2')"></div>
					<div id="R1" class="circleBase type10" onclick="selectFinger('R1')"></div>
						
					</td>
	</tr>
				
	<tr style="height:20%, width:80%;">
					<td align="left" valign="top" >
						<html:button property="method" value="Register" styleClass="button" onclick="BioReg()" />	    			
					</td>
					<td align="left" valign="top" >
						<html:button property="back" value="Back" styleClass="buttonC" onclick="ReturnToCMS()" />	    			
					</td>	
				
					
	</tr>
				 
			
	 	
	
		
</table>    
	 
  
  
  	
   
   			

    
   
 

  

<script>



var reqFeature;
var xmlhtp ;
var fingers = [ 'L1', 'L2', 'L3','L4','L5','R1', 'R2', 'R3','R4','R5' ];
var no_of_fingers = 0;
var firstfinger;


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}

var div;
function onLoad()
{
	
	
	div = document.getElementById("R5");
	document.forms[0].finger.value="R5";
	blinkFont();
	//div.style.backgroundColor = 'red';
	
}



function selectFinger(fing)
{
	
	var div1;
	clearInterval(timer); 
	
	document.forms[0].finger.value=fing;
	
	if(fing == firstfinger)
		{
		alert("This finger is already scanned. Please select another finger");
		}
	else
		{
		
			for(var i=0;i<10;i++)		
			{
			if(fingers[i] == fing)
				{			
				div = document.getElementById( fingers[i] );
				div.style.backgroundColor = 'red';
				
				
				}			
			else
				{
				div1 = document.getElementById(fingers[i] );			
				div1.style.backgroundColor = 'white';			
				}
				
			}
			
			if(firstfinger !=null)
			{
			div = document.getElementById( firstfinger );
			div.style.backgroundColor = 'green';
			
			}
		
		div = document.getElementById(fing);
		document.forms[0].finger.value=fing;
		
		}
	

	
	blinkFont();
}



var timer;

function blinkFont()
{
  clearInterval(timer); 
  div.style.background="red";  
  timer=setTimeout("setblinkFont()",300)
}
function setblinkFont()
{
	 clearInterval(timer); 
  div.style.background="";  
  timer=setTimeout("blinkFont()",300)
}





var reqFeature;
var xmlhtp ;



function BioReg()
{
	
	document.forms[0].method.disabled="true";
	
	if(document.forms[0].method.value == "Return")
		{
		 // IF REGISTERED - GO TO VERIFICATION PAGE
		 document.forms[0].action ="welcome.do?method=initiateBio";
		 document.forms[0].submit();
		}
	else
		{
		// ELSE GO TO REGISTRATION PAGE
		
		var url="biometric.do?method=BioReg&finger="+ document.forms[0].finger.value + "&reregistration=" +  document.forms[0].reregistration.value;
		if (window.XMLHttpRequest)
		{ // Non-IE browsers
				reqFeature = new XMLHttpRequest();
			try{
				reqFeature.open("GET", url, true);
				}catch (e){
				alert(e);
				}
				reqFeature.onreadystatechange = receiveOutput;
				reqFeature.send(null);
		}
		else if (window.ActiveXObject)
		{ // IE
			reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
				if (reqFeature){
				//alert('IE');
				reqFeature.open("GET", url, true);
				reqFeature.onreadystatechange = receiveOutput;
				reqFeature.send(null);
				}
		}	

		
		
		}
	
		
	
}


function receiveOutput(){

			var status;
			try{
				status=reqFeature.status;
				if (reqFeature.readyState == 3){ // Complete					
						if (reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;						
							document.getElementById("output").innerHTML=xmlhtp;
							document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
							
							if(xmlhtp.indexOf("ERROR") > -1)
							{							
								res="Device Error. Registration Failed";
								window.opener.postMessage({ message: res, result: true }, "*");
							}else if(xmlhtp.indexOf("TIMEOUT") > -1)
							{				
								if(no_of_fingers > 0)
									{
									deleteFPData();
									}
									
								res="Operation Timed Out. Please Try again.";
								window.opener.postMessage({ message: res, result: true }, "*");
							}else if(xmlhtp.indexOf("Registration Complete") > -1)
							{
								
								no_of_fingers = no_of_fingers + 1;
								
								if(no_of_fingers == 1)
								{
									document.forms[0].method.disabled=false;
									alert("Your First finger has been registered successfully. Click ok to register Second Finger");
									
									document.getElementById("output").innerHTML="Select a second finger to register and click on register";
									
									firstfinger = document.forms[0].finger.value;
									if(document.forms[0].finger.value == "L5")
									{
										selectFinger("R5");
									}
									else
									{
										selectFinger("L5");
									}
								}
								else if(no_of_fingers == 2)
								{
									
									alert("Your both the fingers have been registered successfully");
									document.forms[0].action ="biometric.do?method=initiateBio";
									document.forms[0].submit();	
								}
								
															
							}
							
							
						
								
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}









function deleteFPData()
{
	
	if(no_of_fingers > 0)
		{
		
		var url="welcome.do?method=deleteFPData";
		if (window.XMLHttpRequest)
		{ // Non-IE browsers
				reqFeature = new XMLHttpRequest();
			try{
				reqFeature.open("GET", url, true);
				}catch (e){
				alert(e);
				}
				reqFeature.onreadystatechange = receivedeleteFPDataOutput;
				reqFeature.send(null);
		}
		else if (window.ActiveXObject)
		{ // IE
			reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
				if (reqFeature){
				//alert('IE');
				reqFeature.open("GET", url, true);
				reqFeature.onreadystatechange = receivedeleteFPDataOutput;
				reqFeature.send(null);
				}
		}	

		}
	
		
	
}


function receivedeleteFPDataOutput(){

			var status;
			try{
				status=reqFeature.status;
				if (reqFeature.readyState == 3){ // Complete					
						if (reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;						
							document.getElementById("output").innerHTML=xmlhtp;
							document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
							if(xmlhtp.indexOf("success") > -1)
							{								
								alert("Registration Process terminated");
								
							}else 
							{							
								alert("Registration Process did not complete successfully. Please contact supervisor");
								
							}
							
						
								
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}



function ReturnToCMS(){
	

	if(no_of_fingers == 0)
		{
		window.opener.postMessage({ message: "cancel", result: true }, "*");		
		}

	

}






</script>
 </html:form>
</body>
</html>

