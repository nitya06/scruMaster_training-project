
<div>
            <div class="container" style="margin-top:5.3%;margin-left:0%">
                        <ul class="list-inline ">
                        <li class="col-md-1"></li>
                        <li class="col-md-4">
                                    <h3 align="center" style="color:#289EF2">Modify Password</h3>
                                    <div class="container">
                                        <ul class="list-inline">
                                          <form ng-submit="changepassword()">
                                            <input type="Password" class="form-control" name="oldpassword" ng-model="old"  placeholder="Old Password" required=""><br>
                                            <input type="Password" class="form-control" name="newpassword"  ng-model="news" placeholder="New Password" required=""><br>
                                            <button class="btn btn-primary btn-sm" type="submit">Submit</button></a>
                                                        
                                          </form>
                                       </ul>
                                    </div>
                        </li>
                        <li class="col-md-3"> </li>
                        <li class="col-md-4">
                                     
                                          <div class="container">
                                                        <ul class="list-inline">
                                                                
                                                                <li class="col-md-12">
                                                                   <h3 style="color:#289EF2">Personal Information</h3>
                                                                      
                                                                       <h4>
                                                                       <div class="col-md-6" align="left">{{username}}</div><br>
                                                                       <div class="col-md-6" align="left">{{email}}</div>
                                                                       </h4>
                                                                </li>
                                                        </ul>
                                          </div>
                        </li>
                        </ul>
            </div>
            <hr/>
            
</div>