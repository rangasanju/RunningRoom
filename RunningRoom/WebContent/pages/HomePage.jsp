<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-i18n.tld" prefix="i18n"%>
<i18n:bundle baseName="com.tayal.runningroom.properties.ApplicationResources" localeRef="userLocale"/>

<html lang="en" >
<head>

 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/tayallogo.ico">
    
    
<title><i18n:message key="label.APPTITLE.title"/></title>
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

</style>   
</head>


<body  onload="onLoad()" >


<html:form action="Login" >
 <html:hidden name="TayalLoginForm" property="message" /> 
 <html:hidden name="TayalLoginForm" property="mac_address" /> 

  
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg" onclick="superLogin()"> 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/></h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="#" onclick="requestAccess()">Request Access</a></li>
                  <li><html:link forward="LOGIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

             		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
				  	 	      
          
           	  <div class="col-sm-8">	
			        
		    	 <div class="col-sm-12">
	             <img id="rrimg" src="#" class="img-responsive img-rounded" alt="Cinque Terre"> 
		         </div>
	          
	   	      </div>
	   	      
	   	      
	   	      
	   	      
          	 <div class="col-sm-4">
          	 
          	 	        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>	
          	        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>	
          
          	 
          	 <h1 class="cover-heading"><div id="loc_name"></div></h1>
             <p class="lead"><i18n:message key="label.APP.title"/></p> 
             
             
             	        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>	
          
          	        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>				        
	           		        
			  <div class="col-sm-12 hidden-xs">
				  		&nbsp;
			  </div>	
          
          
          	   			<div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	  
			     
			     		<div class="col-sm-6 ">
					       
					       <html:button property="method" value="Admin" styleClass="mediumbutton" onclick="admin()" />		
				            
				        </div>				      
 				           
			     		<div class="col-sm-6 ">
			     			<html:button property="method" value="Kiosk" styleClass="mediumbutton" onclick="kiosk()" />
				        </div>				      
 				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
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
var mode="kiosk";


function onLoad()
{
	getMac();
	

}


function getMac()
{
	mode="load";
	window.open("http://localhost:8080/RRService/authenticateClient","_blank");
	//bypass();
}


function kiosk()
{
	mode="kiosk";
	//window.open("http://localhost:8080/RRService/authenticateClient","_blank");
	document.forms[0].action ="Login.do?method=initiateKiosk";
	document.forms[0].submit();	 
	//bypass();
}


function admin()
{
	mode="admin";
	document.forms[0].action ="Login.do?method=initiateAdmin";
	document.forms[0].submit();	 
	//window.open("http://localhost:8080/RRService/authenticateClient","_blank");
	//bypass();
}


function superLogin()
{
	document.forms[0].action ="Login.do?method=initiateSuperAdmin";
	document.forms[0].submit();	 
}


window.addEventListener("message", function(ev) {
	 var msg;
	 msg = ev.data.message;	
	 ev.source.close();
	 document.forms[0].mac_address.value=msg;
	 getLocation(document.forms[0].mac_address.value);
	 
});




function bypass()
{
	 if(mode=="kiosk")
	 	 	document.forms[0].action ="Login.do?method=initiateKiosk";
	 	 else
	 	 	document.forms[0].action ="Login.do?method=initiateAdmin";
		 document.forms[0].submit();	 
		 
}


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function requestAccess()
{
	
	document.forms[0].action ="Login.do?method=requestAccess";
	document.forms[0].submit();
}



function getLocation(mac)
{

		var url="Login.do?method=getLocation&mac_address=" + mac;
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
							if(xmlhtp == "UA")
								alert("Unauthorised Access");
							else
							{
								document.getElementById("loc_name").innerHTML=xmlhtp;
								document.getElementById("rrimg").src = "images/" + xmlhtp + ".jpg"; 
								
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

