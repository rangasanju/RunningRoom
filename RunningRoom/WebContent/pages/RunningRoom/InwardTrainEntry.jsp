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
 
  <html:hidden name="RunningRoomForm" property="crew_id" /> 
    <div class="site-wrapper">

      <div class="site-wrapper-inner">

       

          <div class="masthead clearfix hidden-xs">
            <div class="inner">
              <img class="masthead-brand masthead-brand-img" src="images/tayallogo.jpg"> 
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
            <h1 class="cover-heading"><i18n:message key="label.PAGETITLE.InwardTrain"/></h1>            
          </div>
          <div class="inner cover">
            &nbsp;            
          </div>
           
              
	    
    	  <div class="form-group">				        
			 <div id="name" class="col-sm-12 hidden-xs">
			    &nbsp;
			 </div>				        
		  </div>
			
		  <div class="col-sm-3">
		    	  &nbsp;
		  </div>        
		  <div class="col-sm-2">
		    	  <label for="inputCrewId" class="control-label col-sm-5 pull-right" style='white-space: nowrap'>Inward Train No</label>
		  </div>
		  <div class="col-sm-3 ">
		    	  <html:text  styleClass="form-control" name="RunningRoomForm" property="inward_train"  /> 
		  </div>
		  <div class="col-sm-4">
		    	  &nbsp;
		  </div>  
		      
			        
		  <div class="form-group">				        
		       <div class="col-sm-12 hidden-xs">
			       &nbsp;
		       </div>				        
		  </div>
			        	    
          
          <div class="col-sm-1">
          </div>
          
  	 	  <div class="col-sm-10">
           
	           <table class="table table-borderless">
		                  <tbody>
		           	<tr>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('1')">1</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('2')">2</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('3')">3</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('4')">4</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('5')">5</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('6')">6</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('7')">7</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('8')">8</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('9')">9</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('0')">0</button>
			           	</td>	
		           	</tr>
		           	
		           <tr>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('Q')">Q</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('W')">W</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('E')">E</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('R')">R</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('T')">T</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('Y')">Y</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('U')">U</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('I')">I</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('O')">O</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('P')">P</button>
			           	</td>	
		           	</tr>
		           	
		           	<tr>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('A')">A</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('S')">S</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('D')">D</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('F')">F</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('G')">G</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('H')">H</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('J')">J</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('K')">K</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('L')">L</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('')">&nbsp;</button>
			           	</td>
			           	
		           	</tr>           	
		              	
		           	<tr>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('Z')">Z</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('X')">X</button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('C')">C</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('V')">V</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('B')">B</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('N')">N</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('M')">M</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('')">&nbsp;</button>
			           	</td>	
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('reset')"><span class="glyphicon glyphicon-refresh"></span></button>
			           	</td>
			           	<td>
			           			 <button type="button" class="btn  btn-lg btn-primary btn-block" onclick="fillText('Back')"><span class="glyphicon glyphicon-step-backward"></span></button>
			           	</td>
			           	
		           	</tr>           	
		           
		           </tbody>
		       </table>
	           
	          </div>
	    
	          <div class="col-sm-1">
	          </div>
          	
         
       
       
        	  <div class="form-group">				        
				<div class="col-sm-12 hidden-xs">
				  &nbsp;
				</div>				        
			  </div>
			            
			  <div class="col-sm-4">
				 &nbsp;	
			  </div>
			  <div class="col-sm-4">
				 <div id="loginbtn" ><html:button styleClass="btn btn-lg btn-success btn-block" property="method" value="Submit" onclick="validate()" />	</div>	
			  </div>
			  <div class="col-sm-4">
				 &nbsp;	
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

function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function onLoad()
{	
	
	document.forms[0].inward_train.value = "";
	
	
}




function validate()
{
	
	var trn_no = trim(document.forms[0].inward_train.value);
	
	if(trn_no=="")
	{
		alert("Please enter inward train no");	
	}
	else
	{
		document.forms[0].action ="runningroom.do?method=initiateCrewOptions" ;
		document.forms[0].submit();
	}
	
}




function fillText(val)
{
	
	var train_no = document.forms[0].inward_train.value;
	idcount = train_no.length  ;
	
	
	if(val == "reset")
	{
		idcount=0;
		document.forms[0].inward_train.value = "";
	}
	else if(val == "back")
	{
		document.forms[0].inward_train.value = document.forms[0].inward_train.value.substring(0,document.forms[0].inward_train.value.length-1);
		
	}
	else
	{
		//idcount++;
		
		if(idcount < 10)
			document.forms[0].inward_train.value = document.forms[0].inward_train.value + val;
		
		
	}
	
	

	
}





</script>
 </html:form>
</body>
</html>

