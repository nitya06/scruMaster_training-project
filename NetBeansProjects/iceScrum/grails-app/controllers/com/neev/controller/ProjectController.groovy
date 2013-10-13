package com.neev.controller

import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.*
import com.neev.mainservice.ProjectInfoService
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import com.neev.mainservice.*
import com.neev.userservice.*


class ProjectController {

    JsonBuilder builder = new JsonBuilder();
    def projectInfoService
    def commonUserValidationService
    def home()
    {
        
    }
    def index() 
    {
       
    }
    
    //save the project for specific user
    def add()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
          
           def result = projectInfoService.add(json , user)
           if( result == "dateNotCorrect"  )
           {
               builder.response(status:"Enter the valid date !!!!!",code:"400");    
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
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }
     
    //update the data for specipic project
    def update()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
      
       if(user)
       {
           
           if(projectInfoService.isHasProject(user , json))
           {
           
               def result = projectInfoService.update(user , json)
               if( result == "update" )
                {
                 
                  builder.response(status:"user authentication success and Data updated",code:"200");    
                  render builder.toString();
                }
                else if( result == "DateNotValid" )
                {
                 
                  builder.response(status:"Enter the valid Date !!!",code:"400");    
                  render builder.toString();
                }
                else if( result == "notUpdate" )
                {
                 
                  builder.response(status:"some information is wrong !! your data is not updated",code:"400");    
                  render builder.toString();
                }
           }
           else
           {
               builder.response(status:"user doesnt have this project",code:"300");    
               render builder.toString();
           }          
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }
    
    //get the all project for specific user
    def get()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       
       if(user)
       {
              List list = projectInfoService.get(user) 
              JSONArray id = new JSONArray(list.id);
              JSONArray name = new JSONArray(list.name);
              JSONArray description = new JSONArray(list.description);
              JSONArray status = new JSONArray(list.status);
              JSONArray dateCreated = new JSONArray(list.dateCreated.toString());
              JSONArray lastUpdated = new JSONArray(list.lastUpdated.toString());
              JSONArray endDate = new JSONArray(list.endDate.toString());
              builder.response("code": 200,"id": id,"name": name,"description": description ,"status":status ,"dateCreated":dateCreated,"endDate":endDate,"lastUpdated":lastUpdated);
              render builder.toString();
            
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           
       }   
    }
    
    
    
    
  
}