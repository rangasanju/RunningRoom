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
 <html:hidden name="RoomForm" property="message" /> 
 
 
 
 
 
   
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
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.addroom"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          
          
                <div class="col-sm-12">
	           
	           
	           		 	<table class='table table-bordered  table-responsive'>
	           		 		<thead>
	           		 			<tr>
	           		 				<th class='text-center'>
	           		 					Room No
	           		 				</th>
	           		 			
	           		 				<th class='text-center'>
	           		 					Floor
	           		 				</th>
	           		 					<th class='text-center'>
	           		 					No. Of Beds
	           		 				</th>
	           		 			
	           		 				<th class='text-center'>
	           		 					Room Type
	           		 				</th>
	           		 				
	           		 				
	           		 			</tr>
	           		 		</thead>
		          	 		<tbody>
		          	 			<tr >
		          	 				<td >
		          	 					<html:text name="RoomForm" property="roomno" styleClass="form-control"/>
		          	 				</td>
		          	 				<td >
		          	 					<html:select name="RoomForm" property="floorno" styleClass="form-control" onchange="getRooms();">
						  								<html:option value="0">G</html:option>	
						  								<html:option value="1">1</html:option>
						  								<html:option value="2">2</html:option>
						  								<html:option value="3">3</html:option>
						  								<html:option value="4">4</html:option>
						  								<html:option value="5">5</html:option>
						  								<html:option value="6">6</html:option>
						  								<html:option value="7">7</html:option>
						  								<html:option value="8">8</html:option>
						  								<html:option value="9">9</html:option>
						  								<html:option value="10">10</html:option>						  								
						  				</html:select>
		          	 				</td>
		          	 				<td >
		          	 					<html:select name="RoomForm" property="noofbeds" styleClass="form-control">
						  								
						  								<html:option value="1">1</html:option>
						  								<html:option value="2">2</html:option>
						  								<html:option value="3">3</html:option>
						  								<html:option value="4">4</html:option>
						  								<html:option value="5">5</html:option>
						  								<html:option value="6">6</html:option>
						  								<html:option value="7">7</html:option>
						  								<html:option value="8">8</html:option>
						  								<html:option value="9">9</html:option>
						  								<html:option value="10">10</html:option>		
						  								<html:option value="11">11</html:option>
						  								<html:option value="12">12</html:option>
						  								<html:option value="13">13</html:option>
						  								<html:option value="14">14</html:option>
						  								<html:option value="15">15</html:option>
						  								<html:option value="16">16</html:option>
						  								<html:option value="17">17</html:option>
						  								<html:option value="18">18</html:option>
						  								<html:option value="19">19</html:option>
						  								<html:option value="20">20</html:option>	
						  								<html:option value="21">21</html:option>
						  								<html:option value="22">22</html:option>
						  								<html:option value="23">23</html:option>
						  								<html:option value="24">24</html:option>
						  								<html:option value="25">25</html:option>					  								
						  				</html:select>
		          	 				</td>
		          	 				<td >
		          	 					<html:select name="RoomForm" property="roomtype" styleClass="form-control" >
						   								<html:options name="roomtypelist" /> 
						  				</html:select>
		          	 				</td>
		          	 			</tr>
		          	 			
		          	 		</tbody>
		          	 	</table>
          	 	
			      
			        
			        
			        
	          </div>
	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	  <div>	    	  
	    	  	<html:button property="method" value="Add" styleClass="smallbutton" onclick="saveRoom()" />		
	    	  </div>

 			  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
			  <div class="col-sm-12">
   			  	<div id="rooms" ></div>
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
	getRooms();
	
			if(trim(document.forms[0].message.value) != "")
			{
				alert(document.forms[0].message.value);
				document.forms[0].message.value = "";
			}
			
}

function getRooms()
{

	
	
		var url="Rooms.do?method=getRooms&floorno="+ document.forms[0].floorno.value ;
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
						document.getElementById("rooms").innerHTML=xmlhtp;
					}
				
				}
				catch(e)
				{
					status="Not found";
				}
}




function deleteRecord(room)
{
   


	var url="Rooms.do?method=deleteRoom&roomno=" + room  ;
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
					getRooms();
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




function saveRoom()
{		
	
	if(trim(document.forms[0].roomno.value)== "" || isNaN(trim(document.forms[0].roomno.value)))
	{
		alert("Room No must be a number");
	}	
	else if(trim(document.forms[0].roomtype.value) == "SELECT")
	{
		alert("Please select a room type");
	}	
	else
	{
		 document.forms[0].action ="Rooms.do?method=addRoom";
		 document.forms[0].submit();	
	}
			
	
}


function assignRoom(room)
{		
		 document.forms[0].action ="Rooms.do?method=initiateAssignRoom&roomno=" + room;
		 document.forms[0].submit();	
	
}





</script>
 </html:form>
</body>
</html>

