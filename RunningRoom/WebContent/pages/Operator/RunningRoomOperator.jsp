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

<style>

.table-wrapper-scroll-y {
  display: block;
  max-height: 500px;
  overflow-y: auto;
  -ms-overflow-style: -ms-autohiding-scrollbar;
}



.table-borderless > tbody > tr > td,
.table-borderless > tbody > tr > th,
.table-borderless > tfoot > tr > td,
.table-borderless > tfoot > tr > th,
.table-borderless > thead > tr > td,
.table-borderless > thead > tr > th {
    border: none;
}

</style>

</head>
<body   onload="onLoad()">	

<html:form action="Master" >
 <html:hidden name="TayalLoginForm" property="message" />
 <html:hidden name="TayalLoginForm" property="location" />  

  
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
             <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="Master.do?method=operatorHome" >Home</html:link></li>
                  <li><html:link forward="LOGOUTADMIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover hidden-xs">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.roomlayout"/> ( Operator )</h1>
            
          </div>
          
           <div class="inner cover hidden-xs">
            &nbsp;
            
          </div>
          
          
          <div class="row">
              <div class="col-sm-9">	           
			         <div class="table-wrapper-scroll-y " id="layout" ></div>			        
	          </div>
	    	  <div class="col-sm-3">	     
	    	  		<div  class="col-sm-12"><h3 class="cover-heading">Wake Up Calls</h3>     </div>  
	    	     
			         <div  class="col-sm-12" id="wakeups">  </div>  	
			        			 
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



var room_selected="0";
var bed_selected="0";

var previous_selected_id="00";
var prev_color="lightgreen";






function onLoad()
{
	//alert("cHECK 1");
	getLayout();
	prev_color="";
	
	setTimeout(getWakeUpInfo,2000);
	
	
	
}



function getLayout()
{
	
	
	
		var url="runningroom.do?method=getRunningRoomLayoutForAdmin";
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveLayout;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveLayout;
							reqFeature.send(null);
						}
					}	
	
	
}





function receiveLayout(){

			var status;
			try{
				status=reqFeature.status;
									
						if (reqFeature.readyState == 4 && reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;	
							//alert(xmlhtp);
							document.getElementById("layout").innerHTML=xmlhtp;
							//document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
						
						}
					
				}
				catch(e)
				{
					status="Not found";
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











function home()
{
			 document.forms[0].action ="runningroom.do?method=initiateCrewOptions";
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

