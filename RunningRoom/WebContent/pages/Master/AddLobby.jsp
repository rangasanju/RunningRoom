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

<html:form action="Master" >
 <html:hidden name="MasterForm" property="message" /> 
 
 
 
 
 
   
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div >
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
            &nbsp;            
          </div>
          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.addlobby"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
           
          <div class="row">
          
                <div class="col-sm-12">
	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		<thead>
	           		 			<tr>
	           		 				<th class='text-center'>
	           		 					Lobby Code
	           		 				</th>
	           		 			
	           		 				<th class='text-center'>
	           		 					<html:text name="MasterForm" property="lobby_code" styleClass="form-control" onkeyup="this.value = this.value.toUpperCase();"/>
	           		 				</th>
	           		 			</tr>
	           		 			<tr>
	           		 				<th class='text-center'>
	           		 					Lobby Name
	           		 				</th>
	           		 			
	           		 				<th class='text-center'>
	           		 					<html:text name="MasterForm" property="lobby_name" styleClass="form-control" onkeyup="this.value = this.value.toUpperCase();"/>
	           		 				</th>
	           		 			</tr>

	           		 		</thead>
	           		 		
	               	 	</table>
          	 	
			        
	          </div>
	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  <div>	    	  
	    	  	<html:button property="method" value="Add" styleClass="smallbutton" onclick="saveLobby()" />		
	    	  </div>

 			  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  
	    	  
			  <div class="col-sm-12">
   			  	<div id="lobbies" ></div>
   			  </div>
   			  
          	
          </div>
         
        </div>

      </div>
 
 

<script>


function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{		
	getLobbies();
	
			if(trim(document.forms[0].message.value) != "")
			{
				alert(document.forms[0].message.value);
				document.forms[0].message.value = "";
			}
			
}

function getLobbies()
{

	
	
		var url="Master.do?method=getLobbyList";
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
					if (reqFeature.readyState == 4 && reqFeature.status == 200)
					{
						xmlhtp = reqFeature.responseText;
						xmlhtp = reqFeature.responseText;						
						document.getElementById("lobbies").innerHTML=xmlhtp;
					}
			
				}
				catch(e)
				{
					status="Not found";
				}
		}




function deleteRecord(rec)
{
   


	var url="Master.do?method=deleteLobby&lobby_code=" + rec  ;
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
			if (reqFeature.readyState == 4 && reqFeature.status == 200)
			{
				xmlhtp = reqFeature.responseText;
				
				if(trim(xmlhtp) == "SUCCESS")
					{
					getLobbies();
					alert("Recortd deleted");
					}
				else
					{
					alert("Fail : Recortd not deleted");
					}
			}
		
		}
		catch(e)
		{
			status="Not found";
		}
}




function saveLobby()
{		
	
	if(trim(document.forms[0].lobby_code.value) == "")
	{
		alert("Please Enter Lobby Code");
	}
	else if(trim(document.forms[0].lobby_name.value) == "")
	{
		alert("Please Enter Lobby Name");
	}
	else
	{		
		 document.forms[0].action ="Master.do?method=addLobby";
		 document.forms[0].submit();	
	}
			
	
}





</script>
 </html:form>
</body>
</html>

