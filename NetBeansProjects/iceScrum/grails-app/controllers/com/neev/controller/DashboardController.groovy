package com.neev.controller

import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.*
import com.neev.mainservice.ProjectInfoService
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import com.neev.mainservice.*
import com.neev.userservice.*


class DashboardController {

    JsonBuilder builder = new JsonBuilder();
    def dashboardInfoService
    def commonUserValidationService
    def index() { }
    
    
    
    
    def getAllAssignedTask()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       println user
       if(user)
       {
              List list = dashboardInfoService.getAllAssignedTask(user) 
              JSONArray id = new JSONArray(list.id);
              JSONArray name = new JSONArray(list.name);
              JSONArray description = new JSONArray(list.description);
              JSONArray status = new JSONArray(list.status);
              JSONArray dateCreated = new JSONArray(list.dateCreated.toString());
              JSONArray lastUpdated = new JSONArray(list.lastUpdated.toString());
              JSONArray endDate = new JSONArray(list.endDate.toString());
              JSONArray projectName = new JSONArray();
              for ( def i = 0 ; i < list.size() ; i++)
              {
                  def sprint = Sprint.findById(list.sprint.id[i])
                  def release = Release1.findById(sprint.release.id)
                  def project = Project.findById(release.project.id)
                  projectName[i] = project.name
              }
              
              builder.response("code": 200,"id": id,"name": name,"description":description ,"status":status ,"dateCreated":dateCreated,"endDate":endDate,"lastUpdated":lastUpdated,"projectName":projectName);
              render builder.toString();
            
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           
       }   
    }
    
    
    def getAllCreatedProject()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
              List list = dashboardInfoService.getAllCreatedProject(user) 
              
              JSONArray id = new JSONArray(list.id);
              JSONArray name = new JSONArray(list.name);
              JSONArray description = new JSONArray(list.description);
              JSONArray status = new JSONArray(list.status);
              JSONArray dateCreated = new JSONArray(list.dateCreated.toString());
              JSONArray lastUpdated = new JSONArray(list.lastUpdated.toString());
              JSONArray endDate = new JSONArray(list.endDate.toString());
              builder.response("code": 200,"id": id,"name": name,"status":status ,"description":description,"dateCreated":dateCreated,"endDate":endDate,"lastUpdated":lastUpdated);
              render builder.toString();
            
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           
       }   
    }
    
    
    
    
    
    def updateAssignedTask()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
           
                         if( dashboardInfoService.updateAssignedTask(json) )
                         {
                            builder.response(status:"user authentication success and Data updated",code:"200");    
                            render builder.toString();
                         }
       
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           render builder.toString();
       }   
        
    }
    
    
    def getTaskStatus()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
              def status = dashboardInfoService.getTaskStatus(json)              
              builder.response("code": 200,"taskStatus":status);
              render builder.toString();
            
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500");    
           
       }   
    }
    
    
}
