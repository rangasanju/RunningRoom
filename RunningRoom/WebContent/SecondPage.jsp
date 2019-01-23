
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>


   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%; width:100%;">
<head>
<title>Hello World</title>
<script type="text/javascript" src="scripts/jquery.js"></script>
<style>/* Stylesheet 1: */




textarea {
 
color: black;
font-size: 15px;
align: center;
}



.button {
   border-top: 1px solid #96d1f8;
   background: #81c1eb;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#81c1eb));
   background: -webkit-linear-gradient(top, #3e779d, #81c1eb);
   background: -moz-linear-gradient(top, #3e779d, #81c1eb);
   background: -ms-linear-gradient(top, #3e779d, #81c1eb);
   background: -o-linear-gradient(top, #3e779d, #81c1eb);

   -webkit-border-radius: 29px;
   -moz-border-radius: 29px;
   border-radius: 29px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 20px;
   font-family: Georgia, Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 300px;
   height: 100px;
   }
.button:hover {
   border-top-color: #28597a;
   background: #28597a;
   color: #ccc;
   }
.button:active {
   border-top-color: #2a4c63;
   background: #2a4c63;
   }
   


body {
    font: 100% Lucida Sans;
    
    
    height: 100%;
}



</style>
</head>
<body style="height: 100%; width:100%;">

<html:form action="welcome" style="height: 100%; width:100%;">
<html:hidden property="crewid" />    
  

<table   style="height:100%; width:100%; " border="0" align="center" cellpadding="1">
	<tr style="background-color: #84c754;">					
		<td style="height:10%; width:100%;" align="center" >
		
			<table   style="height:100%; width:100%; " border="0" align="center" cellpadding="1">
				<tr style="background-color: #84c754;">					
					<td style="height:10%; width:20%;"align="center" >
								Crew ID :    <bean:write name="LoginForm" property="crewid" /> 	
					</td>	
					<td style="height:10%; width:60%;"align="center" >
								<h2>Second Page</h2> 			
					</td>
					<td style="height:10%; width:20%;"align="center" >
								
					</td>		
				</tr>	
			</table>
					
		</td>					
	</tr>	
 	
	<tr>
		<td style="height:60%; width:100%;" valign="middle" align="center" >
			<textarea  id="output"  cols="50" rows="1" style="border:0;  text-align:center;" >Click on the button to start the breath test</textarea>   			
		</td>
	</tr>
				
	<tr>
		<td style="height:30%; width:100%;" align="center" valign="top" >
			<html:button property="method" value="Sign On" styleClass="button" onclick="initiateBio()" />	    			
		</td>	
					
	</tr>

</table>


<script>




window.addEventListener("message", function(ev) {
	 var msg;
	 
	 msg = ev.data.message;
	if(msg.indexOf(":") > -1)
	{
		 alert("You have passed the Breath Test");
		 ev.source.close();
		 document.forms[0].action ="welcome.do?method=ThirdPage";
		 document.forms[0].submit();
		
	}
	else
	{
		alert("Breath Test Failed!");
	}
  
    

});




function initiateBio() {
	
	var calcServcURLValue = 'http://localhost:8080/babio/welcome.do?method=isBAEnabled&callback=?';
	    $.ajax({ 
	            url: calcServcURLValue , 
	            type: 'get',  /* Dont use post it JSONP doesnt support */
	            timeout: 5000,
	            dataType: 'jsonp',
	            
	            success: function(res) {
	             //alert('Yahoo!!!! We got the Response back')
	             //processResponse(res);
	             
	             if(res.data == 'Y')
	            	 window.open("http://localhost:8080/babio/welcome.do?method=initiateBA&crewid="+document.forms[0].crewid.value,"_blank");
	             else
	            	 {
	            	 document.forms[0].action ="welcome.do?method=ThirdPage&crewid=RTM1001";
	    			 document.forms[0].submit();
	            	 }
	            	 
	            	
	          }
	          , 
	            error: function(e , msg){ 
	                processError(e,msg);
	            },
	            complete: function(xhr, data) {
	                if (xhr.status == 0)
	                    alert('fail');
	               
	            }
	    }); 
	 }


function processError(e , msg){
    alert('Call to Service Failed');
}


//The res object you get is a JSON object 
// Since the JSON response is 
// {"totalInterestPmtAmt":5092.79,"totalPmtAmt":15092.79}
//yes the call back method name will 
//be removed by Jquery isn that neat 

function processResponse(res){
    alert('data='+ res.data);
    
}





function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}







</script>


<script>
        
        window.addEventListener("message", function(ev) {
        	  
        	if(ev.data.message == "Verification Complete")
        	{
        		 alert("Verified");
        		 ev.source.close();
        		 document.forms[0].action ="welcome.do?method=thirdPage";
    			 document.forms[0].submit();
        		
        	}
        	else
        	{
        		alert("fail");
        	}
          
            
       
     });

        
        
       
        function callWebService() {
        	///the callback=? the questsion mark will be replace by JQuery with 
        	//some method name like jsonp1337622713385
        	//So when response comes back the response is packed inside this method.
        	//Thats all we did in server side. The callback method name is dynamically 
        	//generated by JQUERY.


        	var calcServcURLValue = 'http://localhost:8080/babio/welcome.do?method=isBAEnabled&callback=?';
        	    $.ajax({ 
        	            url: calcServcURLValue , 
        	            type: 'get',  /* Dont use post it JSONP doesnt support */
        	            timeout: 5000,
        	            dataType: 'jsonp',
        	            
        	            success: function(res) {
        	             //alert('Yahoo!!!! We got the Response back')
        	             //processResponse(res);
        	             
        	            	window.open("http://localhost:8080/babio/welcome.do?method=initiateBA&crewid="+document.forms[0].crewid.value,"_blank");
        	          }
        	          , 
        	            error: function(e , msg){ 
        	                processError(e,msg);
        	            },
        	            complete: function(xhr, data) {
        	                if (xhr.status == 0)
        	                    alert('fail');
        	                else
        	                    alert('success');
        	            }
        	    }); 
        	 }


        	function processError(e , msg){
        	    alert('Call to Service Failed');
        	}


        	//The res object you get is a JSON object 
        	// Since the JSON response is 
        	// {"totalInterestPmtAmt":5092.79,"totalPmtAmt":15092.79}
        	//yes the call back method name will 
        	//be removed by Jquery isn that neat 

        	function processResponse(res){
        	    alert('data='+ res.data);
        	    
        	}

</script>



 </html:form>
</body>
</html>

