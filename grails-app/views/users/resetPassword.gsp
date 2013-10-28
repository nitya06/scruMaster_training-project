<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8" />
<title>Reset Password</title>

<!-- jquery configuration -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />

<!-- bootstrap configuration -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css">
    

    <!--linking with separate iceScrum.js file -->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'iceScrum.js')}"></script>
   
    <!--linking with separate iceScrum.css file -->    
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'iceScrum.css')}" type="text/css">

<style type="text/css">
    <!--  overridding some properties in bootstrap -->
    
    .nav{
      background-color: #00FFFF;
    } 
    .navbar{
      background-color: #00FFFF;
    } 
</style>


<script>
$(function() {
$( "#dialog1" ).dialog({
autoOpen: false,
show: {
effect: "blind",
duration: 1000
},
hide: {
effect: "explode",
duration: 1000
}
});
$( "#opener1" ).click(function() {
$( "#dialog1" ).dialog( "open" );
});
});

$(function() {
$( "#dialog2" ).dialog({
autoOpen: false,
show: {
effect: "blind",
duration: 1000
},
hide: {
effect: "explode",
duration: 1000
}
});
$( "#opener2" ).click(function() {
$( "#dialog2" ).dialog( "open" );
});
});
</script>

<script>
 function isPasswordValid()
{
  var k=document.getElementById("signUpPassword").value;
  if(k!='')
   {
  if(k.length<6)
    {
      document.getElementById("errorForInvalidPassword").innerHTML= "Password should be atleast 6 characters";
      $('#signUpPassword').css('background-color', 'white');
       document.getElementById("signUpPassword").value=""
         
    }
    else
      document.getElementById("errorForInvalidPassword").innerHTML= "";
   }
}
</script>


<script type="text/javascript" >
 $(document).ready(function(){
  setTimeout(function(){
  $(".flash").fadeOut("slow", function () {
  $(".flash").remove();
      }); }, 2000);
 });
</script>



<style type="text/css">
    .flash{
width:759px;
padding-top:8px;
padding-bottom:8px;
background-color: #fff;
font-weight:bold;
font-size:20px;-moz-border-radius: 6px;-webkit-border-radius: 6px;

}
</style>



</head>
<body>
  
<br>

<div class="container">
      <div class="row">
        <nav class="navbar navbar-default" role="navigation" style="background-color: #3B5998">
          <div class="collapse navbar-collapse navbar-ex1-collapse">

            <ul class="nav navbar-nav navbar-right"> 

            </ul>

          </div><!-- /.navbar-collapse -->
        </nav>

      </div>
    </div>   
    <br><br><br>
<center>
<p>
<h3><center>Enter New Password </center></h3> <br><br>
  <g:form controller="Users" method="post" action="setPassword">
    <input type="password" name="new_password" id="signUpPassword" placeholder=" &nbsp;  Password*" onblur="isPasswordValid()">
          <h5 id="errorForInvalidPassword" style="color:red"></h5><br>
          <div id="lblPasswordError" class="alert alert-info" style="display:none"></div>
          <input type="password" id="signUpConfirmPassword" placeholder=" &nbsp;  Confirm Password*" required="true"><br><br>
    <input type="hidden" name="email" value="${email}"/>
    <input type="submit" value="Reset">
  </g:form>
</p>
</center>

<div class="container">

   <div class="row">
       
    </div>
 </div>
</body>
</html>