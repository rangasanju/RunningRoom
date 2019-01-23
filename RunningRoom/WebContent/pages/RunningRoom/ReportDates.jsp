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

<html:form action="runningroomreport" >
<html:hidden name="RunningRoomReportForm" property="from_date"/>
<html:hidden name="RunningRoomReportForm" property="to_date"/>
 
 
   
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
             <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="Master.do?method=home" >Home</html:link></li>
                  <li><html:link forward="LOGOUTADMIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.occupancyreport"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
           
          <div class="row">
          
                <div class="col-sm-6">
	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>
	           		 				<th  align="left">
	           		 					From Date
	           		 				</th>	           		 			
	           		 				<th  align="left">
	           		 					 <div class='input-group date' id='fromdatepicker'>
						                    <input type='text' class="form-control" id="fromdate"/>
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
	           		 				</th>
	           		 			</tr>
	           		 			
	           		 				
	           		 			<tr>	           		 				
	           		 				<th >
	           		 					&nbsp;
	           		 				</th>	           		 			
	           		 				<th>
	           		 					&nbsp;
	           		 				</th>
	           		 			</tr>
	           		 			
	           		 			<tr>	           		 				
	           		 				<th align="left">
	           		 					Crew Id 
	           		 				</th>	           		 			
	           		 				<th align="left">
	           		 					<html:text name="RunningRoomReportForm" property="crew_id_filter"  styleClass="form-control" onkeyup="this.value = this.value.toUpperCase();"/>
	           		 					
	           		 				</th>
	           		 			</tr>
	           		 			
	           		 		</thead>
		          	 		
		          	 	</table>
	          </div>
	    	  
	    	  
	    	  
	    	  
	    	  <div class="col-sm-6">
	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>	           		 				
	           		 				<th class='text-center'>
	           		 					To Date
	           		 				</th>	           		 			
	           		 				<th class='text-center'>
	           		 					 <div class='input-group date' id='todatepicker'>
						                    <input type='text' class="form-control" id="todate"/>
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
	           		 				</th>
	           		 			</tr>
	           		 			
	           		 				<tr>	           		 				
	           		 				<th >
	           		 					&nbsp;
	           		 				</th>	           		 			
	           		 				<th>
	           		 					&nbsp;
	           		 				</th>
	           		 			</tr>
	           		 			
	           		 			<tr>	           		 				
	           		 				<th align="left">
	           		 					Room No 
	           		 				</th>	           		 			
	           		 				<th align="left">
	           		 					 <html:select name="RunningRoomReportForm" property="room_no_filter">
												   	<html:options name="roomlist" /> 
										 </html:select>
	           		 				</th>
	           		 			</tr>
	           		 		
	           		 		</thead>
		          	 		
		          	 	</table>
	          </div>
	    	  
	    	  
	    	   	  
	    	
	    	  
	    	  
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	     
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	    
	    	  <div class="hidden_xs">	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  <div>	    	  
	    	  	<html:button property="method" value="Show Report" styleClass="smallbutton" onclick="showReport()" />	
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


$(function () {
	 $('#fromdatepicker').datetimepicker({
         
         format: 'DD/MM/YYYY'
     });
});


$(function () {
	 $('#todatepicker').datetimepicker({
         
         format: 'DD/MM/YYYY'
     });
});



function onLoad()
{	
	
}

function showReport()
{		
			var fromdate = document.getElementById("fromdate").value;
			var todate = document.getElementById("todate").value;
			
		
			
				document.forms[0].from_date.value = fromdate;
				document.forms[0].to_date.value = todate;
				document.forms[0].action ="runningroomreport.do?method=runningRoomReport";
				document.forms[0].submit();	
			
			
			
}


function showRedfdsfport()
{		
			 document.forms[0].action ="runningroom.do?method=initiateRunningRoom";
			 document.forms[0].submit();
}



</script>
 </html:form>
</body>
</html>

