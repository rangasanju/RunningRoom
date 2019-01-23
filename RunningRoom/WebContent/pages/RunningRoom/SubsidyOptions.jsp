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
 <html:hidden name="RunningRoomForm" property="subsidy" /> 

  
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
          
          
          <div class="col-sm-2">
            &nbsp;            
          </div>      
          
           
          <div class="col-sm-8">
              <div class="col-sm-6">		        
			        <html:button property="method" value="Subsidised" styleClass="buttonActivity" onclick="initiateMess('Y')" />	
	          </div>   
	          <div class="col-sm-6">		        
			        <html:button property="method" value="Non Subsidised" styleClass="buttonActivity" onclick="initiateMess('N')" />	
	          </div>       	             
	      </div>
	      
	      <div class="col-sm-2">
            &nbsp;            
          </div>
          
	      
	      <div class="col-sm-12">
              &nbsp;
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

function initiateMess(subsidy)
{		
	document.forms[0].subsidy.value=subsidy;
	document.forms[0].action ="runningroom.do?method=initiateMess";
	document.forms[0].submit();		
}



</script>




</html:form>
</body>
</html>

