<!DOCTYPE html>
<html data-ng-app="iceScrumApp">
  <head>
    <title>SCRUM MASTER</title>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<link href="bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet"></link>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    
  
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
    <!--linking with angular file -->
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script>
    <script src="http://code.angularjs.org/1.2.0-rc.2/angular-animate.min.js"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'datepicker.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-datepicker.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'commonDivStyle.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'jquery-2.0.3.js')}"></script>
    <script src="${resource(dir: 'js', file: 'datepicker.js')}"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.js')}"></script>

    
    <style>
.blue {
    color: blue;
}

  p {font-style: italic}

.divBox {
    width:10em;
    height:10em;
    
    overflow:hidden;
    
    box-shadow:4px 4px 8px #1c1c1c;
    -webkit-box-shadow:4px 4px 8px #1c1c1c;
    -moz-box-shadow:4px 4px 8px #1c1c1c;
    -o-box-shadow:4px 4px 8px #1c1c1c;}

.divBoxForBacklog{
    width:8em;
    height:8em;
    
    overflow:hidden;
    
    box-shadow:4px 4px 8px #1c1c1c;
    -webkit-box-shadow:4px 4px 8px #1c1c1c;
    -moz-box-shadow:4px 4px 8px #1c1c1c;
    -o-box-shadow:4px 4px 8px #1c1c1c;}

.projectBox {
    overflow:hidden;
    
    box-shadow:4px 4px 8px #1c1c1c;
    -webkit-box-shadow:4px 4px 8px #1c1c1c;
    -moz-box-shadow:4px 4px 8px #1c1c1c;
    -o-box-shadow:4px 4px 8px #1c1c1c;}

button.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #123d54;
	padding: 10px 20px;
	background: -moz-linear-gradient(
		top,
		#afd9fa 0%,
		#588fad);
	background: -webkit-gradient(
		linear, left top, left bottom, 
		from(#afd9fa),
		to(#588fad));
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #003366;
	-moz-box-shadow:
		0px 1px 3px rgba(000,000,000,0.5),
		inset 0px 0px 1px rgba(255,255,255,1);
	-webkit-box-shadow:
		0px 1px 3px rgba(000,000,000,0.5),
		inset 0px 0px 1px rgba(255,255,255,1);
	box-shadow:
		0px 1px 3px rgba(000,000,000,0.5),
		inset 0px 0px 1px rgba(255,255,255,1);
	text-shadow:
		0px -1px 0px rgba(000,000,000,0.7),
		0px 1px 0px rgba(255,255,255,0.3);
}



</style>

  </head>

  <body>

    <!-- for user authentication-->
 <input type="hidden" id="token" value="${params.sessionToken}"/> 

    <!-- Header Part Start here-->
    <div class="wrapper" style="margin-top:0%;margin-left:0%">
      <div class="container pull-left" ><label class="newStyle">Hi ${params.username}</label></div>
      <div class="container pull-left" ><h3 style="color:white"></h3>
      </div>
      <div class="container pull-right" style="margin-right:-1.2%">
        <ul class="menu" >
         <form class="navbar-form navbar-left" role="search">
           <div class="form-group">
              <input type="text" class="form-control" placeholder="Search">
            </div>
          </form> 
          <li id="bar4"><a href="#/dashboardFetch"><button type="button" class="btn btn-link" style="color:#1CE62A;">My Dashboard</button></a></li>
          <li id="bar2"><a href="#/myAccount/${params.username}/${params.email}"><button type="button" class="btn btn-link" style="color:#1CE62A;">My Account</button></a></li>
          <li id="bar3"><a href="http://localhost:8080/iceScrum/users/signOut?token=${params.sessionToken}"><button type="button" class="btn btn-link" style="color:#1CE62A;"><i class="icon-white icon-off">Log Out</i></button></a></li>
        </ul>
        </div>
    </div> 
     <!-- Header Part End here-->

    <br><br><br>

    <!-- Changing DIV -->    

    <div ng-view></div>
<!-- Route configuration -->
      <script> 
         var scrumApp = angular.module("iceScrumApp", []);          
         scrumApp.config(function ($routeProvider){
                $routeProvider
                
                // view and controller mapping for updateAccount---------------------------
                .when('/myAccount/:username/:email',
                {   
                    controller: 'myAccountController',
                    templateUrl: "${resource(dir: 'gspPages', file: 'myAccount.gsp')}"
                })
                
                
                // new UI is start from here  -----------------------------------------------------
                // for dashboard controller-----------------------------------------------------    
                // view and controller mapping for Dashboard----------------------------------
                .when('/dashboardFetch',
                {   
                    controller: 'dashboardController',
                    templateUrl: "${resource(dir: 'gspPages', file: 'dashboardFetch.gsp')}"
                })
                
                .when('/releaseBoard/:projectId/:projectName',
                {   
                    controller: 'releaseBoardController',
                    templateUrl: "${resource(dir: 'gspPages', file: 'releaseBoard.gsp')}"
                })
                .when('/sprintBoard/:releaseId/:releaseName/:projectId/:projectName',
                {   
                    controller: 'sprintBoardController',
                    templateUrl: "${resource(dir: 'gspPages', file: 'sprintBoard.gsp')}"
                })
                .when('/taskBoard/:sprintId/:sprintName/:releaseId/:releaseName/:projectId/:projectName',
                {   
                    controller: 'taskBoardController',
                    templateUrl: "${resource(dir: 'gspPages', file: 'taskBoard.gsp')}"
                })
                               
                // default page load 
                .otherwise( {redirectTo: '/dashboardFetch'} );
            }
        );
 
 
          // angular js controller----------------------------------------------------------->
          
         
          
            //myAccount controller for user
            function myAccountController($routeParams,$scope,$http){
              
                 var sessionToken = document.getElementById("token")
                 this.params = $routeParams;
                 $scope.username = this.params.username
                  $scope.email = this.params.email
                 $scope.changepassword=function(){
                         var temp = '{token='+sessionToken.value+',oldpassword='+$scope.old+',newpassword='+$scope.news+'}'
                
                       $http.post("http://localhost:8080/iceScrum/updateProfile",temp).success(function(data,status,headers,config){
                                    alert(data.response.status);
                        }).error(function(data,status,headers,config){
                                        alert("Data is not valid !!!!!!!")
                        });
                        
                  } 
                          

            }

            // new controller ---------------------------------------------------------------------------------------
            //dashboard controller for fetch and save and update the data on server
            function dashboardController($location,$routeParams,$scope,$http){
                 
                 var sessionToken = document.getElementById("token")
             
                 var newArrayColor1 = new Array();
                 var newArrayColor2 = new Array();
                 var newArrayColor3 = new Array();
          
                 var count1 = 0
                 var count2 = 0
                 var count3 = 0
                 
                 
                 // fetch all the tasks which are assigned to this perticular user ----------
                 $scope.fetchAssignedTasks = function() {
                       
                     
                       $http.get("http://localhost:8080/iceScrum/dashboardGetAssignTask", {
                                          params: { token: sessionToken.value  }
                        }).success(function(data,status,headers,config){
                               
                                      
                               if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i],"projectName":data.response.projectName[i]};
                                            newArrayColor1[count1++]= temp
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i],"projectName":data.response.projectName[i]};
                                            newArrayColor2[count2++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i],"projectName":data.response.projectName[i]};
                                            newArrayColor3[count3++]= temp
                                         }
                                               
                                     }
                                     
                                     $scope.ArrayColor1 = newArrayColor1
                                     $scope.ArrayColor2 = newArrayColor2
                                     $scope.ArrayColor3 = newArrayColor3
                                   
                                 }
             
            
                        }).error(function(data,status,headers,config){
                                        alert("fetching error in assigned task list")
                        });

                     }
                     
                     
                     
                    var projectsName1 = new Array();
                    var projectsName2 = new Array();
                    var projectsName3 = new Array();

                    var count4 = 0
                    var count5 = 0
                    var count6 = 0
                     
                     
                     // fetch all created project for specific user ----------------------            
                    $scope.fetchCreatedProject = function() {
                      
                    
                       $http.get("http://localhost:8080/iceScrum/dashboardGetCreatedProject", {
                                          params: { token: sessionToken.value  }
                        }).success(function(data,status,headers,config){
                               
                                       
                               if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"desc": data.response.description[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName1[count4++]= temp
                                            
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"desc": data.response.description[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName2[count5++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"desc": data.response.description[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName3[count6++]= temp
                                         }
                                               
                                     }
                                    
                                     $scope.ArrayProject1 = projectsName1
                                     $scope.ArrayProject2 = projectsName2
                                     $scope.ArrayProject3 = projectsName3
                                   
                                 }
             
            
                        }).error(function(data,status,headers,config){
                                        alert("fetching error in project list")
                        });

                     }
                     
                    
                     // save the project for this user who is manager of this project --------------
                     $scope.projectStatus = "Started"
                     $scope.saveProject = function() {
                      
                        var temp = '{token='+sessionToken.value+',name='+$scope.projectName+',description='+$scope.projectDescription+',status='+$scope.projectStatus+',startdate='+$scope.projectStartDate+',enddate='+$scope.projectEndDate+'}'

                       $http.post("http://localhost:8080/iceScrum/project",temp).success(function(data,status,headers,config){
                                    alert(data.response.status)
                                    if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }

                        }).error(function(data,status,headers,config){
                                        alert("Data is not valid !!!!!!!")
                        });
                        
                  } 
    
                         
   
                  // first fetch the data for update the project   --------------------------------------------------  
                  $scope.FetchDataForUpdateProject = function(project_id,name,desc,startDate,endDate) {
                    
                    $scope.projectId = project_id
                    $scope.projectName = name
                    $scope.projectDescription = desc
                    $scope.projectStartDate = startDate
                    $scope.projectEndDate = endDate
          
                  } 
   
                  // update the project which are created by this perticular user      --------------------------
                  $scope.updateProject = function() {
                      
                       
                       var temp = '{token='+sessionToken.value+',project_id='+$scope.projectId+',name='+$scope.projectName+',description='+$scope.projectDescription+',startdate='+$scope.projectStartDate+',enddate='+$scope.projectEndDate+'}'
                        
                       
                       $http.put("http://localhost:8080/iceScrum/project",temp).success(function(data,status,headers,config){
                         
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                                          
                              }).error(function(data,status,headers,config){
                                              alert("Error"+data)
                              });
                        
                  } 
                   
                  
                  // first fetch the data for update the task which are assigned to this perticular user   --------------------------------------------------  
                  
                  $scope.FetchDataForUpdateTask = function(task_id,name,desc,startDate,endDate) {         
                    var taskStatusArray = new Array();
                    $scope.taskId = task_id
                    $scope.taskName = name
                    $scope.taskDescription = desc
                    $scope.taskStartDate = startDate
                    $scope.taskEndDate = endDate
                    //check the task status ----------------------------------------------
                     $http.get("http://localhost:8080/iceScrum/dashboardGetTaskStatus", {
                                          params: { token: sessionToken.value , tid: task_id }
                        }).success(function(data,status,headers,config){
                               
                                       
                               if( data.response.code == 200)
                                 {
                                     
                                      if(data.response.taskStatus == "Started")
                                      {
                                        $scope.taskStatus = "Started"
                                        taskStatusArray[0] = "Started"
                                        taskStatusArray[1] = "In Progress"
                                      }
                                      else if(data.response.taskStatus == "In Progress")
                                      {
                                        $scope.taskStatus = "In Progress"
                                        taskStatusArray[0] = "In Progress"
                                        taskStatusArray[1] = "Completed"
                                      }
                                      else if(data.response.taskStatus == "Completed")
                                      {
                                        $scope.taskStatus = "Completed"
                                        taskStatusArray[0] = "Completed"
                                      }
                                   
                                   $scope.myTaskStatusCheckArray = taskStatusArray
                                 }
             
                               
            
                        }).error(function(data,status,headers,config){
                                        alert("fetching error for task status")
                        });
          
          
                  } 
                  
                   // update the task which are assigned to this user who is logg on      -------------------------
                  $scope.updateTask = function() {
           
                     var temp = '{token='+sessionToken.value+',task_id='+$scope.taskId+',status='+$scope.taskStatus+',enddate='+$scope.taskEndDate+'}'

                       $http.put("http://localhost:8080/iceScrum/dashboardUpdateAssignedTask",temp).success(function(data,status,headers,config){
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("Error hai kya ")
                        });
                        
                  } 
                  
     
                }
                
                
                
                 // new one     
                // releaseBoard controller ------------------------------------------------
                function releaseBoardController($location,$routeParams,$scope,$http){
                 
                 var sessionToken = document.getElementById("token")
             
                 this.params = $routeParams;
                 var project_id = this.params.projectId 
                 $scope.projectNAME =this.params.projectName
                 $scope.projectID = project_id
                 
                 var newArrayColor1 = new Array();
                 var newArrayColor2 = new Array();
                 var newArrayColor3 = new Array();
          
                 var count1 = 0
                 var count2 = 0
                 var count3 = 0
                 
                 
                 // fetch all the releases which are created by this perticular user ----------
                 $scope.fetchCreatedReleases = function() {
                       
                            $http.get("http://localhost:8080/iceScrum/release", {
                                               params: { token: sessionToken.value , pid: project_id }
                           }).success(function(data,status,headers,config){

                                 if( data.response.code == 200)
                                 {
                                   
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            newArrayColor1[count1++]= temp
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            newArrayColor2[count2++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            newArrayColor3[count3++]= temp
                                         }
                                               
                                     }
                                     
                                     $scope.ArrayColor1 = newArrayColor1
                                     $scope.ArrayColor2 = newArrayColor2
                                     $scope.ArrayColor3 = newArrayColor3
                                   
                                 }
                                  
             
                            }).error(function(data,status,headers,config){
                                             alert("fetching error")

                            });

                       
                     }
    
                    var projectsName1 = new Array();
                    var projectsName2 = new Array();
                    var projectsName3 = new Array();

                    var count4 = 0
                    var count5 = 0
                    var count6 = 0
                     
                    // fetch all created project for specific user ----------------------            
                    $scope.fetchCreatedProject = function() {
                      
                    
                       $http.get("http://localhost:8080/iceScrum/dashboardGetCreatedProject", {
                                          params: { token: sessionToken.value  }
                        }).success(function(data,status,headers,config){
                               
                                       
                               if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName1[count4++]= temp
                                            
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName2[count5++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName3[count6++]= temp
                                         }
                                               
                                     }
                                    
                                     $scope.ArrayProject1 = projectsName1
                                     $scope.ArrayProject2 = projectsName2
                                     $scope.ArrayProject3 = projectsName3
                                   
                                 }
             
            
                        }).error(function(data,status,headers,config){
                                        alert("fetching error in project list")
                        });

                     }
                     
                    
                     // save the release for this user who is manager of this project --------------
                     $scope.releaseStatus = "Started"
                     $scope.saveRelease = function() {
                         
                       var temp = '{token='+sessionToken.value+',pid='+project_id+',name='+$scope.releaseName+',descripition='+$scope.releaseDescription+',status='+$scope.releaseStatus+',startdate='+$scope.releaseStartDate+',enddate='+$scope.releaseEndDate+'}'

                       $http.post("http://localhost:8080/iceScrum/release",temp).success(function(data,status,headers,config){
                                    alert(data.response.status)
                                    if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                                   
                        }).error(function(data,status,headers,config){
                                        alert("Data is not valid !!!!!!!")
                        });
                        
                  }
                                 
                  
                   // first fetch the data for update the release   --------------------------------------------------  
                  $scope.FetchDataForUpdateRelease = function(release_id,name,desc,startDate,endDate) {
                    
                    $scope.releaseId = release_id
                    $scope.releaseName = name
                    $scope.releaseDescription = desc
                    $scope.releaseStartDate = startDate
                    $scope.releaseEndDate = endDate
          
                  } 
   
                  // update the release which are created by this perticular user      --------------------------
                   $scope.updateRelease = function() {
                      
                    
                       var temp = '{token='+sessionToken.value+',rid='+$scope.releaseId+',name='+$scope.releaseName+',description='+$scope.releaseDescription+',startdate='+$scope.releaseStartDate+',enddate='+$scope.releaseEndDate+'}'

                       $http.put("http://localhost:8080/iceScrum/release",temp).success(function(data,status,headers,config){
                                    alert(data.response.status)
                                    if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("client side error !!!!!!!")
                        });
                        
                  }   
                   
                   
                   
                }
           
 
               // sprintboard controller -------------------------------------------------------
                function sprintBoardController($location,$routeParams,$scope,$http){
                 
                 var sessionToken = document.getElementById("token")
             
                 this.params = $routeParams;
                 var project_id = this.params.projectId 
                 var release_id = this.params.releaseId
                 $scope.projectNAME =this.params.projectName
                 $scope.releaseNAME =this.params.releaseName
                 $scope.projectID = project_id
                 $scope.releaseID = release_id
                
                 var newArrayColor1 = new Array();
                 var newArrayColor2 = new Array();
                 var newArrayColor3 = new Array();
          
                 var count1 = 0
                 var count2 = 0
                 var count3 = 0
                 
                 
                 // fetch all the sprints which are created by this perticular user ----------
                 $scope.fetchCreatedSprints = function() {
                       
                        $http.get("http://localhost:8080/iceScrum/sprint", {
                                               params: { token: sessionToken.value , rid: release_id }
                           }).success(function(data,status,headers,config){
 
                                
                                 if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            newArrayColor1[count1++]= temp
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            newArrayColor2[count2++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            newArrayColor3[count3++]= temp
                                         }
                                               
                                     }
                                     
                                     
                                     $scope.ArrayColor1 = newArrayColor1
                                     $scope.ArrayColor2 = newArrayColor2
                                     $scope.ArrayColor3 = newArrayColor3
                                   
                                 }
                                       
                            }).error(function(data,status,headers,config){
                                             alert("Fetching error")

                            });

                       
                     }
    
                    var projectsName1 = new Array();
                    var projectsName2 = new Array();
                    var projectsName3 = new Array();

                    var count4 = 0
                    var count5 = 0
                    var count6 = 0
                    // fetch all created project for specific user ----------------------            
                    $scope.fetchCreatedProject = function() {
                      
                    
                       $http.get("http://localhost:8080/iceScrum/dashboardGetCreatedProject", {
                                          params: { token: sessionToken.value  }
                        }).success(function(data,status,headers,config){
                               
                                       
                               if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                         if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName1[count4++]= temp
                                            
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName2[count5++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName3[count6++]= temp
                                         }
                                               
                                     }
                                    
                                     $scope.ArrayProject1 = projectsName1
                                     $scope.ArrayProject2 = projectsName2
                                     $scope.ArrayProject3 = projectsName3
                                   
                                 }
             
            
                        }).error(function(data,status,headers,config){
                                        alert("fetching error in project list")
                        });

                     }
                     
                    
                     // save the sprint for this user who is manager of this project --------------
                     $scope.sprintStatus = "Started"
                     $scope.saveSprint = function() {
                      
                     
                       var temp = '{token='+sessionToken.value+',rid='+release_id+',name='+$scope.sprintName+',description='+$scope.sprintDescription+',status='+$scope.sprintStatus+',startdate='+$scope.sprintStartDate+',enddate='+$scope.sprintEndDate+'}'

                       $http.post("http://localhost:8080/iceScrum/sprint",temp).success(function(data,status,headers,config){
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {                                        
                                        location.reload()                                      
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("Data is not valid !!!!!!!")
                        });
                        
                    } 
                    
                    
                    
                    
                    
                  // first fetch the data for update the sprint   --------------------------------------------------  
                  $scope.FetchDataForUpdateSprint = function(sprint_id,name,desc,startDate,endDate) {
                    
                    $scope.sprintId = sprint_id
                    $scope.sprintName = name
                    $scope.sprintDescription = desc
                    $scope.sprintStartDate = startDate
                    $scope.sprintEndDate = endDate
          
                  } 
   
                  // update the sprint which are created by this perticular user      --------------------------
                   
                   $scope.updateSprint = function() {
                      
                      
                       var temp = '{token='+sessionToken.value+',sid='+$scope.sprintId+',name='+$scope.sprintName+',description='+$scope.sprintDescription+',startdate='+$scope.sprintStartDate+',enddate='+$scope.sprintEndDate+'}'

                       $http.put("http://localhost:8080/iceScrum/sprint",temp).success(function(data,status,headers,config){
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("client side error !!!!!!!")
                        });
                        
                  }     
             
             
                  
                       // save the backlog for specific release and project
                       $scope.saveBacklog = function() {
                      
                      
                       var temp = '{token='+sessionToken.value+',project_id='+project_id+',release_id='+release_id+',name='+$scope.backlogName+',description='+$scope.backlogDescription+'}'

                       $http.post("http://localhost:8080/iceScrum/backlog",temp).success(function(data,status,headers,config){
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("Error")
                        });
                        
                    }  
                    
                    var BacklogAssigned = new Array();
                    var BacklogNotAssigned = new Array();
                    var countBacklog1 = 0
                    var countBacklog2 = 0
                     // fetch the backlog according to specific release and project
                   $scope.fetchBacklogs= function(){
                         
                           $http.get("http://localhost:8080/iceScrum/backlog", {
                                               params: { token: sessionToken.value , project_id: project_id , release_id:release_id}
                           }).success(function(data,status,headers,config){
                                            if(data.response.code == 200)
                                            {
                                                 for(var i=0 ; i < data.response.id.length ; i++)
                                                 {
                                                        if( data.response.assignedSprint[i] == "NULL")
                                                        {

                                                           var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"assignedSprint":data.response.assignedSprint[i]};
                                                           BacklogNotAssigned[countBacklog1++]= temp

                                                        }
                                                        else
                                                        {
                                                           var temp = {"id": data.response.id[i] , "name":data.response.name[i],"desc": data.response.description[i],"assignedSprint":data.response.assignedSprint[i]};
                                                           BacklogAssigned[countBacklog2++]= temp
                                                        }
                                                 }
                                                 
                                                 $scope.BacklogArrayColor1 = BacklogAssigned
                                                 $scope.BacklogArrayColor2 = BacklogNotAssigned
                                                   
                                            }
                                        
                                       
                            }).error(function(data,status,headers,config){
                                             alert("Error"+data)

                            });

                       } 
             
                   
               }
            
            
              //taskboard controller -------------------------------------------------------------------
               function taskBoardController($location,$routeParams,$scope,$http){
                 
                 var sessionToken = document.getElementById("token")
             
                 this.params = $routeParams;
                 var project_id = this.params.projectId 
                 var release_id = this.params.releaseId
                 var sprint_id = this.params.sprintId
                 $scope.projectNAME =this.params.projectName
                 $scope.releaseNAME =this.params.releaseName
                 $scope.sprintNAME =this.params.sprintName
                 $scope.projectID = project_id
                 $scope.releaseID = release_id
                 $scope.sprintID = sprint_id
                
                 var newArrayColor1 = new Array();
                 var newArrayColor2 = new Array();
                 var newArrayColor3 = new Array();
          
                 var count1 = 0
                 var count2 = 0
                 var count3 = 0
                 
                 
                 // fetch all the tasks which are created by this perticular user ----------
                 $scope.fetchCreatedTasks = function() {
                       $http.get("http://localhost:8080/iceScrum/task", {
                                               params: { token: sessionToken.value , sid: sprint_id }
                           }).success(function(data,status,headers,config){

                                 if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"desc": data.response.description[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i],"assignTo":data.response.assignTo[i],"backlog":data.response.backlog[i]};
                                            newArrayColor1[count1++]= temp
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"desc": data.response.description[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i],"assignTo":data.response.assignTo[i],"backlog":data.response.backlog[i]};
                                            newArrayColor2[count2++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"desc": data.response.description[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i],"assignTo":data.response.assignTo[i],"backlog":data.response.backlog[i]};
                                            newArrayColor3[count3++]= temp
                                         }
                                               
                                     }
                                     
                                     
                                     $scope.ArrayColor1 = newArrayColor1
                                     $scope.ArrayColor2 = newArrayColor2
                                     $scope.ArrayColor3 = newArrayColor3
                                   
                                 }
                                       
                            }).error(function(data,status,headers,config){
                                             alert("Fetching Error")

                            });

                       
                     }
                     
                    var projectsName1 = new Array();
                    var projectsName2 = new Array();
                    var projectsName3 = new Array();

                    var count4 = 0
                    var count5 = 0
                    var count6 = 0
                    
                    // fetch all created project for specific user ----------------------            
                    $scope.fetchCreatedProject = function() {
                      
                    
                       $http.get("http://localhost:8080/iceScrum/dashboardGetCreatedProject", {
                                          params: { token: sessionToken.value  }
                        }).success(function(data,status,headers,config){
                               
                                       
                               if( data.response.code == 200)
                                 {
                                     
                                     for(var i=0 ; i < data.response.id.length ; i++)
                                     {
                                        if( data.response.status[i] == "Started")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName1[count4++]= temp
                                            
                                         }
                                         else if( data.response.status[i] == "In Progress")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName2[count5++]= temp
                                         }
                                         else if( data.response.status[i] == "Completed")
                                         {
                                            
                                            var temp = {"id": data.response.id[i] , "name":data.response.name[i],"status":data.response.status[i],"startDate":data.response.dateCreated[i],"endDate":data.response.endDate[i],"updateDate":data.response.lastUpdated[i]};
                                            projectsName3[count6++]= temp
                                         }
                                               
                                     }
                                    
                                     $scope.ArrayProject1 = projectsName1
                                     $scope.ArrayProject2 = projectsName2
                                     $scope.ArrayProject3 = projectsName3
                                   
                                 }
             
            
                        }).error(function(data,status,headers,config){
                                        alert("fetching error in project list")
                        });

                     }
                     
                    
                     // fetch all registered users for assign the task      
                  $scope.fetchUsers= function(){
                           
                           $http.get("http://localhost:8080/iceScrum/user", {
                                               params: { token: sessionToken.value}
                           }).success(function(data,status,headers,config){
                                         
                                        $scope.usersArray = data
                                       
                            }).error(function(data,status,headers,config){
                             
                                             alert("Fetching Error")

                            });

                       }  
                       
                
                  
                  
                  // fetch all backlogs for this perticular project and add this backlog to task
                  $scope.fetchBacklogs= function(){
                           
                           $http.get("http://localhost:8080/iceScrum/backlog", {
                                               params: { token: sessionToken.value , pid: project_id}
                           }).success(function(data,status,headers,config){
                                         
                                        $scope.backlogsArray = data
                                       
                            }).error(function(data,status,headers,config){
                             
                                             alert("Fetching Error")

                            });

                   }  
                       
                 // save the task data on the server
                  $scope.taskStatus = "Started"
                  $scope.saveTask = function() {
                      
                      
                     var temp = '{token='+sessionToken.value+',sid='+sprint_id+',name='+$scope.taskName+',description='+$scope.taskDescription+',status='+$scope.taskStatus+',startdate='+$scope.taskStartDate+',enddate='+$scope.taskEndDate+',backlog='+$scope.taskBacklogs+',user='+$scope.taskUsers+'}'

                       $http.post("http://localhost:8080/iceScrum/task",temp).success(function(data,status,headers,config){
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("Error in save ")
                        });
                        
                  } 
                  
                  
                  
                  // first fetch the data for update the Task   --------------------------------------------------  
                  $scope.FetchDataForUpdateTask = function(task_id,name,desc,startDate,endDate,assignTo,backlogName) {
                    
                    $scope.taskId = task_id
                    $scope.taskName = name
                    $scope.taskDescription = desc
                    $scope.taskStartDate = startDate
                    $scope.taskEndDate = endDate
                    $scope.prevAssign = assignTo
                    $scope.prevBacklog = backlogName

                  } 
   
                  // update the task which are created by this perticular user      --------------------------
                  $scope.updateTask = function() {
                      
                       var temp = '{token='+sessionToken.value+',tid='+$scope.taskId+',name='+$scope.taskName+',description='+$scope.taskDescription+',startdate='+$scope.taskStartDate+',enddate='+$scope.taskEndDate+',backlog='+$scope.taskBacklogs+',user='+$scope.taskUsers+'}'
                      
                       $http.put("http://localhost:8080/iceScrum/task",temp).success(function(data,status,headers,config){
                                      alert(data.response.status)
                                      if(data.response.code == 200)
                                      {
                                        
                                        location.reload()
                                          
                                      }
                        }).error(function(data,status,headers,config){
                                        alert("Error yo ")
                        });
                        
                  } 
                
                   
                }
      
      </script>  
       
     
    </body>
</html>