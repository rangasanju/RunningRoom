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
 <html:hidden name="RoomForm" property="roomno" /> 
 
 
 
 
 
   
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
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.assignroom"/></h1>            
          </div>
     
  		  <div >
            &nbsp;            
          </div>
  		  <div >
            &nbsp;            
          </div>
  		  <div class="inner cover">
            <h3 class="cover-heading">Room No : <bean:write name="RoomForm" property="roomno" /></h3>            
          </div>
      
  		  <div >
            &nbsp;            
          </div>
  		  <div >
            &nbsp;            
          </div>
  	                  
          
           
          <div class="row">
          
                <div class="col-sm-5">	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		
		          	 		<tbody>
		          	 		   <tr >
		          	 				<td colspan="2">
		          	 					<html:select  name="RoomForm" property="category_list" styleClass="form-control" multiple="true" size="6" >
						   								<html:options name="categorylist" /> 
						  				</html:select>
		          	 				</td>
		          	 			</tr>
		          	 			
		          	 		</tbody>
		          	 	</table>    
	          </div>


              <div class="col-sm-2">	 
              
              			<table class='table table-condensed table-responsive'>
	           		 		
		          	 		<tbody>
		          	 		   <tr >
		          	 				<td colspan="2">
		          	 					<html:button property="method" value=">>" styleClass="smallbutton" onclick="insertCat()" />	
		          	 				</td>
		          	 				
		          	 			</tr>
		          	 			
		          	 		   <tr >
		          	 				<td colspan="2">
		          	 					&nbsp;
		          	 				</td>
		          	 				
		          	 			</tr>
		          	 			 <tr >
		          	 				
		          	 				<td colspan="2">
		          	 					<html:button property="method" value="<<" styleClass="smallbutton" onclick="removeCat()" />	
		          	 				</td>
		          	 			</tr>
		          	 		</tbody>
		          	 	</table>              
	           
	           		 
	          </div>



              <div class="col-sm-5">	           
	           
	           		 	<table class='table table-condensed table-responsive'>
	           		 		
		          	 		<tbody>
		          	 		   <tr >
		          	 				<td colspan="2">
		          	 					<html:select  name="RoomForm" property="assigned_list" styleClass="form-control" multiple="true" size="8">
						   								<html:options name="assignedlist" /> 
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
	    	  	&nbsp;
	    	  </div>
	    	  
	    	

       		  <div class="col-sm-12">	           
	           
	           		 	<table class='table table-bordered table-condensed table-responsive'>
	           		 		
		          	 		<tbody>
		          	 		   <tr >
		          	 				<td colspan="2">
		          	 					<html:button property="method" value="Back" styleClass="smallbuttonblue" onclick="back()" />	
		          	 				</td>
		          	 			</tr>
		          	 			
		          	 		</tbody>
		          	 	</table>    
	          </div>



	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
	    	

 			  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
			  <div class="col-sm-12">
   			  	<div id="rooms" ></div>
   			  </div>
          	
          </div>
          
          <div class="mastfoot">
            <div class="inner">
               <p><i18n:message key="label.PAGEFOOTER.trademark"/><a href="https://twitter.com/mdo"><i18n:message key="label.PAGEFOOTER.company"/></a>.</p>
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
// 	getRooms();
	
// 			if(trim(document.forms[0].message.value) != "")
// 			{
// 				alert(document.forms[0].message.value);
// 				document.forms[0].message.value = "";
// 			}
			
}

function insertCat()
{		
	//alert(document.forms[0].category_list.length);
	var length = document.forms[0].category_list.length;
	var selected=0;
	
	for(i=0;i<length;i++)
	{
		if(document.forms[0].category_list.options[i].selected)
		{
			selected++;
		}			
	}
	
	
	if(selected > 0 )
	{
		assignRoom(document.forms[0].roomno.value);
	}
	else
	{
		alert("Please select a category to add.");
	}
	
}



function removeCat()
{		
	//alert(document.forms[0].category_list.length);
	var length = document.forms[0].assigned_list.length;
	var selected=0;
	
	for(i=0;i<length;i++)
	{
		if(document.forms[0].assigned_list.options[i].selected)
		{
			selected++;
			break;
		}			
	}
	
	
	if(selected > 0 )
	{
		deAssignRoom(document.forms[0].roomno.value);
	}
	else
	{
		alert("Please select a category to remove.");
	}
	
}
function assignRoom(room)
{		
	
		 document.forms[0].action ="Rooms.do?method=assignRoom&roomno=" + room;
		 document.forms[0].submit();		
}

function deAssignRoom(room)
{		
		 document.forms[0].action ="Rooms.do?method=deAssignRoom&roomno=" + room;
		 document.forms[0].submit();		
}


function back()
{		
	 document.forms[0].action ="Rooms.do?method=initiateAddRooms";
	 document.forms[0].submit();	
	
}




</script>
 </html:form>
</body>
</html>

