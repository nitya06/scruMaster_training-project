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
  $(function() {
    $( "#dialog" ).dialog();
  });
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
    <nav class="navbar navbar-default" role="navigation">
               <div class="collapse navbar-collapse navbar-ex1-collapse">
    
                  <ul class="nav navbar-nav navbar-right"> 

                            
                                             
                  </ul>
  
               </div><!-- /.navbar-collapse -->
         </nav>
      
    </div>
 </div>   
<div id="dialog" title="Enter the New Password">
<p>
  <g:form controller="Users" method="post" action="setPassword">
    <input type ="password" placeholder="Enter New password" name="new_password"><br><br>
    <input type="hidden" name="email" value="${email}"/>
    <input type="submit" value="Reset Password">
  </g:form>
</p>
</div>


<div class="container">

   <div class="row">
   
       <!--  <img src="${resource(dir: 'images', file: '1.jpg')}" alt="Grails" class="img-responsive"/> -->
         <div class='flash'> <center>${flash.message}</center></div>
         
    </div>
 </div>   





<!--<div class="container">

   <div class="row">
 
         <img src="${resource(dir: 'images', file: '1.jpg')}" alt="Grails" class="img-responsive"/>
         
      
    </div>
 </div>  -->



</div>

</body>
</html>