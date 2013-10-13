<div>
              <div class="col-md-1" style="margin-top:5.3%;margin-left:0%">
               
              </div>
              <div class="col-md-7" class="body-boder projectBox" style="margin-top:5.3%;margin-left:0%; background: black">
                     <form>
                          <h4 align="center"><font style="color: wheat" >{{projectNAME}}</font> </h4>
                          <h4 align="center"><font style="color: wheat" >{{releaseNAME}}</font> </h4>
                          <h4 align="center"><font style="color: wheat" >TASKS for {{sprintNAME}}</font> </h4>
                          
                          
                            <div align='center' class="body-boder projectBox" style="background: repeating-radial-gradient">   
                            <div ng-init ="fetchCreatedProject()"></div>
                            <div ng-init ="fetchCreatedTasks()"></div>
                            <div  class="col-md-12" style="margin-bottom: 20%;">



                                            <div ng-repeat="data in ArrayColor1" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #F7819F">
                                                              
                                                                 
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.startDate}})</div> -
                                                                      <div class="content" style="color: #0000FF">({{data.endDate}})</div><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateTask" title="Update" ng-click="FetchDataForUpdateTask(data.id,data.name,data.desc,data.startDate,data.endDate,data.assignTo,data.backlog)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  
                                                                       

                                                            </div>

                                            </div>  
                                            <div ng-repeat="data in ArrayColor2" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #6495ED">
                                                                      
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.startDate}})</div> -
                                                                      <div class="content" style="color: #0000FF">({{data.endDate}})</div><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateTask" title="Update" ng-click="FetchDataForUpdateTask(data.id,data.name,data.desc,data.startDate,data.endDate,data.assignTo,data.backlog)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  
                                                            </div>

                                            </div>   
                                             <div ng-repeat="data in ArrayColor3" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #C8FE2E">
                                                                      
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.startDate}})</div> -
                                                                      <div class="content" style="color: #0000FF">({{data.endDate}})</div><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateTask" title="Update" ng-click="FetchDataForUpdateTask(data.id,data.name,data.desc,data.startDate,data.endDate,data.assignTo,data.backlog)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  
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
              
                 <div align="center"><button data-toggle="modal" href="#myModalForCreateTask" class="css3button" class="btn btn-primary btn-lg">Create Task</button></div><br>
                <div class="body-boder projectBox">
                  <br>
                              <h4 align="center">LIST OF PROJECTS</h4><br>
                             
                                    <div ng-repeat="data in ArrayProject1"> 
                                      
                                     
                                      &nbsp;<a href="#/releaseBoard/{{data.id}}/{{data.name}}"><b style="color: #F7819F">{{data.name}}</b></a> ( {{data.startDate}} &nbsp; - &nbsp;{{data.endDate}}) 
                                                                               
                                    </div> 
                                    <div ng-repeat="data in ArrayProject2">                                                                
                                      
                                      &nbsp;<a href="#/releaseBoard/{{data.id}}/{{data.name}}"><b style="color: #6495ED">{{data.name}}</b></a> ( {{data.startDate}} &nbsp; - &nbsp;{{data.endDate}}) 
                        
                                                                           
                                    </div> 
                                    <div ng-repeat="data in ArrayProject3">                                                                
                                      
                                      &nbsp;<a href="#/releaseBoard/{{data.id}}/{{data.name}}"><b style="color: #C8FE2E">{{data.name}}</b></a> ( {{data.startDate}} &nbsp; - &nbsp;{{data.endDate}}) 
                                                                             
                                    </div> 
                              <br>
                </div>

             </div>
</div>









<!-- task creation -----------------------------------------------------   -->
<div class="modal fade" id="myModalForCreateTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Create Task</h4></center></p></h4>
        </div>
        
    
        <div class="modal-body">
                                    <!-- form start here -->
                                        <form ng-submit="saveTask()">
                                          
                                          <input type="text" ng-model="taskName" class="form-control" placeholder="Task Name*"  autofocus required=""><br>

                                         
                                          <textarea rows="3" cols="30" ng-model="taskDescription" class="form-control" placeholder="Description*" required="" >
                                          </textarea><br>
                                          <label>Status </label><br>
                                          <select  ng-model="taskStatus" class="form-control"  required="">
                                            <option value="Started">Started</option>
                                          </select>
                                          
                                          
                                         <div ng-init="fetchUsers()">  
                                            <label>Assign To</label>
                                            <select ng-model="taskUsers" class="form-control"  required="">
                                         
                                              <option ng-repeat="items in usersArray" value="{{items.email}}">{{items.email}}</option>
                                            
                                            </select>
                                         </div>

                                         <div ng-init="fetchBacklogs()">  
                                           <label>Add Backlog</label>
                                           <select ng-model="taskBacklogs" class="form-control"  required="" >
                                            <div ng-repeat="data in backlogsArray">
                                            <option ng-repeat="items in backlogsArray"> {{items.name}} </option>
                                           
                                          </select>
                                         </div>
                                           
                                        
                                         <label>Start Date </label><br>
                                         <input type ="date" id="startdate" ng-model="taskStartDate" class="form-control" required=""><br>

                                         <label>End Date </label><br>
                                         <input type ="date" id="enddate" ng-model="taskEndDate" class="form-control" required="">
                    
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary"> Save </button>
                    
	  </form>
          <!-- form end here -->                         
        </div>
	

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  
  
<!-- Task Update -----------------------------------------------------   -->
<div class="modal fade" id="myModalForUpdateTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                          <input type="text" ng-model="taskName" class="form-control" placeholder="Task Name*"  autofocus required=""><br>

                                          <label>Description </label><br>
                                          <input type="text" ng-model="taskDescription" class="form-control" placeholder="Description*" required="" ><br>
                                          
                                          <label>Prev Assigned To</label><br>
                                          <input type="text" readonly="" ng-model="prevAssign" class="form-control"><br>
                                          
                                          <div ng-init="fetchUsers()">  
                                            <label>Assign To</label>
                                            <select ng-model="taskUsers" class="form-control"  required="">
                                         
                                              <option ng-repeat="items in usersArray" value="{{items.email}}">{{items.email}}</option>
                                            
                                            </select>
                                         </div><br>

                                          <label>Prev Backlog</label><br>
                                          <input type="text" readonly="" ng-model="prevBacklog" class="form-control"><br>
                                          
                                         <div ng-init="fetchBacklogs()">  
                                           <label>Add Backlog</label>
                                           <select ng-model="taskBacklogs" class="form-control"  required="" >
                                            <div ng-repeat="data in backlogsArray">
                                            <option ng-repeat="items in backlogsArray"> {{items.name}} </option>
                                           
                                          </select>
                                         </div>
          
                                         <label>Start Date </label><br>
                                         <input type ="date" id="startdate" readonly="true" ng-model="taskStartDate" class="form-control" required=""><br>

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
