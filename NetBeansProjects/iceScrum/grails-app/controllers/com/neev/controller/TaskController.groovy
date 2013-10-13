package com.neev.controller

import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.*
import com.neev.mainservice.TaskInfoService
import com.neev.mainservice.*
import com.neev.userservice.*
import org.codehaus.groovy.grails.web.json.JSONArray

class TaskController {

    JsonBuilder builder = new JsonBuilder();
    def taskInfoService
    def commonUserValidationService
    
    def index() { }
    
    
    def add()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
      
       if(user)
       {
            
           if(taskInfoService.isHasSprint(user,json))
           { 
            
                            def result = taskInfoService.add(json,user)
                            if( result == "dateNotCorrect"  )
                            {
                                builder.response(status:"Enter the valid date !!!", code:"400");    
                                render builder.toString();
                            }
                             else if( result == "notMatch"  )
                            {
                                builder.response(status:"Enter the valid date corresponding your sprint Date!!!!!",code:"400");    
                                render builder.toString();
                            }
                            else if( result == "notSave" )
                            {
                                builder.response(status:"Your data is not save .!!!!! some information is wrong !!!!!",code:"400");    
                                render builder.toString();
                            }
                            else if( result == "save" )
                            {
                                builder.response(status:"Your data is save !!!!!",code:"200");    
                                render builder.toString();
                            }
 
           }
           else
           {
               builder.response(status:"user doesnt have this Sprint",code:"200");    
               render builder.toString();
               
           }
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }

    
    def update()
    {
       println "In taskUpdate Controller"
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
           
                        def result = taskInfoService.update(json)
                        if( result == "update" )
                        {
                             builder.response(status:"user authentication success and Data updated",code:"200");    
                             render builder.toString();
                        }
                        else if( result == "notUpdate" )
                        {
                             builder.response(status:"some information is wrong !!! data not updated",code:"400");    
                             render builder.toString();
                        }
                        else if( result == "notMatch" )
                        {
                             builder.response(status:"your date is not match with your release date",code:"400");    
                             render builder.toString();
                        }
                        else if( result == "notValidDate" )
                        {
                             builder.response(status:"your date is invalid",code:"400");    
                             render builder.toString();
                        }
 
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }
    
    
    
    
    
    
    def get()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
           
          if(taskInfoService.isHasSprint(user,json))
           { 
               
               List list = taskInfoService.get(json) 
               JSONArray id = new JSONArray(list.id);
               JSONArray name = new JSONArray(list.name);
               JSONArray description = new JSONArray(list.description);
               JSONArray status = new JSONArray(list.status);
               JSONArray dateCreated = new JSONArray(list.dateCreated.toString());
               JSONArray lastUpdated = new JSONArray(list.lastUpdated.toString());
               JSONArray endDate = new JSONArray(list.endDate.toString());
               JSONArray assignTo = new JSONArray(list.user.email);
               JSONArray backlog = new JSONArray(list.backlog.name);
                
              
               builder.response("code": 200,"id": id,"name": name,"description":description, "status":status ,"dateCreated":dateCreated,"endDate":endDate,"lastUpdated":lastUpdated,"assignTo":assignTo,"backlog":backlog);
               render builder.toString();
                         
                  
           }
           else
           {
               builder.response(status:"user doesnt have this sprint",code:"200");    
               render builder.toString();
               
           }
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
    }
    
    
    
}
