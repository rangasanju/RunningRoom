
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
<title><i18n:message key="label.PAGETITLE.appname"/></title>
<link rel="stylesheet" href="css/mybuttons.css" />
</head>
<body  onload="onLoad()">

<html:form action="Master" >
 <html:hidden name="MasterForm" property="message" /> 
  <table   style="height:100%; width:100%;"  border="0" align="center" >
		<tr style="background-color: #ff9933;">					
		<td style="height:10%; width:100%;" align="center" colspan="2">
		
			<table   style="height:100%; width:100%; " border="0" align="center" >
				<tr style="background-color: #ff9933;">					
					
					<td style="height:10%; width:20%;" align="center" >
								
					</td>	
					<td style="height:10%; width:60%;" align="center" >
								<h2><i18n:message key="label.PAGETITLE.adddivision"/></h2> 			
					</td>
					<td style="height:10%; width:20%;" align="right" >
								<html:link action="Master.do?method=home" ><img src="images/home.png" height="80%" width="15%"></html:link>
								<html:link forward="LOGOUTADMIN" ><img src="images/logout.png" height="80%" width="15%"></html:link>
					</td>
					
				</tr>	
			</table>
					
		</td>		
		</tr>
			
		
		<tr >		
		<td style="height:100%; width:70%;" align="center">
		
		
		
			<table width="100%" border="0">
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>					
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				
				
			
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
	
				<tr >					
					<td  colspan="2" align="center">
						  <table width='60%' border="0" >
						  	<tr >
						  		<td align="center" bgcolor="#ff9933"> Division Code </td>
						  		<td align="center" bgcolor="#ff9933"> Division Name </td>
						  	
						  	</tr>
						  	<tr >
						  		<td align="center" bgcolor="#ffd9b3"> <html:text name="MasterForm" property="division_code" style="width:100px"/></td>
						  		<td align="center" bgcolor="#ffd9b3"> <html:text name="MasterForm" property="division_name" style="width:100px"/></td>
						  		
						  		
						  	</tr>
						  </table>
					</td>						
				</tr>		
				
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				
				<tr >					
					<td valign="middle" align="center" colspan="2" >
							<html:button property="method" value="Add" styleClass="smallbutton" onclick="saveDivision()" />									
					</td>		
					
				</tr>		
				
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				
				<tr >					
					<td  colspan="2" align="center">
						   <div id="divisions" ></div>
					</td>						
				</tr>		
	
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
				<tr >					
					<td  colspan="2">
						   &nbsp;
					</td>						
				</tr>		
	
					
				
				
				
			</table>
		
				
		
		
		
		
		
		
		
		
		
		
		
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


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}



function onLoad()
{		
	getDivisionList();
	
	
			if(trim(document.forms[0].message.value) != "")
			{
				alert(document.forms[0].message.value);
				document.forms[0].message.value = "";
			}
			
			
	
}

function getDivisionList()
{

	
	
		var url="Master.do?method=getDivisionList" ;
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
							xmlhtp = reqFeature.responseText;						
							document.getElementById("divisions").innerHTML=xmlhtp;
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}





function saveDivision()
{		
	
	
	
	if(document.forms[0].division_code.value.length < 3)
	{
		alert("Division code cannot be empty or less than 3 characters");
	}
	else if(document.forms[0].division_name.value.length < 3)
	{
		alert("Division name cannot be empty or less than 3 characters");
	}
	else
	{
		
		document.forms[0].division_code.value = document.forms[0].division_code.value.toUpperCase();
		document.forms[0].division_name.value = document.forms[0].division_name.value.toUpperCase();
		
		 document.forms[0].action ="Master.do?method=addDivision";
		 document.forms[0].submit();	
	}
			
	
}









function deleteRecord(rec)
{
   


	var url="Master.do?method=deleteDivision&division_code=" + rec  ;
					if (window.XMLHttpRequest)
					{ // Non-IE browsers
						reqFeature = new XMLHttpRequest();
					try{
						reqFeature.open("GET", url, true);
						}catch (e){
						alert(e);
						}
						reqFeature.onreadystatechange = receiveDeleteOutput;
						reqFeature.send(null);
					}
					else if (window.ActiveXObject)
					{ // IE
						reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
						if (reqFeature){
						//alert('IE');
						reqFeature.open("GET", url, true);
						reqFeature.onreadystatechange = receiveDeleteOutput;
						reqFeature.send(null);
						}
					}	

					
					
}

function receiveDeleteOutput(){

	var status;
	try{
		status=reqFeature.status;
		if (reqFeature.readyState == 3){ // Complete					
				if (reqFeature.status == 200)
				{ // OK response
					xmlhtp = reqFeature.responseText;
				
					if(trim(xmlhtp) == "SUCCESS")
						{
						getDivisionList();
						alert("Recortd deleted");
						}
					else
						{
						alert("Fail : Recortd not deleted");
						}
				}
			}
		}
		catch(e)
		{
			status="Not found";
		}
}








</script>
 </html:form>
</body>
</html>

