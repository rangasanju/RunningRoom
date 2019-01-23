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
<link href="misc/css/bootstrap-datetimepicker.css" rel="stylesheet">






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
.table th {
    text-align: center;
}

.table {
    border-radius: 5px;
    width: 50%;
    float: none;
    margin: 0px auto;
}

</style>

</head>
<body  onload="onLoad()">

<html:form action="Login" >

 
   
    <div class="site-wrapper">

      <div class="site-wrapper-inner">
          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
             <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("division") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link  action="Login.do?method=home" >Home</html:link></li>
                  <li><html:link forward="LOGOUTADMIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.divisionconsole"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
          
          <div class="row">
          
          
          
                <div class="col-sm-4">	           
	           		 	&nbsp;
	            </div>        
         
                <div class="col-sm-4">	           
	           		 	<table class='table table-borderless table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>
	           		 				<th  align="left">
	           		 					Lobby
	           		 				</th>	           		 			
	           		 				<th  align="left">
	           		 					 <html:select name="TayalLoginForm" property="lobby_code" >
												   	<html:options name="lobbylist" /> 
										 </html:select>
	           		 				</th>
	           		 			</tr>	           		            		 
	           		 		</thead>		          	 		
		          	 	</table>
	            </div>
         
                <div class="col-sm-4">	           
	           		 	&nbsp;
	            </div>        
 	    	  
         
                <div class="col-sm-12">	           
	           		 	&nbsp;
	            </div>        
 	         
                <div class="col-sm-12">	           
	           		 	&nbsp;
	            </div>        
 	    
          	  
	      <div class="col-sm-12">
          	&nbsp;
          </div>
 	    	  
	      <div class="col-sm-12">
          	&nbsp;
          </div>
          
	      <div class="col-sm-12">
          	&nbsp;
          </div>
	    	  
	    	  
	    	
	    	  
	    	  <div>	    	  
	    	  	<html:button property="method" value="Submit" styleClass="smallbutton" onclick="initiateMaster()" />	
	    	  </div>

 			  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
			  <div class="col-sm-12">	
   			  	<div id="rooms" ></div>
   			  </div>
          	
          </div>
          
         

        </div>

      </div>
 
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="misc/js/moment-with-locales.js"></script>
    <script src="misc/js/bootstrap-datetimepicker.js"></script>
    
  
  
  

<script>



function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{	
	
}



function initiateMaster()
{		
	if(document.forms[0].lobby_code.value == "Select")
	{
		alert("Please select a lobby")	
	}
	else
	{
		document.forms[0].action ="Login.do?method=initiateMasterForDivision";
		document.forms[0].submit();	
	}
			
				
}




</script>
 </html:form>
</body>
</html>

