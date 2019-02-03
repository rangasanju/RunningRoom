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
<html:hidden name="RunningRoomReportForm" property="hourly_date"/>
 
   
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
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.runningroom.occupancycountreport"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
          
          <div class="row">
          
          <div class="col-sm-4">
          	&nbsp;
          </div>
          <div class="col-sm-4">
	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>
	           		 				<th  align="left">
	           		 					Day Wise
	           		 				</th>	           		 			
	           		 				<th  align="left">
	           		 					<html:radio property="frequency" value="day" onclick="selectFrequency()" ></html:radio>
	           		 				</th>
	           		 				<th  align="left">
	           		 					Hourly
	           		 				</th>	           		 			
	           		 				<th  align="left">
	           		 					<html:radio property="frequency" value="hour" onclick="selectFrequency()"></html:radio>
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
	    	  
	    	  
	    	  
          <div id="daywise">
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
	           		 		
	           		 		</thead>
		          	 		
		          	 	</table>
	          </div>
	    	  
	      </div>
	    	   	  
         
          <div id="hourly">
          
          		<div class="col-sm-4">
          		</div>
                <div class="col-sm-4">
	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>
	           		 				<th  align="left">
	           		 					Date
	           		 				</th>	           		 			
	           		 				<th  align="left">
	           		 					 <div class='input-group date' id='hourlydatepicker'>
						                    <input type='text' class="form-control" id="hourlydate"/>
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
	           		 				</th>
	           		 			</tr>
	           		 		           		 		
	           		 			
	           		 		</thead>
		          	 		
		          	 	</table>
	          </div>
	          <div class="col-sm-4">
          		</div>
	    	    
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


$(function () {
	 $('#hourlydatepicker').datetimepicker({
         
         format: 'DD/MM/YYYY'
     });
});


function onLoad()
{	
	
	document.getElementById("daywise").style.display="none";
	document.getElementById("hourly").style.display="none";;
}


function selectFrequency()
{

	if(document.forms[0].frequency.value == "day")
	{
		document.getElementById("daywise").style.display="block";
		document.getElementById("hourly").style.display="none";;
	}
	else
	{
		document.getElementById("daywise").style.display="none";
		document.getElementById("hourly").style.display="block"
	}
	
}


function showReport()
{		
	
	if(document.forms[0].frequency.value == "day")
	{
		
		
		var fromdate = document.getElementById("fromdate").value;
		var todate = document.getElementById("todate").value;
		
		var coverted_fromdate = fromdate.substring(6,10) + "-" +  fromdate.substring(3,5) + "-" + fromdate.substring(0,2);
		var coverted_todate = todate.substring(6,10) + "-" +  todate.substring(3,5) + "-" + todate.substring(0,2);
		
		var fdate = new Date(coverted_fromdate);
		var tdate = new Date(coverted_todate);
		

		if(trim(fromdate) == "")
		{
			alert("Please specify From Date");
		}
		else if(trim(todate) == "")
		{
			alert("Please specify To Date");
		}
		else if(fdate > tdate)
		{
			
			alert("FROM DATE cannot be greater than TO DATE");
		}
		else
		{
			document.forms[0].from_date.value = fromdate;
			document.forms[0].to_date.value = todate;
			
			document.forms[0].action ="runningroomreport.do?method=occupancyCountReport";
			document.forms[0].submit();	
		}
		
		
		
	}
	else
	{
		var hourdate = document.getElementById("hourlydate").value;
		document.forms[0].hourly_date.value = hourdate;
		if(trim(hourdate) == "")
		{
			alert("Please specify a Date");
		}
		else
		{
			
			document.forms[0].action ="runningroomreport.do?method=occupancyCountReport";
			document.forms[0].submit();	
		}
	}
	
		
			
		
			
				
			
			
			
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

