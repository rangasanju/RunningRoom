
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-i18n.tld" prefix="i18n"%>
<i18n:bundle baseName="com.tayal.runningroom.properties.ApplicationResources" localeRef="userLocale"/>


   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CMS</title>

<link rel="stylesheet" href="css/biometric.css" />

</head>
<body  onload="onLoad()">

<html:form action="biometric">
<html:hidden name="BaBioForm" property="crewid" />  
<html:hidden name="BaBioForm" property="first_finger" /> 
<html:hidden name="BaBioForm" property="second_finger" />
<html:hidden name="BaBioForm" property="reregistration" />
  
<table   style="height:100%; width:100%; " border="0" align="center" cellpadding="1">
	<tr style="background-color: #ff9933;">					
		<td style="height:10%; width:100%;"align="center" >
		
		
			<table   style="height:100%; width:100%; " border="0" align="center" cellpadding="1">
				<tr style="background-color: #ff9933;">					
					<td style="height:10%; width:20%;"align="center" >
								Crew ID :    <bean:write name="BaBioForm" property="crewid" /> 	
					</td>	
					
					<td style="height:10%; width:60%;"align="center" >
								<div id="blink1" > <h1><i18n:message key="label.PAGETITLE.bio.verification"/></h1></div> 			
					</td>
					<td style="height:10%; width:20%;"align="center" >
								
					</td>	
				</tr>	
			</table>
					
		</td>					
	</tr>	
	
	<tr >					
		<td style="height:10%; width:100%;" align="left" >
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<font size=5px><i18n:message key="label.message.bio.placefinger" />   </font>
	    </td>									
	</tr>
				
				
	<tr style="height:60%, width:100%;">
					<td align="center" valign="middle" >
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
					
					<img align="middle" class="imgclass" src = "images/hands.png" />
						
					</td>
	</tr>
				
	
	
		
</table>    
	 
  
  
  	
   
   			

    
   
 

  

<script>
var reqFeature;
var xmlhtp ;



function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}




function onLoad()
{
	var div;
	var first_finger = document.forms[0].first_finger.value;
	div = document.getElementById(first_finger);	
	div.style.backgroundColor = 'red';
	
	var second_finger = document.forms[0].second_finger.value;
	
	div = document.getElementById(second_finger);	
	div.style.backgroundColor = 'red';
	
	blinkFont();
	var crewid = trim(document.forms[0].crewid.value);
	//document.forms[0].action ="runningroom.do?method=initiateCrewOptions&crew_id="+ crewid ;
	//document.forms[0].submit();	
	BioVer();
}

function blinkFont()
{
  document.getElementById("blink1").style.color="red"
  setTimeout("setblinkFont()",300)
}
function setblinkFont()
{
  document.getElementById("blink1").style.color=""
  setTimeout("blinkFont()",300)
}



var reqFeature;
var xmlhtp ;
var res;



function BioVer()
{
	
		var url="biometric.do?method=BioVer&first_finger="+ document.forms[0].first_finger.value + "&second_finger="+ document.forms[0].second_finger.value;
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveOutput;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveOutput;
							reqFeature.send(null);
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
							//document.getElementById("output").innerHTML=xmlhtp;
							//document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
							
							
							if(xmlhtp.indexOf("ERROR") > -1)
							{							
								res="Device Error";
								window.opener.postMessage({ message: res, result: true }, "*");
							}
							else if(xmlhtp.indexOf("TIMEOUT") > -1)
							{								
								res="Operation Timed Out. Please Try again.";
								window.opener.postMessage({ message: res, result: true }, "*");
							}else if(xmlhtp.indexOf("<<MATCH>>") > -1)
							{	
								if(document.forms[0].reregistration.value == "true")
									{
									
									alert("Re-Registration Process is successfull");
									
									}
								else
									{
									res="Verified";
									 var crewid = trim(document.forms[0].crewid.value);
									 //document.forms[0].action ="runningroom.do?method=initiateRunningRoom&crew_id="+ crewid ;
									 document.forms[0].action ="runningroom.do?method=initiateCrewOptions&crew_id="+ crewid ;
									 document.forms[0].submit();	
									}
								
							}else if(xmlhtp.indexOf("<<NO MATCH>>") > -1)
							{		
								
								if(document.forms[0].reregistration.value == "true")
								{
											
									alert("Re-Registration Process is failed. Please try again");
								
								}
								else
								{
									alert("Verification Failed. Please try again");
									 document.forms[0].action ="Login.do?method=initiateKiosk";
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





function ReturnToCMS(){
	
	window.opener.postMessage({ message: "cancel", result: true }, "*");

}






</script>
 </html:form>
</body>
</html>

