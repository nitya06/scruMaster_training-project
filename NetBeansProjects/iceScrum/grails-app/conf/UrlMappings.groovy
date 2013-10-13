class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/user"(controller: "users", parseRequest: true)
        {
              action = [GET: "getAllUsers"]
        }
        
        "/dashboardGetAssignTask"(controller: "dashboard", parseRequest: true)
        {
              action = [GET: "getAllAssignedTask"]
        }
        
        "/dashboardGetCreatedProject"(controller: "dashboard", parseRequest: true)
        {
              action = [GET: "getAllCreatedProject"]
        }
        
        "/dashboardUpdateAssignedTask"(controller: "dashboard", parseRequest: true)
        {
             action = [PUT : "updateAssignedTask"]
            
        }
        
        "/dashboardGetTaskStatus"(controller: "dashboard", parseRequest: true)
        {
             action = [GET : "getTaskStatus"]
            
        }
        
       "/project"(controller: "project", parseRequest: true)
        {
              action = [POST: "add" , PUT : "update" , GET: "get"]
        }
        
        "/release"(controller: "release", parseRequest: true)
        {
            action = [POST: "add" , PUT : "update", GET: "get"]      
        }
        
        "/sprint"(controller: "sprint", parseRequest: true)
        {
             action = [POST: "add" , PUT : "update" , GET: "get"]
           
        }
        
        "/task"(controller: "task", parseRequest: true)
        {
             action = [POST: "add" , PUT : "update" , GET: "get"]
            
        }
        
        "/backlog"(controller: "backlog", parseRequest: true)
        {
            action = [POST: "add" , PUT : "update" , GET: "get"]
            
        }
        
        //nitya
         "/updateProfile"(controller:"users",parseRequest: true)
        {
             action = [POST: "updateProfile"]
        }
        
         "/fetchbacklogforrelease"(controller:"release",parseRequest: true)
        {
             action = [POST: "fetchBacklogForRelease"]
        }
        
        
        
      //  "/"(view:"/test")
        "/"(view:"/users/LoginPage")
        "500"(view:'/error')
	}   
}