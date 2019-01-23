<!DOCTYPE html>

<%@ page pageEncoding="UTF-8"%>

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
<body >

<html:form action="Login" >
 
 <html:hidden name="TayalLoginForm" property="location" /> 
  
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix hidden-xs">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="#">Home</a></li>
                  <li><html:link forward="LOGIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.login"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          <div class="inner cover">
            &nbsp;            
          </div>
           
          <div class="row ">
          
          
          		<div class="col-sm-3">
          		</div>
                <div class="col-sm-6">
	           
	            		        
			     			        
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">User Id</label>
				        <div class="col-sm-7">
					       <html:text styleClass="form-control" name="TayalLoginForm" property="user_id"  /> 
				        </div>
				        
			        </div>
			        
			          <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">Password</label>
				        <div class="col-sm-7">
					      <div id="pass"><html:password styleClass="form-control" name="TayalLoginForm" property="password"  /> </div>
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
				        	<html:button styleClass="btn btn-lg btn-success btn-block" property="method" value="LOGIN" onclick="signin()" />	
				        </div>
				        
			        </div>
			        
			        
			        
	          </div>
	          <div class="col-sm-3">
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

function signin()
{
		if(document.forms[0].user_id.value==""){
			alert("Please enter user id");
		 		
		 }
		 else
		 {
			 document.forms[0].action ="Login.do?method=initiateLogin";
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

