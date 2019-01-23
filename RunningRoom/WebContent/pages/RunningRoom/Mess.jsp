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


.glyphicon.glyphicon-plus {
    font-size: 20px;
}


.glyphicon.glyphicon-minus {
    font-size: 20px;
}


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
<html:hidden name="RunningRoomForm" property="crew_id" />
<html:hidden property="camstatus" />
<html:hidden property="crewname" />

<html:hidden name="RunningRoomForm" property="subsidy" />
<html:hidden name="RunningRoomForm" property="meal_type" />
<html:hidden name="RunningRoomForm" property="breakfast" />
<html:hidden name="RunningRoomForm" property="breakfast_cat" />
<html:hidden name="RunningRoomForm" property="lunch" />
<html:hidden name="RunningRoomForm" property="lunch_cat" />
<html:hidden name="RunningRoomForm" property="dinner" />
<html:hidden name="RunningRoomForm" property="dinner_cat" />


<html:hidden name="RunningRoomForm" property="breakfast_qty" />
<html:hidden name="RunningRoomForm" property="lunch_qty" />
<html:hidden name="RunningRoomForm" property="dinner_qty" />


    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg" > 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)&nbsp;-&nbsp;&nbsp;(<%= session.getAttribute("username") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><html:link action="/runningroom.do?method=initiateCrewOptions" >Home</html:link></li>
                  <li><html:link forward="LOGOUTKIOSK" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

    
          <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.messmenu"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
          
          <div class="col-sm-3">
            &nbsp;            
          </div>
          
     
     	  <div class="col-sm-3">     	     	  			
	     	  	<div class="col-sm-12">
	   			  	<button id="btn_subsidy" type="button" class="btn btn-default opt_buttons_meal" onclick="selectSubsidy('Y')">SUBSIDISED</button>
	   			</div>	
     	  </div>
     	           
     
     	  <div class="col-sm-3">       	  			
	     	  	<div class="col-sm-12">
	   			  	<button id="btn_nonsubsidy" type="button" class="btn btn-default opt_buttons_meal" onclick="selectSubsidy('N')">NON SUBSIDISED</button>
	   			</div>	
     	  </div>
     	   
           
          <div class="col-sm-3">
            &nbsp;            
          </div>
           	  
     	  
     	  
     	  
     	   <div class="col-sm-12">
            &nbsp;            
          </div>
     	  
    	  
     	  <div class="col-sm-3">     	  
     	  			
	     	  	<div class="col-sm-10">
	   			  	<button id="btn_breakfast" type="button" class="btn btn-default opt_buttons_meal" onclick="selectMeal('breakfast')">BREAKFAST</button>	   			  
	   			</div>	   			  			
	   			<div id="b_qty" class="col-sm-2">     
	   			  		<h3><bean:write name="RunningRoomForm" property="breakfast_qty"/></h3>
	   			</div>    	  
	   			<div class="col-sm-12">	    	  
		    	  &nbsp;
		    	</div>
		    	
		    	
		    	
		    	<div class="col-sm-10">
	   			  	<button id="btn_breakfast_cat" type="button" class="btn btn-default opt_buttons_food" onclick="selectCategory('breakfast')">NON-VEG</button>
	   			</div>	   			
	   			<div class="col-sm-1">     
	   			  		<span class="glyphicon glyphicon-plus" onclick="addMeal('breakfast')"></span>
	   			</div> 
	   			<div class="col-sm-1">     
	   			  		<span class="glyphicon glyphicon-minus" onclick="substractMeal('breakfast')"></span>
	   			</div>   		
     	  
	   			
	   			
		    	<div class="col-sm-12">	    	  
		    	  &nbsp;
		    	</div>
	     	  	<div class="col-sm-10">
	   			  	<div id="breakfast"  ></div>
	   			</div>
		    	<div class="col-sm-2">	    	  
		    	  &nbsp;
		    	</div>
   			  		          	 				
     	  </div>
     	  
     	 
     	  
      	  <div class="col-sm-4">
     	  			
	     	  	<div class="col-sm-10">
	   			  	<button id="btn_lunch" type="button" class="btn btn-default opt_buttons_meal" onclick="selectMeal('lunch')">LUNCH</button>
	   			</div>	   				  			
	   			<div id="l_qty" class="col-sm-2">     
	   			  		<h3><bean:write name="RunningRoomForm" property="lunch_qty"/></h3>
	   			</div>   		
	   			
	   			<div class="col-sm-12">	    	  
		    	  &nbsp;
		    	</div>
		    	
		    	
		    	<div class="col-sm-10">
	   			  	<button id="btn_lunch_cat" type="button" class="btn btn-default opt_buttons_food" onclick="selectCategory('lunch')">NON-VEG</button>
	   			</div> 			
	   			<div class="col-sm-1">     
	   			  		<span class="glyphicon glyphicon-plus" onclick="addMeal('lunch')"></span>
	   			</div> 
	   			<div class="col-sm-1">     
	   			  		<span class="glyphicon glyphicon-minus" onclick="substractMeal('lunch')"></span>
	   			</div>   		
     	  
     	  
     	  
		    	<div class="col-sm-12">	    	  
		    	  &nbsp;
		    	</div>
	     	  	<div class="col-sm-10">
	   			  	<div id="lunch"></div>
	   			</div>
	   			<div class="col-sm-2">	    	  
		    	  &nbsp;
		    	</div>
   	
     	  </div>
     	  
     	  
     	  <div class="col-sm-4">
     	       	  			
	     	  	<div class="col-sm-10">
	   			  	<button id="btn_dinner" type="button" class="btn btn-default opt_buttons_meal" onclick="selectMeal('dinner')">DINNER</button>
	   			</div>	   				  			
	   			<div id="d_qty" class="col-sm-2">     
	   			  		<h3><bean:write name="RunningRoomForm" property="dinner_qty"/></h3>
	   			</div>
	   			<div class="col-sm-12">	    	  
		    	  &nbsp;
		    	</div>
		    	
		    	
		    	
		    	<div class="col-sm-10">
	   			  	<button id="btn_dinner_cat" type="button" class="btn btn-default opt_buttons_food" onclick="selectCategory('dinner')">NON-VEG</button>
	   			</div>
	   			 			
	   			<div class="col-sm-1">     
	   			  		<span class="glyphicon glyphicon-plus" onclick="addMeal('dinner')"></span>
	   			</div> 
	   			<div class="col-sm-1">     
	   			  		<span class="glyphicon glyphicon-minus" onclick="substractMeal('dinner')"></span>
	   			</div>   		
     	  
		    	<div class="col-sm-12">	    	  
		    	  &nbsp;
		    	</div>
	     	  	<div class="col-sm-10">
	   			  	<div  id="dinner"></div>
	   			</div>	   			
		    	<div class="col-sm-2">	    	  
		    	  &nbsp;
		    	</div>
   	
     	  </div>
     
     
       	  <div class="col-sm-12">
     	       	  			
	     	  	<div class="col-sm-12">
	   			  	<html:button property="method" value="Submit" styleClass="smallbutton" onclick="saveMessOptions()" />
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
	
	document.forms[0].subsidy.value="Y";			
	document.getElementById("btn_subsidy").style.background = "lightgreen";  		
	document.getElementById("btn_nonsubsidy").style.background = "white";
	
	
	if(document.forms[0].breakfast.value == "N")
	{
		document.getElementById("btn_breakfast").style.background = "white";  		
		document.getElementById("btn_breakfast_cat").style.background = "white";
	}
	else
	{		
		document.getElementById("btn_breakfast").style.background = "lightgreen";  
		if(document.forms[0].breakfast_cat.value == "VEG")
			document.getElementById("btn_breakfast_cat").style.background = "lightgreen";  
		else
			document.getElementById("btn_breakfast_cat").style.background = "pink"; 
		
	}
	
	if(document.forms[0].lunch.value == "N")
	{
		document.getElementById("btn_lunch").style.background = "white";  		
		document.getElementById("btn_lunch_cat").style.background = "white";
	}
	else
	{		
		document.getElementById("btn_lunch").style.background = "lightgreen";  
		if(document.forms[0].lunch_cat.value == "VEG")
			document.getElementById("btn_lunch_cat").style.background = "lightgreen";  
		else
			document.getElementById("btn_lunch_cat").style.background = "pink"; 
			
	}
	
	
	if(document.forms[0].dinner.value == "N")
	{
		document.getElementById("btn_dinner").style.background = "white";  		
		document.getElementById("btn_dinner_cat").style.background = "white";
	}
	else
	{		
		document.getElementById("btn_dinner").style.background = "lightgreen";  
		if(document.forms[0].dinner_cat.value == "VEG")
			document.getElementById("btn_dinner_cat").style.background = "lightgreen";  
		else
			document.getElementById("btn_dinner_cat").style.background = "pink"; 
		
		
	}
	document.getElementById("btn_breakfast_cat").innerHTML=document.forms[0].breakfast_cat.value;
	document.getElementById("btn_lunch_cat").innerHTML=document.forms[0].lunch_cat.value;
	document.getElementById("btn_dinner_cat").innerHTML=document.forms[0].dinner_cat.value;
	getMenu();
}



function addMeal(type)
{

	if(type == "breakfast")
	{
		document.forms[0].breakfast_qty.value = parseInt(document.forms[0].breakfast_qty.value) + 1;
		document.getElementById("b_qty").innerHTML="<h3>" + document.forms[0].breakfast_qty.value + "</h3>";
		

		if(parseInt(document.forms[0].breakfast_qty.value) > 0)
		{
			document.getElementById("btn_breakfast").style.background = "lightgreen"; 
			document.getElementById("btn_breakfast_cat").style.background = "lightgreen";
			document.getElementById("btn_breakfast_cat").innerHTML="VEG";
			breakfast_cat.breakfast_cat.value="VEG";
			document.forms[0].breakfast.value="Y";
		}
	}else if(type == "lunch")
	{
		document.forms[0].lunch_qty.value = parseInt(document.forms[0].lunch_qty.value) + 1;
		document.getElementById("l_qty").innerHTML="<h3>" + document.forms[0].lunch_qty.value + "</h3>";

		if(parseInt(document.forms[0].lunch_qty.value) > 0)
		{
			document.getElementById("btn_lunch").style.background = "lightgreen"; 
			document.getElementById("btn_lunch_cat").style.background = "lightgreen";
			document.getElementById("btn_lunch_cat").innerHTML="VEG";
			breakfast_cat.lunch_cat.value="VEG";
			document.forms[0].lunch.value="Y";
		}
	}else if(type == "dinner")
	{
		document.forms[0].dinner_qty.value = parseInt(document.forms[0].dinner_qty.value) + 1;
		document.getElementById("d_qty").innerHTML="<h3>" + document.forms[0].dinner_qty.value + "</h3>";

		if(parseInt(document.forms[0].dinner_qty.value) > 0)
		{
			document.getElementById("btn_dinner").style.background = "lightgreen"; 
			document.getElementById("btn_dinner_cat").style.background = "lightgreen";
			document.getElementById("btn_dinner_cat").innerHTML="VEG";
			breakfast_cat.dinner_cat.value="VEG";
			document.forms[0].dinner.value="Y";
		}
	}	
		
}




function substractMeal(type)
{

	if(type == "breakfast")
	{
		if(parseInt(document.forms[0].breakfast_qty.value) > 0)
		{
			document.forms[0].breakfast_qty.value = parseInt(document.forms[0].breakfast_qty.value) - 1;
			document.getElementById("b_qty").innerHTML="<h3>" + document.forms[0].breakfast_qty.value + "</h3>";
		}
		
		if(parseInt(document.forms[0].breakfast_qty.value) == 0)
		{
			document.getElementById("btn_breakfast").style.background = "white";  	
			document.getElementById("btn_breakfast_cat").style.background = "white";
			document.getElementById("btn_breakfast_cat").innerHTML="NA";
			breakfast_cat.breakfast_cat.value="NA";
			document.forms[0].breakfast.value="N";
		}
			
			
	}else if(type == "lunch")
	{
		if(parseInt(document.forms[0].lunch_qty.value) > 0)
		{
			document.forms[0].lunch_qty.value = parseInt(document.forms[0].lunch_qty.value) - 1;
			document.getElementById("l_qty").innerHTML="<h3>" + document.forms[0].lunch_qty.value + "</h3>";
		}

		if(parseInt(document.forms[0].lunch_qty.value) == 0)
		{
			document.getElementById("btn_lunch").style.background = "white";  		
			document.getElementById("btn_lunch_cat").style.background = "white";
			document.getElementById("btn_lunch_cat").innerHTML="NA";
			breakfast_cat.lunch_cat.value="NA";
			document.forms[0].lunch.value="N";
		}
			
			
	}else if(type == "dinner")
	{
		if(parseInt(document.forms[0].dinner_qty.value) > 0)
		{
			document.forms[0].dinner_qty.value = parseInt(document.forms[0].dinner_qty.value) - 1;
			document.getElementById("d_qty").innerHTML="<h3>" + document.forms[0].dinner_qty.value + "</h3>";
		}

		if(parseInt(document.forms[0].dinner_qty.value) == 0)
		{
			document.getElementById("btn_dinner").style.background = "white";  	
			document.getElementById("btn_dinner_cat").style.background = "white";
			document.getElementById("btn_dinner_cat").innerHTML="NA";
			breakfast_cat.dinner_cat.value="NA";
			document.forms[0].dinner.value="N";
		}
			
			
	}
		
}



function selectMeal(meal)
{
	
	
	if(meal == "breakfast")
	{
		
		if(document.forms[0].breakfast.value == "N")
		{
			if(parseInt(document.forms[0].breakfast_qty.value) == 0)
			{
				document.forms[0].breakfast_qty.value = "1";
				document.getElementById("b_qty").innerHTML="<h3>1</h3>";
			}
			document.forms[0].breakfast.value="Y";
			document.getElementById("btn_breakfast").style.background = "lightgreen";  			
			document.forms[0].breakfast_cat.value="VEG";
			document.getElementById("btn_breakfast_cat").innerHTML="VEG";
			document.getElementById("btn_breakfast_cat").style.background = "lightgreen";  
		}
		else
		{
			document.forms[0].breakfast_qty.value = "0";
			document.getElementById("b_qty").innerHTML="<h3>0</h3>";
			document.forms[0].breakfast.value="N";
			document.forms[0].breakfast_cat.value="NA";
			document.getElementById("btn_breakfast_cat").innerHTML="NA";
			document.getElementById("btn_breakfast").style.background = "white";  			
			document.getElementById("btn_breakfast_cat").style.background = "white";  
		}
		
	}
	
	if(meal == "lunch")
	{
		
		if(document.forms[0].lunch.value == "N")
		{
			if(parseInt(document.forms[0].lunch_qty.value) == 0)
			{
				document.forms[0].lunch_qty.value = "1";
				document.getElementById("l_qty").innerHTML="<h3>1</h3>";
			}
			document.forms[0].lunch.value="Y";
			document.getElementById("btn_lunch").style.background = "lightgreen";  			
			document.forms[0].lunch_cat.value="VEG";
			document.getElementById("btn_lunch_cat").innerHTML="VEG";
			document.getElementById("btn_lunch_cat").style.background = "lightgreen";  
		}
		else
		{
			document.forms[0].lunch_qty.value = "0";
			document.getElementById("l_qty").innerHTML="<h3>0</h3>";
			document.forms[0].lunch.value="N";
			document.getElementById("btn_lunch").style.background = "white";  			
			document.forms[0].lunch_cat.value="NA";
			document.getElementById("btn_lunch_cat").innerHTML="NA";
			document.getElementById("btn_lunch_cat").style.background = "white";  
		}
		
	}
	
	if(meal == "dinner")
	{
		
		if(document.forms[0].dinner.value == "N")
		{
			if(parseInt(document.forms[0].dinner_qty.value) == 0)
			{
				document.forms[0].dinner_qty.value = "1";
				document.getElementById("d_qty").innerHTML="<h3>1</h3>";
			}
			document.forms[0].dinner.value="Y";
			document.getElementById("btn_dinner").style.background = "lightgreen";  
			document.getElementById("btn_dinner_cat").innerHTML="VEG";
			document.forms[0].dinner_cat.value="VEG";
			document.getElementById("btn_dinner_cat").style.background = "lightgreen";  
		}
		else
		{
			document.forms[0].dinner_qty.value = "0";
			document.getElementById("d_qty").innerHTML="<h3>0</h3>";
			document.forms[0].dinner.value="N";
			document.getElementById("btn_dinner").style.background = "white";  
			document.getElementById("btn_dinner_cat").innerHTML="NA";
			document.forms[0].dinner_cat.value="NA";
			document.getElementById("btn_dinner_cat").style.background = "white";  
		}
		
	}
	
	
	
}



function selectSubsidy(choice)
{
	
	document.forms[0].subsidy.value=choice;
	if(choice == "Y")
	{			
		document.getElementById("btn_subsidy").style.background = "lightgreen";  		
		document.getElementById("btn_nonsubsidy").style.background = "white";
	}
	else
	{		
		document.getElementById("btn_subsidy").style.background = "white";  		
		document.getElementById("btn_nonsubsidy").style.background = "lightgreen";
	
	}
	
		
}




function selectCategory(meal)
{
	if(meal == "breakfast")
	{
		
		if(document.forms[0].breakfast.value == "Y")
		{
			if(document.forms[0].breakfast_cat.value == "VEG")
			{
				
				document.forms[0].breakfast_cat.value="NONVEG";
				document.getElementById("btn_breakfast_cat").style.background = "pink";  
				document.getElementById("btn_breakfast_cat").innerHTML="NON-VEG";
			}
			else
			{
				
				document.forms[0].breakfast_cat.value="VEG";
				document.getElementById("btn_breakfast_cat").style.background = "lightgreen";  
				document.getElementById("btn_breakfast_cat").innerHTML="VEG";
			}
		}
		else
		{
			document.forms[0].breakfast_cat.value="NA";
			document.getElementById("btn_breakfast_cat").innerHTML="NA";
			document.getElementById("btn_breakfast_cat").style.background = "white";  
		}
			
			
		
		
		
	}
	
	if(meal == "lunch")
	{
		if(document.forms[0].lunch.value == "Y")
		{
			if(document.forms[0].lunch_cat.value == "VEG")
			{
				document.forms[0].lunch_cat.value="NONVEG";
				document.getElementById("btn_lunch_cat").style.background = "pink";  
				document.getElementById("btn_lunch_cat").innerHTML="NON-VEG";
			}
			else
			{
				document.forms[0].lunch_cat.value="VEG";
				document.getElementById("btn_lunch_cat").style.background = "lightgreen";  
				document.getElementById("btn_lunch_cat").innerHTML="VEG";
			}
		}
		else
		{
			document.getElementById("btn_lunch_cat").style.background = "white"; 
			document.getElementById("btn_lunch_cat").innerHTML="NA";
			document.forms[0].lunch_cat.value="NA";
		}
		
		
	}	
	
	if(meal == "dinner")
	{
		if(document.forms[0].dinner.value == "Y")
		{
			if(document.forms[0].dinner_cat.value == "VEG")
			{
				document.forms[0].dinner_cat.value="NONVEG";
				document.getElementById("btn_dinner_cat").style.background = "pink";  
				document.getElementById("btn_dinner_cat").innerHTML="NON-VEG";
			}
			else
			{
				document.forms[0].dinner_cat.value="VEG";
				document.getElementById("btn_dinner_cat").style.background = "lightgreen";  
				document.getElementById("btn_dinner_cat").innerHTML="VEG";
			}
		}
		else
		{
			document.forms[0].dinner_cat.value="NA";
			document.getElementById("btn_dinner_cat").style.background = "white";  
			document.getElementById("btn_dinner_cat").innerHTML="NA";
		}
			
		
		
	}
	
}






function saveMessOptions()
{
			 document.forms[0].action ="runningroom.do?method=saveMessOptions";
			 document.forms[0].submit();
			
}

function cancel()
{
	

	 document.forms[0].action ="runningroom.do?method=initiateCrewOptions"
	 document.forms[0].submit();	
	
}



function getMenu()
{
	
	
		var url="runningroom.do?method=getMenu";
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
					document.getElementById("breakfast").innerHTML=xmlhtp.substring(xmlhtp.indexOf("<BREAKFAST>") + 11, xmlhtp.indexOf("</BREAKFAST>"));
					document.getElementById("lunch").innerHTML=xmlhtp.substring(xmlhtp.indexOf("<LUNCH>") + 7, xmlhtp.indexOf("</LUNCH>"));
					document.getElementById("dinner").innerHTML=xmlhtp.substring(xmlhtp.indexOf("<DINNER>") + 8, xmlhtp.indexOf("</DINNER>"));
			
				}
				
				
				
				}
				catch(e)
				{
					status="Not found";
				}
		}





function getMessAvailed()
{
	
	
	var crewid = "<%=session.getAttribute("username") %>";	
	document.forms[0].crew_id.value=crewid;
	
		var url="runningroom.do?method=getMessAvailed&crew_id=" + crewid ;
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveMessAvailed;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveMessAvailed;
							reqFeature.send(null);
						}
					}	
	
						
	
	
}


function receiveMessAvailed(){

			var status;
			
			try{
				status=reqFeature.status;
				if (reqFeature.readyState == 3){ // Complete					
						if (reqFeature.status == 200)
						{ // OK response						
							
							xmlhtp = reqFeature.responseText;						
							document.getElementById("messavailed").innerHTML=xmlhtp;
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

