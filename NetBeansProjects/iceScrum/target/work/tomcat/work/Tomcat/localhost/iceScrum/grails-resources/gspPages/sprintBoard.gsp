<div>
              <div class="col-md-1" style="margin-top:5.3%;margin-left:0%">
               
              </div>
              <div class="col-md-7" class="body-boder projectBox" style="margin-top:5.3%;margin-left:0%; background: black">
                     <form>
                          <h4 align="center"><font style="color: wheat" >{{projectNAME}}</font> </h4>
                          <h4 align="center"><font style="color: wheat" >SPRINTS for {{releaseNAME}}</font> </h4>
                          
                          
                            <div align='center' class="body-boder projectBox" style="background: repeating-radial-gradient">   
                            <div ng-init ="fetchCreatedProject()"></div>
                            <div ng-init ="fetchCreatedSprints()"></div>
                            <div  class="col-md-12" style="margin-bottom: 20%;">



                                            <div ng-repeat="data in ArrayColor1" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #F7819F">
                                                                                                                          
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="#/taskBoard/{{data.id}}/{{data.name}}/{{releaseID}}/{{releaseNAME}}/{{projectID}}/{{projectNAME}}">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.startDate}})</div> -
                                                                      <div class="content" style="color: #0000FF">({{data.endDate}})</div><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateSprint" title="Update" ng-click="FetchDataForUpdateSprint(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  

                                                            </div>

                                            </div>  
                                            <div ng-repeat="data in ArrayColor2" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #6495ED">
                                                                      
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="#/taskBoard/{{data.id}}/{{data.name}}/{{releaseID}}/{{releaseNAME}}/{{projectID}}/{{projectNAME}}">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.startDate}})</div> -
                                                                      <div class="content" style="color: #0000FF">({{data.endDate}})</div><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateSprint" title="Update" ng-click="FetchDataForUpdateSprint(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  
                                                            </div>

                                            </div>   
                                             <div ng-repeat="data in ArrayColor3" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBox" style="background: #C8FE2E">
                                                                      
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="#/taskBoard/{{data.id}}/{{data.name}}/{{releaseID}}/{{releaseNAME}}/{{projectID}}/{{projectNAME}}">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.startDate}})</div> -
                                                                      <div class="content" style="color: #0000FF">({{data.endDate}})</div><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateSprint" title="Update" ng-click="FetchDataForUpdateSprint(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  
                                                            </div>
                                                        <br><br>
                                            </div> 
            
                                     </div>
                          </div>
                      
                    </form> 
                    <form>
                          <h4 align="center"><font style="color: wheat" >{{projectNAME}}</font> </h4>
                          <h4 align="center"><font style="color: wheat" >BACKLOGS for {{releaseNAME}}</font> </h4>
                          
                          
                            <div align='center' class="body-boder projectBox" style="background: repeating-radial-gradient">   
                                 <div ng-init ="fetchBacklogs()"></div>
                                 <div  class="col-md-12" style="margin-bottom: 20%;">



                                            <div ng-repeat="data in BacklogArrayColor1" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBoxForBacklog" style="background: #000080">
                                                                                                                          
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="#/taskBoard/{{data.id}}/{{data.name}}/{{releaseID}}/{{releaseNAME}}/{{projectID}}/{{projectNAME}}">{{data.name}}</a></b></div>
                                                                      <br><br>
                                                                      <a data-toggle="modal" href="#myModalForUpdateSprint" title="Update" ng-click="FetchDataForUpdateSprint(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  

                                                            </div>

                                            </div>  
                                            <div ng-repeat="data in BacklogArrayColor2" class="col-md-3">
                                                         <br><br>

                                                            <div class="divBoxForBacklog" style="background: #008000">
                                                                                                                          
                                                                      <div align="left" style="color: black">{{data.id}}</div>
                                                                      <div class="content" style="color: black"><b><a href="#/taskBoard/{{data.id}}/{{data.name}}/{{releaseID}}/{{releaseNAME}}/{{projectID}}/{{projectNAME}}">{{data.name}}</a></b></div>
                                                                      <div class="content" style="color: #0000FF">({{data.assignedSprint}})</div> -
                                                                      
                                                                      <a data-toggle="modal" href="#myModalForUpdateSprint" title="Update" ng-click="FetchDataForUpdateSprint(data.id,data.name,data.desc,data.startDate,data.endDate)"><span align="right" class="glyphicon glyphicon-edit blue"></span></a>  

                                                            </div>

                                            </div>   
            
                                 </div>
                          </div>
                      
                    </form>  
              </div>
              <div class="col-md-1" style="margin-top:5.3%;margin-left:0%">
                
              </div>
              <div class="col-md-3" style="margin-top:5.3%;margin-left:0%">
              
                 <div align="center"><button data-toggle="modal" href="#myModalForCreateSprint" class="css3button" class="btn btn-primary btn-lg">Create Sprint</button></div><br>
                 <div align="center"><button data-toggle="modal" href="#myModalForBacklog" class="css3button" class="btn btn-primary btn-lg">Create Backlog</button></div><br>
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



<!-- sprint creation -----------------------------------------------------   -->
<div class="modal fade" id="myModalForCreateSprint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Create Sprint</h4></center></p></h4>
        </div>
        
    
        <div class="modal-body">
                                    <!-- form start here -->
                                        <form ng-submit="saveSprint()">
                                          
                                          <input type="text" ng-model="sprintName" class="form-control" placeholder="Sprint Name*"  autofocus required=""><br>
                                           <textarea rows="8" cols="50" ng-model="sprintDescription" class="form-control" placeholder="Description*" required="" >
                                          </textarea><br>
                                          <label>Status </label><br>
                                          <select  ng-model="sprintStatus" class="form-control"  required="">
                                            <option value="Started">Started</option>
                                          </select>
              
                                          <br>

                                          <label>Start Date </label><br>
                                          <input type ="date" id="startdate" ng-model="sprintStartDate" class="form-control" required=""><br>

                                           <label>End Date </label><br>
                                           <input type ="date" id="enddate" ng-model="sprintEndDate" class="form-control" required=""><br>
              
                    
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

  
  
<!-- backlog creation -----------------------------------------------------   -->
<div class="modal fade" id="myModalForBacklog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Create Backlog</h4></center></p></h4>
        </div>
        
    
        <div class="modal-body">
                                    <!-- form start here -->
                                        <form ng-submit="saveBacklog()">
                                          
                                        <input type="text" ng-model="backlogName" class="form-control" placeholder="Backlog Name*"  autofocus required=""><br>
                                         
                                        <textarea rows="8" cols="50" ng-model="backlogDescription" class="form-control" placeholder="Description*" required="" >
                                        </textarea><br>
                    
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

  
  
  
  
<!-- Sprint Update  -----------------------------------------------------   -->
<div class="modal fade" id="myModalForUpdateSprint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><p><center><h4>Update Sprint</h4></center></p></h4>
        </div> 
        
        <div class="modal-body">
                              <!-- form start here -->
                                        <form ng-submit="updateSprint()">
                                          
                                          <input type="hidden" ng-model="sprintId">
                                          <label>Sprint Name </label><br>
                                          <input type="text" ng-model="sprintName" class="form-control" placeholder="Sprint Name*"  autofocus required=""><br>

                                          <label>Description </label><br>
                                          <input type="text" ng-model="sprintDescription" class="form-control" placeholder="Description*" required="" ><br>

                                          <label>Start Date </label><br>
                                          <input type ="date" id="startdate" readonly="true" ng-model="sprintStartDate" class="form-control" required=""><br>

                                          <label>End Date </label><br>
                                          <input type ="date" id="enddate" ng-model="sprintEndDate" class="form-control" required=""><br>
         
	  
        </div>
        
        <div class="modal-footer">
            <button type="button" class="btn btn-default" ng-model="cancel" data-dismiss="modal">Close</button>
            <button class="btn btn-sm btn-primary" type="submit">Update</button>
         </form> 
        </div>
	

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
