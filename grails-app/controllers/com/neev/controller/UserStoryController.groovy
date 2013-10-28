package com.neev.controller

import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.*
import com.neev.mainservice.*
import com.neev.userservice.*
import org.codehaus.groovy.grails.web.json.JSONArray
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class UserStoryController {

    final Logger logger = LoggerFactory.getLogger(UserStoryController.class)
    JsonBuilder builder = new JsonBuilder()
    def userStoryInfoService
    def commonUserValidationService
    
    /*
     *Name : No Parameters
     *Returns :
     *Description :
     */
    def index() 
    {
       
    }
    
    /*
     *Parameters : No Parameters
     *Functionality : Call add method of UserStoryInfoService
     *Return :
     */
    def add()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
                if( userStoryInfoService.add(json , user) )
                {
                    builder.response(status:"user authentication success and Data Save",code:"200")
                    render builder.toString()
                }
           
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500")
           render builder.toString()
       }
    }
    
    
    /*
     *Parameters : No Parameters
     *Functionality : Call update method of UserStoryInfoService
     *Return :
     */
    def update()
    {
        def json = request.JSON
        def user = commonUserValidationService.verifySessionToken(json.token)
       
        if(user)
        {
            if(userStoryInfoService.isHasUserStory(user , json))
            {
                if( userStoryInfoService.update(json) )
                {
                    builder.response(status:"user authentication success and Data update",code:"200")
                    render builder.toString()
                }
            }
            else
            {
                builder.response(status:"user doesnt have this userStory",code:"300")
                render builder.toString()
            }
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }
    }
    
    /*
     *Parameters : No Parameters
     *Functionality : getUserStoryForSpecificRelease method of UserStoryInfoService
     *Return :
     */
    def getUserStoryForSpecificRelease()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {
            if(userStoryInfoService.isHasProject(user , json))
            {
                List list = userStoryInfoService.getUserStoryForSpecificRelease(json)
                JSONArray id = new JSONArray()
                JSONArray name = new JSONArray()
                JSONArray description = new JSONArray()
                JSONArray assignedSprint = new JSONArray()
                
                int startIndex = (json.firstIndex).toInteger()
                int lastIndex =  (json.lastIndex).toInteger()

                def i = 0 

                if( lastIndex >= list.size() )
                {
                    lastIndex = list.size()-1
                }
                
                for ( int index = startIndex ; index <= lastIndex ; index++)
                { 
                    id[i] = list.id[index]
                    name[i] = list.name[index]
                    description[i] = list.description[index] 
                    if(list.sprint[index] == null)
                    {
                        assignedSprint[i]= "null"            
                    }
                    else
                    {
                        assignedSprint[i]= list.sprint[index].name
                    }
                    i++
                }
 
               builder.response("code": 200,"id": id,"name": name,"description": description ,"assignedSprint":assignedSprint)
               render builder.toString()          
            }
            else
            {
                builder.response(status:"this user doesnt have this project",code:"500")
               render builder.toString()
            }
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }
    }
    
   /*
    *Parameters : No Parameters
    *Functionality : Call getUserStoryForSpecificSprint method of UserStoryInfoService
    *Return :
    */
    def getUserStoryForSpecificSprint()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {
            if(userStoryInfoService.isHasProject(user , json))
            { 
                List list = userStoryInfoService.getUserStoryForSpecificSprint(json) 
                JSONArray id = new JSONArray(list.id)
                JSONArray name = new JSONArray(list.name)
                builder.response("code": 200,"id": id,"name": name)
                render builder.toString()            
            }
            else
            {
                builder.response(status:"this user doesnt have this project",code:"500")
                render builder.toString()
            }
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500");    
            render builder.toString();
        }
    }
    
    
    
    def saveUserStoryForSpecificProject()
    {
       def json = request.JSON
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
               if( userStoryInfoService.saveUserStoryForSpecificProject(json , user) )
                {
                    builder.response(status:"user authentication success and Data Save",code:"200")
                    render builder.toString()
                }
          
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500")
           render builder.toString()
       }
    }
    
    def getUserStoryForSpecificProject()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {
               
                List list = userStoryInfoService.getUserStoryForSpecificProject(json) 
                JSONArray id = new JSONArray()
                JSONArray name = new JSONArray()
                JSONArray description = new JSONArray()
               
                int startIndex = (json.firstIndex).toInteger()
                int lastIndex =  (json.lastIndex).toInteger()

                def i = 0 

                if( lastIndex >= list.size() )
                {
                    lastIndex = list.size()-1
                }
                
                for ( int index = startIndex ; index <= lastIndex ; index++)
                { 
                    id[i] = list.id[index]
                    name[i] = list.name[index]
                    description[i] = list.description[index] 
                    i++
                }
           
                builder.response("code": 200,"id": id,"name": name,"description":description)
                render builder.toString()  
       
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500");    
            render builder.toString();
        }
    }
    
  
     def getPageCountForUserStory(){
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
                    
              List list = userStoryInfoService.getUserStoryForSpecificProject(json) 
              builder.response( "code": 200,"pageCount": list.size()  )
              render builder.toString()
                      
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500")
           render builder.toString()
       }   
    }
    
    
    
    def getfetchUserStorysForProject()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {
               
                List list = userStoryInfoService.getUserStoryForSpecificProject(json) 
                JSONArray id = new JSONArray(list.id)
                JSONArray name = new JSONArray(list.name)
                JSONArray description = new JSONArray(list.description)

                builder.response("code": 200,"id": id,"name": name,"description":description)
                render builder.toString()            
           
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500");    
            render builder.toString();
        }
        
        
    }
    
    
    def updateUserStory()
    {
        def json = request.JSON
        def user = commonUserValidationService.verifySessionToken(json.token)
      
        if(user)
        {
            
                if( userStoryInfoService.updateUserStory(json) )
                {
                    builder.response(status:"user authentication success and Data update",code:"200")
                    render builder.toString()
                }
           
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }
    }
    
    def fetchUserStoriesForSpecificSprint()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {
           
                List list = userStoryInfoService.fetchUserStoriesForSpecificSprint(json) 
                JSONArray id = new JSONArray(list.id)
                JSONArray name = new JSONArray(list.name)
                builder.response("code": 200,"id": id,"name": name)
                render builder.toString()            
           
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500");    
            render builder.toString();
        }
    }
    
    def getPageCountForUserStoryInSprintBoard()
    {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
                    
              List list = userStoryInfoService.getUserStoryForSpecificRelease(json) 
              builder.response( "code": 200,"pageCount": list.size()  )
              render builder.toString()
                      
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500")
           render builder.toString()
       }   
    }
}