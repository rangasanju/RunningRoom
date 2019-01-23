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
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.modifymenu"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
     
           
          <div class="row">
          
                <div class="col-sm-12">
	           
	           		
	           		<div class="col-sm-12">
	           			
	           			<table class='table table-borderless table-responsive'>
	           		 		
		          	 		<tbody>
		          	 		
		          	 				<tr >
		          	 			
		          	 				<td >
		          	 					<label class="control-label">Day</label>
		          	 				</td>
		          	 				
		          	 				<td >
		          	 					<label class="control-label">Meal</label>
		          	 				</td>
		          	 				<td >
		          	 					<label class="control-label">Category</label>
		          	 				</td>
		          	 				<td >
		          	 					<label class="control-label">Add Item</label>
		          	 				</td>
		          	 				</tr>
		        
		          	 			<tr >
		          	 			
		          	 				<td >
		          	 					 <html:select name="FoodMenu" property="weekday" onchange="getMenu();" styleClass="form-control" >
										   	<html:options name="weekdaylist" /> 
										  </html:select>
		          	 				</td>
		          	 				<td >
		          	 					 <html:select name="FoodMenu" property="meal_type" onchange="getMenu();" styleClass="form-control" >
										   	<html:options name="mealtypelist" /> 
										  </html:select>
		          	 				</td>
		          	 				<td >
		          	 					 <html:select name="FoodMenu" property="food_type" onchange="getMenu();" styleClass="form-control">
										   	<html:options name="foodtypelist" /> 
										  </html:select>
		          	 				</td>
		          	 				<td >
		          	 					 <html:text name="FoodMenu" property="item_name"  styleClass="form-control"/>
		          	 				</td>
		          	 				
		          	 				<td colspan="2">
		          	 					<html:button property="method" value="Add" styleClass="smallbutton" onclick="saveMenu()" />		
		          	 				</td>
		          	 			</tr>
		          	 			
		          	 			<tr >
		          	 				<td colspan="2">
		          	 					&nbsp;
		          	 				</td>
		          	 				
		          	 			</tr>
		          	 		
		          	 		</tbody>
		          	 	</table>
          	 	
	           		
	           		</div>
	           		
			        
			        
			        
	          </div>
	    	  
	    	  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	
 			  <div>	    	  
	    	  	&nbsp;
	    	  </div>
	    	  
			  <div class="col-sm-12">
   			  	<div id="output" ></div>
   			  </div>
          	
          </div>
          
          

        </div>

      </div>
 
 

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
	
	document.forms[0].item_name.value="";
	getMenu();
	

	if(trim(document.forms[0].message.value) != "")
	{
		alert(document.forms[0].message.value);
		document.forms[0].message.value = "";
	}
	
	
}


function saveMenu()
{
	
	
	var meal_type = document.forms[0].meal_type.value;
	var type = document.forms[0].food_type.value;
	var item = document.forms[0].item_name.value;
	
	
	if(trim(meal_type) == "Select")
	{
		alert("Please select Meal type");
	}
	else if(trim(type) == "Select")
	{
		alert("Please select category");
	}
	else if(trim(item) == "")
	{
		alert("Please describe the item");
	}
	else
	{
		var r = confirm("You are adding " + item + " in " + meal_type + " under " + type + " food category. Do you want to proceed?");
		
		if(r == true)
		{

			 document.forms[0].action ="MiscMaster.do?method=saveMenu&meal_type=" + meal_type + "&food_type=" + type + "&item_name=" + item;
			 document.forms[0].submit();
			
		}
		
	}
		
	
}

function cancel()
{
	

	 document.forms[0].action ="runningroom.do?method=initiateCrewOptions"
	 document.forms[0].submit();	
	
}



function getMenu()
{
	
	var weekday = document.forms[0].weekday.value;
	var meal_type = document.forms[0].meal_type.value;
	var type = document.forms[0].food_type.value;
	
	
	if( weekday != "Select" && meal_type != "Select")
		{
	
		var url="MiscMaster.do?method=getMenuForAdmin&weekday=" + weekday + "&meal_type=" + meal_type + "&food_type=" + type;
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
	
	
}


function receiveOutput(){

			var status;
		
			
			try{
				status=reqFeature.status;
				
				if (reqFeature.readyState == 4 && reqFeature.status == 200)
				{
					xmlhtp = reqFeature.responseText;						
					document.getElementById("output").innerHTML=xmlhtp;
				}
				
				
				
				}
				catch(e)
				{
					status="Not found";
				}
		}





function deleteRecord(item)
{
   


	var url="MiscMaster.do?method=deleteMenuItem&item_name=" + item  ;
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
						getMenu();
						alert("Item deleted");
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

