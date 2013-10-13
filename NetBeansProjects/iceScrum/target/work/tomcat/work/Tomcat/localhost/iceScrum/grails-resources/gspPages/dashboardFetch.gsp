<div>
              <div class="col-md-1" style="margin-top:5.3%;margin-left:0%">
               
              </div>

                <div class="col-md-7 body-boder projectBox" style="margin-top:5.3%;margin-left:0%; background: black">
                  <h2 align="center"><font style="font-family: cursive ;color: yellow; font-style: oblique" >Dashboard</font></h2>
                     <form>
                       <h4 align="center"><font style="color: wheat" >Assigned Task</font></h4>
                          
                          
                          <div align='center' class="body-boder projectBox" style="background: repeating-radial-gradient">   
                            <div ng-init ="fetchCreatedProject()"></div>
                            <div ng-init ="fetchAssignedTasks()"></div>
                            <div  class="col-md-12" style="margin-bottom: 20%;">



                                            <div ng-repeat="data in ArrayColor1" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #F7819F">
                                                              
                                                                 <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><h4>{{data.projectName}}</h4></b></div>
                                                                      <div class="content" style="color: black"><b>{{data.name}}</b></div>
                                                                      <div class="content" style="color: #0000FF">{{data.desc}}</div><br>
                                                                      <a data-toggle="modal" href="#myModalForEditTask" title="Update" ng-click="FetchDataForUpdateTask(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span> </a>      
                                                                       

                                                            </div>

                                            </div>  
                                            <div ng-repeat="data in ArrayColor2" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #6495ED">
                                                              
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><h4>{{data.projectName}}</h4></b></div>
                                                                      <div class="content" style="color: black"><b>{{data.name}}</b></div>
                                                                      <div class="content" style="color: #0000FF">{{data.desc}}</div><br>
                                                                      <a data-toggle="modal" href="#myModalForEditTask" title="Update" ng-click="FetchDataForUpdateTask(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span> </a> 
                                                            </div>

                                            </div>   
                                             <div ng-repeat="data in ArrayColor3" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #C8FE2E">
                                                                      
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><h4>{{data.projectName}}</h4></b></div>
                                                                      <div class="content" style="color: black"><b>{{data.name}}</b></div>
                                                                      <div class="content" style="color: #0000FF">{{data.desc}}</div><br>
                                                                      <a data-toggle="modal" href="#myModalForEditTask" title="Update" ng-click="FetchDataForUpdateTask(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span> </a> 
                                                            </div>
                                                        <br><br>
                                            </div> 
            
                                     </div>
                          </div>
                      
                    </form>  
              </div>
             
              <div class="col-md-1" style="margin-top:5.3%;margin-left:0%">
                
              </div>
              <div class="col-md-3" style="margin-top:5.3%;margin-left:0%">
              
                 <div align="center"><button data-toggle="modal" href="#myModalForCreateProject" class="css3button" class="btn btn-primary btn-lg">Create Project</button></div><br>
                <div class="body-boder projectBox">
                  <br>
                              <h4 align="center">LIST OF PROJECTS</h4><br>
                             
                                    <div ng-repeat="data in ArrayProject1"> 
                                      
                                      &nbsp;&nbsp;<a data-toggle="modal" href="#myModalForUpdateProject" title="Update" ng-click="FetchDataForUpdateProject(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span> </a> 
                                      &nbsp;<a href="#/releaseBoard/{{data.id}}/{{data.name}}"><b style="color: #F7819F">{{data.name}}</b></a> ( {{data.startDate}} &nbsp; - &nbsp;{{data.endDate}}) 
                                                                               
                                    </div> 
                                    <div ng-repeat="data in ArrayProject2">                                                                
                                      &nbsp;&nbsp;<a data-toggle="modal" href="#myModalForUpdateProject" title="Update" ng-click="FetchDataForUpdateProject(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span> </a> 
                                      &nbsp;<a href="#/releaseBoard/{{data.id}}/{{data.name}}"><b style="color: #6495ED">{{data.name}}</b></a> ( {{data.startDate}} &nbsp; - &nbsp;{{data.endDate}}) 
                        
                                                                           
                                    </div> 
                                    <div ng-repeat="data in ArrayProject3">                                                                
                                      &nbsp;&nbsp;<a data-toggle="modal" href="#myModalForUpdateProject" title="Update" ng-click="FetchDataForUpdateProject(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span> </a> 
                                      &nbsp;<a href="#/releaseBoard/{{data.id}}/{{data.name}}"><b style="color: #C8FE2E">{{data.name}}</b></a> ( {{data.startDate}} &nbsp; - &nbsp;{{data.endDate}}) 
                                                                             
                                    </div> 
                              <br>
                              
                </div>

             </div>
</div>





<!----------------------------------------MODEL HERE ------------------------------------------------------------------  -->
<!-- project creation -----------------------------------------------------   -->
<div class="modal fade" id="myModalForCreateProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Create Project</h4></center></p></h4>
        </div>
        
    
        <div class="modal-body">
          <form ng-submit="saveProject()">

                    <input type="text" ng-model="projectName" class="form-control" placeholder="Project Name*"  required="" autofocus><br>

                    <textarea rows="5" cols="40" ng-model="projectDescription" class="form-control" placeholder="Description*" required="" ></textarea><br>

                    <label>Status </label><br>
                           <select  ng-model="projectStatus" class="form-control"  required="">
                                  <option value="Started">Started</option>
                          </select>
                    <br>
                                          
                    <label>Start Date </label><br>
                    <input type ="date" id="startdate" ng-model="projectStartDate" class="form-control" ng-model="projectStartDate" required=""><br>

                    <label>End Date </label><br>
                    <input type ="date" id="enddate" ng-model="projectEndDate" class="form-control" ng-model="projectEndDate" required="" onblur="validateEndDate()" onchange="validateEndDate()" ><br>
                        
                    
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary"> Save </button>
                    
	  </form>
        </div>
	

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  
  
<!-- Task edit which is assigned to this user   -----------------------------------------------------   -->
<div class="modal fade" id="myModalForEditTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Update Task</h4></center></p></h4>
        </div>
             
                  <div class="modal-body">

                    <form ng-submit="updateTask()">
                      
                      <input type="hidden" ng-model="taskId">
                      <label>Task Name </label><br>
                      <input type="text" readonly="true" ng-model="taskName" class="form-control"><br>

                      <label>Description</label><br>
                      <textarea rows="3" cols="30" readonly="true" ng-model="taskDescription" class="form-control"></textarea><br>
                       
                      <label>Status </label><br>
                        
                      <select ng-model="taskStatus" class="form-control"  required="">
                                         
                          <option ng-repeat="items in myTaskStatusCheckArray" value="{{items}}">{{items}}</option>
                                            
                      </select>


                      <label>Start Date </label><br>
                      <input type ="date" id="startdate" readonly="true" ng-model="taskStartDate" class="form-control"><br>

                      <label>End Date </label><br>
                      <input type ="date" id="enddate" ng-model="taskEndDate" class="form-control" required=""><br>

                  </div>
        
          <div class="modal-footer">
            <button type="button" class="btn btn-default" ng-model="cancel" data-dismiss="modal">Close</button>
            <button class="btn btn-sm btn-primary" type="submit">Update</button>
         </form> 
      </div>
	

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  
  
  
<!-- project update -----------------------------------------------------   -->
<div class="modal fade" id="myModalForUpdateProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Update Project</h4></center></p></h4>
        </div>
        
    
        <div class="modal-body">
          

                    <form ng-submit="updateProject()">
                                          
                                          <input type="hidden" ng-model="projectId">
                                          <label>Project Name </label><br>
                                          <input type="text" ng-model="projectName" class="form-control" placeholder="Project Name*"  required="" autofocus><br>
                                      
                                          <label>Description </label><br>
                                          <input type="text" ng-model="projectDescription" class="form-control" placeholder="Description*" required="" ><br>
 
                                          <label>Start Date </label><br>
                                          <input type ="date" id="startdate" readonly="true" ng-model="projectStartDate" class="form-control" ng-model="projectStartDate" required=""><br>

                                          <label>End Date </label><br>
                                          <input type ="date" id="enddate" ng-model="projectEndDate" class="form-control" ng-model="projectEndDate" required="" onchange="validateEndDate()"><br>

                        
                    
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary"> Update </button>
                    
	  </form>
        </div>
	

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->