<!DOCTYPE html>

<%@ page pageEncoding="UTF-8"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-i18n.tld" prefix="i18n"%>
<i18n:bundle baseName="com.tayal.runningroom.properties.ApplicationResources" localeRef="userLocale"/>

<html >
<head>

<% String username = (String)request.getSession().getAttribute("username"); %>
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
<body onload="onLoad()" >

<html:form action="Login" >
 
  
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix hidden-xs">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg" > 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;-&nbsp;&nbsp;(<%=username %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="/runningroom.do?method=initiateCrewOptions" >Home</html:link></li>
                  <li><html:link action="/Login.do?method=initiateKiosk" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.runningroom.changepin"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
           
          <div class="row ">
          
                <div class="col-sm-5">
	           
	           	        
			        <div class="form-group">
				        <label for="inputDivision" class="control-label col-sm-5">Old Password</label>
				        <div class="col-sm-7">					      					        
					      <html:password property="oldpassword" name="TayalLoginForm" style=" width:130px;height:32px" onfocus="OnFocus()">	</html:password>
				        </div>
				        
			        </div>
			        
			        
			         <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        
			        <div class="form-group">
				        <label for="inputLobby" class="control-label col-sm-5">New Password</label>
				        <div class="col-sm-7">
					       <html:password property="password" name="TayalLoginForm" style=" width:130px;height:32px" onfocus="OnFocus()">	</html:password>
				        </div>
				        
			        </div>
			        
			           <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">Confirm Password</label>
				        <div class="col-sm-7">
					    <html:password property="re_password" name="TayalLoginForm" style=" width:130px;height:32px" onfocus="OnFocus()">	</html:password>
				        </div>
				        
			        </div>
			        
			          <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			      
			        
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">&nbsp;</label>
				        <div class="col-sm-7">
					      <html:text styleClass="form-control" name="TayalLoginForm" property="message" readonly="true" style="background-color: #fff5e0 ; border : 0; color:red" />
				        </div>
			        </div>
			        
			        <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			            
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">&nbsp;</label>
				        <div class="col-sm-7">
					       <div id="loginbtn" ><html:button property="method" value="Submit" styleClass="mediumbutton" onclick="changepass()" /></div>	
				        </div>
			        </div>
			        
			        
			        
			       
			    
	          </div>
	    
          <div class="col-sm-2">
          </div>
          	 <div class="col-sm-5">
           
	           <table class="table table-borderless">
		           <tbody>
		           	<tr>
			           	<td>
			           			  <html:button property="method" value="1" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('1')" />
			           	</td>
			           	<td>
			           			  <html:button property="method" value="2" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('2')" />
			           	</td>
			           	<td>
			           			  <html:button property="method" value="3" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('3')" />
			           	</td>			           	
		           	</tr>
		           	
		           	<tr>
			           	<td>
			           			  <html:button property="method" value="4" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('4')" />
			           	</td>
			           	<td>
			           			  <html:button property="method" value="5" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('5')" />
			           	</td>
			           	<td>
			           			  <html:button property="method" value="6" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('6')" />
			           	</td>			           	
		           	</tr>
		           	<tr>
			           	<td>
			           			 <html:button property="method" value="7" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('7')" />
			           	</td>
			           	<td>
			           			  <html:button property="method" value="8" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('8')" />
			           	</td>
			           	<td>
			           			  <html:button property="method" value="9" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('9')" />
			           	</td>			           	
		           	</tr>
		           	<tr>
			           	<td>
			           			  <html:button property="method" value="0" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('0')" />			           			 
			           	</td>
			            <td>
			            		  <html:button property="method" value="()" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('reset')"/>	
			            </td>
			            <td>
			           	 		<html:button property="method" value="<<" styleClass="btn btn-lg btn-primary btn-block" onclick="fillText('back')" />           			 
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

var idcount=0;
var selectedElement;


function onLoad()
{

selectedElement = document.forms[0].oldpassword;
document.forms[0].oldpassword.focus();
}


function OnFocus()
{

	selectedElement = document.activeElement;
		
}


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function fillCrew()
{
	
	document.forms[0].crewid.value = document.forms[0].lobby_code.value;
	document.forms[0].password.value="";
	showElements("hidden");
	idcount=0;
	
	
}


function validate()
{
	var oldpassword = document.forms[0].oldpassword.value;
	var password = document.forms[0].password.value;
	var re_password = document.forms[0].re_password.value;
	
	
	if(trim(oldpassword) == "")
	{
		alert("Please enter old password");
		return false;
	}else if(trim(password) == "")
	{
		alert("Please enter new password");
		return false;
	}else if (trim(re_password) == "")
	{
		alert("Please confirm password");
		return false;
	}else if(trim(password) != trim(re_password))
	{
		alert("Password missmatch");
		return false;
	}
	
	
	return true;
}




function changepass()
{
	
	if(validate())
	{
		
		var oldpassword = document.forms[0].oldpassword.value;
		var password = document.forms[0].password.value;
		var re_password = document.forms[0].re_password.value;
		
			var url="Login.do?method=changePassword&oldpassword=" + oldpassword + "&password=" + password + "&re_password=" + re_password;
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
}


function receiveOutput(){

			var status;
			try{
				status=reqFeature.status;
				if (reqFeature.readyState == 3){ // Complete					
						if (reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;
						
						
							if(xmlhtp.indexOf("SUCCESS") > -1)
							{
								 alert("Password updated successfully")
								 document.forms[0].action ="Login.do?method=initiateKiosk";
								 document.forms[0].submit();
							}
							else
								alert(xmlhtp);
								
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}





function fillText(val)
{
	
	if(val == "reset")
	{
		idcount=0;
		selectedElement.value = "";
		
	}
	else if(val == "back")
	{
		idcount--;
		selectedElement.value = selectedElement.value.substring(0,selectedElement.value.length-1);
		
	}
	else
	{
		idcount++;
		selectedElement.value = selectedElement.value + val;
		
	}
	
	
	
}



</script>
 </html:form>
</body>
</html>

