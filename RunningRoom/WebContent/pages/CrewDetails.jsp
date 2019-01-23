
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>


   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%; width:100%;">
<head>
<title>Hello World</title>
<style>/* Stylesheet 1: */



.virtualbutton {
   border-top: 1px solid #96d1f8;
   background: #81c1eb;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#81c1eb));
   background: -webkit-linear-gradient(top, #3e779d, #81c1eb);
   background: -moz-linear-gradient(top, #3e779d, #81c1eb);
   background: -ms-linear-gradient(top, #3e779d, #81c1eb);
   background: -o-linear-gradient(top, #3e779d, #81c1eb);
   padding: 10px 20px;
   -webkit-border-radius: 19px;
   -moz-border-radius: 19px;
   border-radius: 19px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 24px;
   font-family: Georgia, Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 60px;
   height: 60px;
   }
   
   
   
.button {
   border-top: 1px solid #96d1f8;
   background: #81c1eb;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#81c1eb));
   background: -webkit-linear-gradient(top, #3e779d, #81c1eb);
   background: -moz-linear-gradient(top, #3e779d, #81c1eb);
   background: -ms-linear-gradient(top, #3e779d, #81c1eb);
   background: -o-linear-gradient(top, #3e779d, #81c1eb);
   padding: 20px 40px;
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
   width: 150px;
   height: 80px;
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
   
   
   
a {
    color: #000000;
    text-decoration: underline;
}

a:hover {
    text-decoration: none;
}

</style>
</head>
<body  >

<html:form action="welcome" >
 
  <table   style="height:100%; width:100%;"  border="0" align="center" >
		<tr style="background-color: #84c754;">					
		<td style="height:10%; width:100%;" align="center" >
		
			<table   style="height:100%; width:100%; " border="0" align="center" >
				<tr style="background-color: #84c754;">					
					
					<td style="height:10%; width:60%;" align="center" >
								<h2>BA / Bio </h2> 			
					</td>
						
				</tr>	
			</table>
					
		</td>		
		</tr>
		
		
		<tr >		
		<td style="height:60%; width:100%;" align="center" >
		
			<table   style="height:60%; width:100% " border="0" align="center" cellpadding="1">
				<tr >					
					<td style=" width:48%;"align="right" colspan="2">
						    &nbsp;
					</td>						
				</tr>	
				<tr >					
					<td style=" width:48%;"align="right" >
						   Division :    
					</td>	
					<td style=" width:52%;"align="left" >
						  <html:select name="MasterForm" property="division_code" onchange="getLobbyList();">
						   	<html:options name="divisionlist" /> 
						  </html:select>
					</td>	
					
				</tr>	
				
				<tr >					
					<td style=" width:48%;"align="right" >
						   Crew ID :    
					</td>	
					<td style=" width:52%;"align="left" >
						   <html:text name="LoginForm" property="crewid"  style=" width:130px;height:32px"/> 
					</td>	
					
				</tr>	
				
				
				
				<tr >					
					<td style=" width:48%;"align="right" colspan="2">
						    &nbsp;
					</td>						
				</tr>	
				<tr >					
					<td style=" width:48%;"align="right" colspan="2">
						    &nbsp;
					</td>						
				</tr>	
			</table>
					
		</td>	
		</tr>	
		
		
		
		
		<tr >		
		<td align="center" >
		
			<table   style=" width:90%; " border="0" align="center" cellpadding="1">
				<tr >					
					<td  >
						  <html:button property="method" value="1" styleClass="virtualbutton" onclick="fillText('1')" />
					</td>	
					<td  >
						  <html:button property="method" value="2" styleClass="virtualbutton" onclick="fillText('2')" />
					</td>	
					<td  >
						  <html:button property="method" value="3" styleClass="virtualbutton" onclick="fillText('3')" />
					</td>	
					<td  >
						  <html:button property="method" value="4" styleClass="virtualbutton" onclick="fillText('4')" />
					</td>	
					<td  >
						  <html:button property="method" value="5" styleClass="virtualbutton" onclick="fillText('5')" />
					</td>	
					<td  >
						  <html:button property="method" value="6" styleClass="virtualbutton" onclick="fillText('6')" />
					</td>	
					<td  >
						  <html:button property="method" value="7" styleClass="virtualbutton" onclick="fillText('7')" />
					</td>	
					<td  >
						  <html:button property="method" value="8" styleClass="virtualbutton" onclick="fillText('8')" />
					</td>	
					<td  >
						  <html:button property="method" value="9" styleClass="virtualbutton" onclick="fillText('9')" />
					</td>	
					<td  >
						  <html:button property="method" value="0" styleClass="virtualbutton" onclick="fillText('0')" />
					</td>
				</tr>	
				<tr >					
					<td  >
						  <html:button property="method" value="Q" styleClass="virtualbutton" onclick="fillText('Q')" />
					</td>	
					<td  >
						  <html:button property="method" value="W" styleClass="virtualbutton" onclick="fillText('W')" />
					</td>	
					<td  >
						  <html:button property="method" value="E" styleClass="virtualbutton" onclick="fillText('E')" />
					</td>	
					<td  >
						  <html:button property="method" value="R" styleClass="virtualbutton" onclick="fillText('R')" />
					</td>	
					<td  >
						  <html:button property="method" value="T" styleClass="virtualbutton" onclick="fillText('T')" />
					</td>	
					<td  >
						  <html:button property="method" value="Y" styleClass="virtualbutton" onclick="fillText('Y')" />
					</td>	
					<td  >
						  <html:button property="method" value="U" styleClass="virtualbutton" onclick="fillText('U')" />
					</td>	
					<td  >
						  <html:button property="method" value="I" styleClass="virtualbutton" onclick="fillText('I')" />
					</td>	
					<td  >
						  <html:button property="method" value="O" styleClass="virtualbutton" onclick="fillText('O')" />
					</td>	
					<td  >
						  <html:button property="method" value="P" styleClass="virtualbutton" onclick="fillText('P')" />
					</td>
				</tr>	
				<tr >					
					<td  >
						  <html:button property="method" value="A" styleClass="virtualbutton" onclick="fillText('A')" />
					</td>	
					<td  >
						  <html:button property="method" value="S" styleClass="virtualbutton" onclick="fillText('S')" />
					</td>	
					<td  >
						  <html:button property="method" value="D" styleClass="virtualbutton" onclick="fillText('D')" />
					</td>	
					<td  >
						  <html:button property="method" value="R" styleClass="virtualbutton" onclick="fillText('F')" />
					</td>	
					<td  >
						  <html:button property="method" value="G" styleClass="virtualbutton" onclick="fillText('G')" />
					</td>	
					<td  >
						  <html:button property="method" value="H" styleClass="virtualbutton" onclick="fillText('H')" />
					</td>	
					<td  >
						  <html:button property="method" value="J" styleClass="virtualbutton" onclick="fillText('J')" />
					</td>	
					<td  >
						  <html:button property="method" value="K" styleClass="virtualbutton" onclick="fillText('K')" />
					</td>	
					<td  >
						  <html:button property="method" value="L" styleClass="virtualbutton" onclick="fillText('L')" />
					</td>	
					<td  >
						  <html:button property="method" value="Z" styleClass="virtualbutton" onclick="fillText('Z')" />
					</td>
				</tr>	
				<tr >					
					<td  >
						  <html:button property="method" value="X" styleClass="virtualbutton" onclick="fillText('X')" />
					</td>	
					<td  >
						  <html:button property="method" value="C" styleClass="virtualbutton" onclick="fillText('C')" />
					</td>	
					<td  >
						  <html:button property="method" value="V" styleClass="virtualbutton" onclick="fillText('V')" />
					</td>	
					<td  >
						  <html:button property="method" value="B" styleClass="virtualbutton" onclick="fillText('B')" />
					</td>	
					<td  >
						  <html:button property="method" value="N" styleClass="virtualbutton" onclick="fillText('N')" />
					</td>	
					<td  >
						  <html:button property="method" value="M" styleClass="virtualbutton" onclick="fillText('M')" />
					</td>	
					
				</tr>	
				
				
			</table>
					
		</td>	
		</tr>	
		
		
		
		
		
		<tr style=" width:100%;">					
			<td align="center" >
				 <table   style="width:60%" border="0" align="center" >
					
					<tr >					
					<td style=" width:48%;"align="right" colspan="3">
						    &nbsp;
					</td>						
					</tr>	
				
				
					<tr style="height:70%">
						<td valign="middle" align="center" >
						<html:button property="method" value="RESET" styleClass="button" onclick="fillText('reset')" />									
						</td>
						
						<td valign="middle" align="center" >
						<html:button property="method" value="BACKSPACE" styleClass="button" onclick="fillText('back')" />									
						</td>
						
						<td valign="middle" align="center" >
						<html:button property="method" value="LOGIN" styleClass="button" onclick="goToBio()" />									
						</td>
						
					</tr>
					
					
					 
				</table>    
		 
			</td>					
		</tr>	
		
  </table>    
	 


  

<script>




function goToBio()
{
		if(document.forms[0].crewid.value==""){
			alert("Please enter crewid");
		 	document.forms[0].crewid.value="";
		
		 }
		 else
		 {
			 document.forms[0].action ="welcome.do?method=initiateBio";
			 document.forms[0].submit();
		 }
	
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

