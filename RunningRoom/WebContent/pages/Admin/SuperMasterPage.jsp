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
<style>

svg > g > g:last-child { pointer-events: none }

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
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;-&nbsp;&nbsp;(<%=username %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="#">Home</a></li>
                  <li><html:link forward="LOGIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

           
          <div class="row ">
          
              
	   	      <div class="col-sm-3">	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
			  <div class="col-sm-6">
   			  	<div id="requests" ></div>
   			  </div>
          	 <div class="col-sm-3">
          	 
          	   
			        	<div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	        		        
				        <div class="col-sm-12 ">
					       <html:button property="method" value="Add Division" styleClass="smallbutton" onclick="addDivision()" />		
				        </div>	
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	        
			         	<div class="col-sm-12 ">
					       <html:button property="method" value="Add Lobby" styleClass="smallbutton" onclick="addLobby()" />		
				        </div>			
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			       
			     		<div class="col-sm-12 ">
					       <html:button property="method" value="Add Rooms" styleClass="smallbutton" onclick="addRooms()" />	
				        </div>				      
 				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			          	<div class="col-sm-12 ">
					       <html:button property="method" value="Running Room" styleClass="smallbutton" onclick="runningRoom()" />		
				        </div>				 
				        
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			     
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Crew Biodata" styleClass="smallbutton" onclick="crewBiodata()" />		
				        </div>		
				        				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
					      
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Occupancy Report" styleClass="smallbutton" onclick="runningRoomReport()" />	
				        </div>		
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
					    
					    
					    <div class="col-sm-12 ">
					       <html:button property="method" value="Mess Report" styleClass="smallbutton" onclick="messReport()" />	
				        </div>		
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			        	
			        	
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Change Password" styleClass="smallbutton" onclick="changePass()" />		
				        </div>				    
				        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			  
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Food Menu" styleClass="smallbutton" onclick="foodMenu()" />		
				        </div>				      
            
            	        <div class="form-group">				        
				        	<div class="col-sm-12 hidden-xs">
					       		&nbsp;
				        	</div>				        
			        	</div>	 	      
			  
           			    <div class="col-sm-12 ">
					       <html:button property="method" value="Wake Up Calls" styleClass="smallbutton" onclick="wakeUpCalls()" />		
				        </div>				      
                      
	        
	         
          	
          	
          	
	          </div>
          	
          </div>
          
          

        </div>

      </div>

    
    
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/jquery.min.js"></script>
    <script src="static/loader.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    
  
  




<script type="text/javascript">

function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{		
	getAccessRequests();
}

function getAccessRequests()
{

	
	
		var url="Login.do?method=getAccessRequests";
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
							xmlhtp = reqFeature.responseText;						
							document.getElementById("requests").innerHTML=xmlhtp;
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}
		
		
		

function allowAccess(mac,lobby,division)
{
   


	var url="Login.do?method=allowAccess&division_code=" + division + "&mac_address=" + mac  + "&lobby_code=" + lobby ;
					if (window.XMLHttpRequest)
					{ // Non-IE browsers
						reqFeature = new XMLHttpRequest();
					try{
						reqFeature.open("GET", url, true);
						}catch (e){
						alert(e);
						}
						reqFeature.onreadystatechange = receiveDeleteOutput;
						reqFeature.send(null);
					}
					else if (window.ActiveXObject)
					{ // IE
						reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
						if (reqFeature){
						//alert('IE');
						reqFeature.open("GET", url, true);
						reqFeature.onreadystatechange = receiveDeleteOutput;
						reqFeature.send(null);
						}
					}	

					
					
}

function receiveDeleteOutput(){

	var status;
	try{
		status=reqFeature.status;
		if (reqFeature.readyState == 3){ // Complete					
				if (reqFeature.status == 200)
				{ // OK response
					xmlhtp = reqFeature.responseText;
				
					if(trim(xmlhtp) == "SUCCESS")
						{
						getAccessRequests();
						alert("Access Granted");
						}
					else
						{
						alert("Fail : Recortd not deleted");
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

