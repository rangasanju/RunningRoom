<!DOCTYPE html>

<%@ page pageEncoding="UTF-8"%>

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



</head>
<body onload="onLoad()" >

<html:form action="Login" >
 
  <html:hidden name="TayalLoginForm" property="mac_address" /> 
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix hidden-xs">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
              <h3 class="masthead-brand">&nbsp;&nbsp;&nbsp;&nbsp;<i18n:message key="label.PAGETITLE.appname"/>&nbsp;(<%= session.getAttribute("location") %>)</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="#">Home</a></li>
                 <li><html:link forward="LOGIN" >Logout</html:link></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

           <div class="inner cover">
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.crewlogin"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
           
           
          <div class="col-sm-12">	
              		           
			        <div class="col-sm-5">
			        	 <div class="table-wrapper-scroll-y " id="dashboard" ></div>	
	          		</div>		
	      </div>
	          
	          
          <div class="row ">
          
                <div class="col-sm-5">
	           
			   <%--      <div class="form-group">
				        <label for="inputDivision" class="control-label col-sm-5">Division</label>
				        <div class="col-sm-7">
					      					        
					        <html:select styleClass="form-control" name="TayalLoginForm" property="division_code"  onchange="getLobbyListDropdown();">
						   		<html:options name="divisionlist" /> 
						  	</html:select>
				        </div>
				        
			        </div> --%>
			        
			        
			         <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        
			        <div class="form-group">
				        <label for="inputLobby" class="control-label col-sm-5">Lobby</label>
				        <div class="col-sm-7">
					        <html:select styleClass="form-control" name="TayalLoginForm" property="lobby_code" onchange="fillCrew();">
						   		<html:options name="lobbylist" /> 
						  	</html:select>
				        </div>
				        
			        </div>
			        
			           <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">Crew Id</label>
				        <div class="col-sm-7">
					      <html:text  styleClass="form-control" name="TayalLoginForm" property="crewid"  /> 
				        </div>
				        
			        </div>
			        
			        <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        <div class="form-group">				        
				        <div id="name" class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5" id="passlabel">Password</label>
				        <div class="col-sm-7">
					      <div id="pass"><html:password styleClass="form-control" name="TayalLoginForm" property="password"  /> </div>
				        </div>
				        
			        </div>
			        
			        
			        <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			        
			        
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">&nbsp;</label>
				        <div class="col-sm-7">
					      <html:text styleClass="form-control" name="TayalLoginForm" property="message" readonly="true" style="background-color: #fff5e0 ; border : 0; color:red" />
				        </div>
				        
			        </div>
			        
			        <div class="form-group">				        
				        <div class="col-sm-12 hidden-xs">
					       &nbsp;
				        </div>				        
			        </div>
			            
			        <div class="form-group">
				        <label for="inputCrewId" class="control-label col-sm-5">&nbsp;</label>
				        <div class="col-sm-7">
					       <div id="loginbtn" ><html:button styleClass="btn btn-lg btn-success btn-block" property="method" value="LOGIN" onclick="validate()" />	</div>	
				        </div>
				        
			        </div>
			        
			        
			        
			       
			    
	          </div>
	    
          <div class="col-sm-2">
          </div>
          	 <div class="col-sm-5">
           
	           <table class="table table-borderless">
		                  <tbody>
		           	<tr>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('1')">1</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('2')">2</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('3')">3</button>
			           	</td>			           	
		           	</tr>
		           	
		           	<tr>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('4')">4</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('5')">5</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('6')">6</button>
			           	</td>			           	
		           	</tr>
		           	<tr>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('7')">7</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('8')">8</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('9')">9</button>
			           	</td>			           	
		           	</tr>
		           	<tr>
			           
			            <td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('reset')"><span class="glyphicon glyphicon-refresh"></span> </button>			           			 
			           	</td>
			           	<td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('0')">0</button>			           			 
			           	</td>
			           	 <td>
			           			 <button type="button" class="btn btn-lg btn-primary btn-block" onclick="fillText('back')"><span class="glyphicon glyphicon-step-backward"></span></button>			           			 
			           	</td>
			           		  		           	
		           	</tr>
		           	
		           	
		           
		           </tbody>
		       </table>
	           
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

var idcount=0;

window.addEventListener("message", function(ev) {
	 var msg;
	 msg = ev.data.message;	
	 ev.source.close();
	 if(msg.indexOf("MATCH") >=0)
	 {
		 var crewid = trim(document.forms[0].crewid.value);
		 document.forms[0].action ="runningroom.do?method=initiateCrewOptions&crew_id="+ crewid ;
		 document.forms[0].submit();	
	 }
	 else
	 {
		 alert("Authentication failed");
	 }
	 
	
	 
	 
});

function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{	
	
	getDashboard();
	
	document.forms[0].crewid.value = document.forms[0].lobby_code.value;
	document.getElementById("passlabel").style.visibility="hidden";
	document.getElementById("pass").style.visibility="hidden";
	document.getElementById("loginbtn").style.visibility="hidden";		
	
	
}



function fillCrew()
{	
	document.forms[0].crewid.value = document.forms[0].lobby_code.value;
	document.forms[0].password.value="";
	showElements("hidden");
	idcount=0;	
	
	
}

function getLobbyListDropdown()
{
	document.forms[0].message.value="";
	division = document.forms[0].division_code.value;
	document.forms[0].action ="Login.do?method=initiateKiosk&division_code="+ division ;
	document.forms[0].submit();
}


function login()
{
	var crewid = trim(document.forms[0].crewid.value);
	document.forms[0].action ="Login.do?method=initiateLogin&user_id=" + crewid;
	document.forms[0].submit();
}



function validate()
{
	var crewid = trim(document.forms[0].crewid.value);
	var pin = trim(document.forms[0].password.value);
		var url="Login.do?method=validateUser&user_id="+ crewid + "&password=" + pin;
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveValidateOutput;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveValidateOutput;
							reqFeature.send(null);
						}
					}	
	
	
}



function receiveValidateOutput(){

			var status;
			try{
				status=reqFeature.status;
				if (reqFeature.readyState == 3){ // Complete					
						if (reqFeature.status == 200)
						{ // OK response
							
							xmlhtp = reqFeature.responseText;
							if(trim(xmlhtp) == "VALID")
							{
								 var crewid = trim(document.forms[0].crewid.value);
								 document.forms[0].action ="runningroom.do?method=initiateCrewOptions&crew_id="+ crewid ;
								 document.forms[0].submit();	
							}
							else
							{
								document.forms[0].message.value = xmlhtp;
							}
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}



function getBioStatus()
{
	var crewid = trim(document.forms[0].crewid.value);
		var url="CrewBiodata.do?method=getBioStatus&crew_id="+ crewid;
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
			var crewid = trim(document.forms[0].crewid.value);
			try{
				status=reqFeature.status;
				if (reqFeature.readyState == 3){ // Complete					
						if (reqFeature.status == 200)
						{ // OK response
							
							xmlhtp = reqFeature.responseText;
							
							var biosts = xmlhtp.substring(0,xmlhtp.indexOf("@"));
							var name = xmlhtp.substring(xmlhtp.indexOf("@") + 1);
							
							//alert(xmlhtp);
							if(trim(xmlhtp) == "NA")
							{
								alert("Invalid Crew ID");
								document.forms[0].crewid.value = document.forms[0].lobby_code.value;
							}
							else if(trim(biosts) == "Y:Y")
							{
								window.open("http://localhost:8080/RRService/initiateBio/" + crewid + "/BiometricVerification","_blank");
								
							}else if(trim(biosts) == "Y:N")
							{
								window.open("http://localhost:8080/RRService/initiateBio/" + crewid + "/BiometricRegistration","_blank");
								
							}
							else
							{
								
								document.getElementById("name").innerHTML="<h2>" + name + "</h2>";
								showElements("visible");		
							}
						}
					}
				}
				catch(e)
				{
					status="Not found";
				}
		}



function fillText(val)
{
	var lobbycode = document.forms[0].lobby_code.value;
	var crewid = document.forms[0].crewid.value;
	var pass = document.forms[0].password.value;
	idcount = (crewid.length - lobbycode.length) + 1 ;
	
	
	if(val == "reset")
	{
		idcount=0;
		document.forms[0].crewid.value = document.forms[0].lobby_code.value;
		document.forms[0].password.value="";
	}
	else if(val == "back")
	{
		//idcount--;
		
		if(pass.length > 0 )
			document.forms[0].password.value = document.forms[0].password.value.substring(0,document.forms[0].password.value.length-1);
		else
			if(document.forms[0].lobby_code.value.length < document.forms[0].crewid.value.length)
				document.forms[0].crewid.value = document.forms[0].crewid.value.substring(0,document.forms[0].crewid.value.length-1);
	}
	else
	{
		//idcount++;
		
		if(idcount > 4)
			document.forms[0].password.value = document.forms[0].password.value + val;
		else
			document.forms[0].crewid.value = document.forms[0].crewid.value + val;
		
		if(idcount==4)
		{
			getBioStatus();
			
		}
	}
	
	
	if(idcount < 4)
	{
		showElements("hidden");
	}

	
}

function showElements(status)
{
	//document.getElementById("passlabel").style.visibility=status;
	//document.getElementById("pass").style.visibility=status;
	document.getElementById("loginbtn").style.visibility=status;	

}




function getDashboard()
{
	
	
	
		var url="Master.do?method=getDashboardForKiosk";
						if (window.XMLHttpRequest){ // Non-IE browsers
							reqFeature = new XMLHttpRequest();
						try{
							reqFeature.open("GET", url, true);
							}catch (e){
							alert(e);
							}
							reqFeature.onreadystatechange = receiveDashboard;
							reqFeature.send(null);
							}
							else if (window.ActiveXObject){ // IE
							reqFeature = new ActiveXObject("Microsoft.XMLHTTP");
							if (reqFeature){
							//alert('IE');
							reqFeature.open("GET", url, true);
							reqFeature.onreadystatechange = receiveDashboard;
							reqFeature.send(null);
						}
					}	
	
	
}





function receiveDashboard(){

			var status;
			try{
				status=reqFeature.status;
								
					if (reqFeature.readyState == 4 && reqFeature.status == 200)
						{ // OK response
							xmlhtp = reqFeature.responseText;						
							document.getElementById("dashboard").innerHTML=xmlhtp;
							//document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight; 
						
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

