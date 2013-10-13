package com.neev.controller


import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.*
import com.neev.mainservice.*
import com.neev.userservice.*
import org.codehaus.groovy.grails.web.json.JSONArray

class BacklogController {

    JsonBuilder builder = new JsonBuilder();
    def backlogInfoService
    def commonUserValidationService
    
    def index() 
    {
       
    }
    
    //save the backlog for specific release and project
    def add()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
           if(backlogInfoService.isHasProject(user , json))
           {
               
                if( backlogInfoService.add(json , user) )
                {
                  println "your data is save"
                  builder.response(status:"user authentication success and Data Save",code:"200");    
                  render builder.toString();
                }
                
                
           }
           else
           {
               builder.response(status:"this user doesnt have this project",code:"500");    
               render builder.toString();
           }
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }
    
    
    
    
    
    
    
     //update the data for specipic backlog
    def update()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
      
       if(user)
       {
           
           if(backlogInfoService.isHasBacklog(user , json))
           {
               
               if( backlogInfoService.update(json) )
               {
                  println "your data is upadte"
                  builder.response(status:"user authentication success and Data update",code:"200");    
                  render builder.toString();
               }
           }
           else
           {
               builder.response(status:"user doesnt have this backlog",code:"300");    
               render builder.toString();
           }          
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }
    
    
    
    
    //get the all backlog for specific release and project
    def get()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
           if(backlogInfoService.isHasProject(user , json))
           {
        
               List list = backlogInfoService.get(json) 
               println list
               JSONArray id = new JSONArray(list.id);
               JSONArray name = new JSONArray(list.name);
               JSONArray description = new JSONArray(list.description);
               JSONArray assignedSprint = new JSONArray(list.sprint?.name);
               builder.response("code": 200,"id": id,"name": name,"description": description ,"assignedSprint":assignedSprint);
               render builder.toString();
                            
           }
           else
           {
               builder.response(status:"this user doesnt have this project",code:"500");    
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
