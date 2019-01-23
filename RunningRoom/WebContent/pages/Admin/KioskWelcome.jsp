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

</head>
<body onload="onLoad()" >

<html:form action="Login" >
<html:hidden name="TayalLoginForm" property="crewid" />   
  <table   style="height:100%; width:100%;"  border="0" align="center" >
		<tr style="background-color: #ff9933;" >					
		<td style="height:10%; width:100%;" align="center" colspan = "2">
		
			<table   style="height:100%; width:100%; " border="0" align="center" >
				<tr style="background-color: #ff9933;">					
					
					<td style="height:10%; width:60%;" align="center" >
								<h2><i18n:message key="label.PAGETITLE.appname"/></h2> 			
					</td>
						
				</tr>	
			</table>
					
		</td>		
		</tr>
		
		
		<tr >		
		<td style="height:100%; width:60%;" align="center" >
		
		
		</td>	
		
		
		</tr>	
		
		
		
		
		
		<tr style="background-color: #ff9933;">					
		<td style="height:10%; width:100%;" align="center" colspan="2">
		
			<table   style="height:100%; width:100%; " border="0" align="center" >
				<tr style="background-color: #ff9933;">					
					
					<td style="height:10%; width:60%;" align="center" >
								<i18n:message key="label.PAGEFOOTER.trademark"/>		
					</td>
						
				</tr>	
			</table>
					
		</td>		
		</tr>
		
		
  </table>    
	 


  

<script>

var idcount=0;


function onLoad()
{
	 var crewid = trim(document.forms[0].crewid.value);
	 document.forms[0].action ="runningroom.do?method=initiateCrewOptions&crew_id="+ crewid ;
	 document.forms[0].submit();	
		
}



function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}



</script>
 </html:form>
</body>
</html>

