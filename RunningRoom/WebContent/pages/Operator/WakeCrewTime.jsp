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
.active{
background-color: green !important;

}


.opt_buttons_meal{

min-width: 200px;
max-width: 200px;
min-height: 50px;
max-height: 50px;

}


.opt_buttons_food{

min-width: 200px;
max-width: 200px;
min-height: 50px;
max-height: 50px;

}

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

<html:form action="breathanalysis" >

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg" > 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="Master.do?method=operatorHome" >Home</html:link></li>
                  <li><html:link forward="LOGOUTKIOSK" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

    
          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.wakeme"/></h1>            
          </div>
          <div class="inner cover">
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
   
   
   		  <div class="col-sm-9">
   		  
   		  
   		  <div class="col-sm-4">            
           		&nbsp;
          </div>
          <div class="col-sm-2">  
          Crew ID
           		
          </div>
          
          <div class="col-sm-2">            
           		<html:select name="RunningRoomForm" property="crew_id" styleClass="form-control">
					<html:options name="crewlist" /> 
				</html:select>
          </div>
          <div class="col-sm-4">            
           		&nbsp;
          </div>
          
          
          
   		  </div>
   		  <div class="col-sm-3">    		               
           		&nbsp;
   		  </div>
   		      
   
          <div class="col-sm-12">     	       	  			
	     	  &nbsp;	   			
     	  </div>
   
   
   		  <div class="col-sm-9">
   		  
          <div class="col-sm-4">            
           		&nbsp;
          </div>
          <div class="col-sm-2">  
          Outward Train No
           		
          </div>
          
          <div class="col-sm-2">            
           		<html:text name="RunningRoomForm" property="outward_train" styleClass="form-control"></html:text>
					
          </div>
          <div class="col-sm-4">            
           		&nbsp;
          </div>
          
          
          
          
          
   		  </div>
   		  <div class="col-sm-3">    		               
           		&nbsp;
   		  </div>
   		      
    	  
    	  
    	  
    	   	  
         
										  							
		  <div class="col-sm-12">     	       	  			
	     	  &nbsp;	   			
     	  </div>
          <div class="col-sm-12">     	       	  			
	     	  &nbsp;	   			
     	  </div>
     	  							  							
										  							
	      <div class="col-sm-9">     	       	  			
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>	      		 				
	           		 				           		 			
	           		 				<th class='text-center'>
	           		 					  <div class='input-group date' id='wakedatepicker'>
												<input type='hidden' class="form-control" id="wakedate"/>
												  
										  </div>
	           		 				</th>
	           		 				<th class='text-center'>
	           		 					 <div class='input-group date' id='waketimepicker'>
												<input type='hidden' class="form-control" id="waketime"/>
												   
										  </div>
	           		 				</th>
	           		 			</tr>
	           		 		</thead>		          	 		
		          	 	</table>  			
     	  </div>  
     	  
     	  <div class="col-sm-3">	     
	    	  		<div  class="col-sm-12"><h3 class="cover-heading">Wake Up Calls</h3>     </div>  
	    	     
			         <div  class="col-sm-12" id="wakeups">  </div>  	
			        			 
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
       
    	  
     	
      
     
       	  <div class="col-sm-12">
     	       	  			
	     	  	<div class="col-sm-12">
	   			  	<html:button property="method" value="Submit" styleClass="smallbutton" onclick="saveWakeUpTime()" />
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
    <script src="misc/js/moment-with-locales.js"></script>  
    <script src="misc/js/bootstrap-datetimepicker.js"></script>
 
 
 <script>
 

 $(function () {
 	 $('#wakedatepicker').datetimepicker({          
          format: 'DD/MM/YYYY',
          inline: true,
          sideBySide: true
      });
 });

 $(function () {
     $('#waketimepicker').datetimepicker({
         format: 'HH:mm',
         inline: true,
         sideBySide: true
     });
 });
 
 
 
 
 
 </script>

<script>


var reqFeature;
var xmlhtp ;
var res;
var resfordisplay;
var size=0;



function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{
	
	getWakeUpInfo()
}




function saveWakeUpTime()
{
	var wakedate = document.getElementById("wakedate").value;
	var waketime = document.getElementById("waketime").value;
	
	//alert(wakedate);
	//alert(wakedate + " " + waketime);
	
	var trn_no = document.forms[0].outward_train.value;
	
	if(trn_no.length > 10)
		alert("Train no size is too big");
	else
	{
		document.forms[0].action ="runningroom.do?method=saveWakeCrewTime&wakeup_time=" + wakedate + " " + waketime;
		document.forms[0].submit();
	}
	
	
			
}




function getWakeUpInfo()
{

	
		
		var url="runningroom.do?method=getWakeupInfo";
		if (window.XMLHttpRequest){ // Non-IE browsers
			reqFeature = new XMLHttpRequest();
		try{
			reqFeature.open("GET", url, true);
			}catch (e){
			alert(e);
			}
			reqFeature.onreadystatechange = receiveGuestInfo;
			reqFeature.send(null);
			}
			else if (window.ActiveXObject){ // IE
			reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
			if (reqFeature){
			//alert('IE');
			reqFeature.open("GET", url, true);
			reqFeature.onreadystatechange = receiveGuestInfo;
			reqFeature.send(null);
			}
		}
		
	
}



function receiveGuestInfo(){

			
			try{
				
				
				if (reqFeature.readyState == 4 && reqFeature.status == 200)
					{
						
						xmlhtps = reqFeature.responseText;	
						document.getElementById("wakeups").innerHTML = xmlhtps;
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

