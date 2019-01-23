
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>


   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%; width:100%;">
<head>
<title>CMS</title>
<style>/* Stylesheet 1: */




textarea {
 
color: black;
font-size: 15px;
align: center;
}



body {
    font: 100% Lucida Sans;
    
    
    height: 100%;
}

.container {
    min-width: 900px;
}



#top {
    background-color: #84c754;
    color: #ffffff;
    
    text-align: center;
}


.menuitem:hover {
    background-color: #ffffff;
}

a {
    color: #000000;
    text-decoration: underline;
}

a:hover {
    text-decoration: none;
}

</style>
</head>
<body style="height: 100%; width:100%;">

<html:form action="welcome" style="height: 100%; width:100%;">
   
  

  <div style="height: 5%;">
  
  		<table   style="height:100%; width:100%; background-color: #84c754;" border="0" align="center" cellpadding="1">
				<tr>					
					<td align="center" >
						  <h1>Finger Print Verification</h1> 			
					</td>					
				</tr>		
		</table>    
	 
  
	
  </div>
  <div  style="height: 80%;" >
   
   			<table   style="height:100%" border="0" align="center" cellpadding="1">
				<tr>			
					<td align="center" valign="bottom">
						 		Crew ID :    <bean:write name="LoginForm" property="crewid" /> 		
					</td>			
								
									
				</tr>
				<tr>
					<td valign="middle" >
						<textarea  id="output"  cols="50" rows="1" style="border:0;  text-align:center;" >hello</textarea>   			
					</td>
				</tr>
				
				<tr>
					<td align="center" >
						<html:button property="method" value="Start Biometric Verification" styleClass="menuitem" onclick="startBio()" />	    			
					</td>	
					
				</tr>
				 
			</table>    
	 

    
   
    
  </div>
  

  

<script>





var reqFeature;
var xmlhtp ;




function startBio()
{
	
	
	document.getElementById("output").innerHTML="Please place your thumb on thumb machine";
	
		var url="welcome.do?method=startBio";
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
							document.getElementById("output").innerHTML=xmlhtp;
							document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
							
								
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}









function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}







</script>
 </html:form>
</body>
</html>

