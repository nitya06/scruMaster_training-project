package com.neev.controller

import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.*
import com.neev.mainservice.TaskInfoService
import com.neev.mainservice.*
import com.neev.userservice.*
import org.codehaus.groovy.grails.web.json.JSONArray
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class TaskController 
{
    final Logger logger = LoggerFactory.getLogger(TaskController.class)
    JsonBuilder builder = new JsonBuilder();
    def taskInfoService
    def commonUserValidationService
    def getUserService
    
    /*
     *Parameters : No Parameters
     *Functionality : 
     *Return :
    */
    def index() { }
    
    /*
     *Parameters : No Parameters
     *Functionality : Call add method of TaskInfoService
     *Return :
     */
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
                    builder.response(status:"End date should be greater than equal to start date", code:"600")
                    render builder.toString()
                }
                else if( result == "notSave" )
                {
                    builder.response(status:"please fill the mandatory field",code:"600");    
                    render builder.toString();
                }
                else if( result == "save" )
                {
                    builder.response(status:"Your data is save !",code:"200")
                    render builder.toString()
                } 
                else
                {
                    builder.response(status:result,code:"300")
                    render builder.toString()
                }  
            }
            else
            {
                builder.response(status:"user doesnt have this Sprint",code:"300")
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
     *Functionality : Call update method of TaskInfoService
     *Return :
     */
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
                builder.response(status:"user authentication success and Data updated",code:"200")
                render builder.toString()
            }
            else if( result == "notUpdate" )
            {
                builder.response(status:"some information is wrong !!! data not updated",code:"600")
                render builder.toString()
            }
            
            else if( result == "notValidDate" )
            {
                builder.response(status:"your date is invalid",code:"600")
                render builder.toString()
            }
            else
            {
                builder.response(status:result,code:"300")
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
     *Functionality : Call get method of TaskInfoService
     *Return :
     */
    
    
    
  def getPageCountForTasks()
  
      
   {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
              def todoCount = 0
              def in_progressCount = 0
              def completedCount = 0
              
              List list = taskInfoService.get(json) 
              println"lisssssssssssssssssssttttttttttt"+list
              for(def i = 0 ; i <list.size() ; i++)
              {
                  if( list.status[i] == "Todo" )
                    todoCount++
                  else if ( list.status[i] == "In Progress" )
                    in_progressCount++
                  else if ( list.status[i] == "Completed" )
                     completedCount++
              }
              
              if(json.filterOption == "All")
              {
                   builder.response( "code": 200,"pageCount": list.size() )
                   render builder.toString()
              }
              else if(json.filterOption == "Todo")
              {
                   builder.response( "code": 200,"pageCount": todoCount  )
                   render builder.toString()
              }
              else if(json.filterOption == "In Progress")
              {
                   builder.response( "code": 200,"pageCount": in_progressCount  )
                   render builder.toString()
              }
              else if(json.filterOption == "Completed")
              {
                   builder.response( "code": 200,"pageCount": completedCount  )
                   render builder.toString()
              }
             
       }
       else
       {
           builder.response(status:"user authentication fail",code:"500")
           render builder.toString()
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
               
                List list1 = taskInfoService.get(json)
                def list = new ArrayList()
                def count = 0 
              
                if(json.filterOption == "Todo")
                { 
                    for (def temp = 0 ; temp<list1.size() ; temp++)
                    {
                      if(list1.status[temp] == "Todo")
                          {
                              list[count] = list1[temp]
                              count++
                          }
                    }
                }
                else if (json.filterOption == "In Progress")
                {
                    for (def temp = 0 ; temp<list1.size() ; temp++)
                    {
                      if(list1.status[temp] == "In Progress")
                          {
                              list[count] = list1[temp]
                              count++
                          }
                    }
                }
                else if (json.filterOption == "Completed")
                {
                    for (def temp = 0 ; temp<list1.size() ; temp++)
                    {
                      if(list1.status[temp] == "Completed")
                          {
                             list[count] = list1[temp]
                             
                              count++
                          }
                    }
                }
                else
                {
                    list = list1
                }
             
              JSONArray id = new JSONArray()
              JSONArray name = new JSONArray()
              JSONArray description = new JSONArray()
              JSONArray status = new JSONArray()
              JSONArray dateCreated = new JSONArray()
              JSONArray lastUpdated = new JSONArray()
              JSONArray endDate = new JSONArray()
              JSONArray assignTo = new JSONArray()
              JSONArray userStory = new JSONArray()
             
             
              int startIndex = (json.firstIndex).toInteger()
              int lastIndex =  (json.lastIndex).toInteger()
             
              def i = 0 
             
              for ( int index = startIndex ; index <= lastIndex ; index++)
              { 
                  id[i] = list.id[index]
                  name[i] = list.name[index]
                  description[i] = list.description[index]
                  status[i] = list.status[index]
                  dateCreated[i] = list.dateCreated[index].toString()
                  lastUpdated[i] = list.lastUpdated[index].toString()
                  endDate[i] = list.endDate[index].toString()
                  assignTo[i] = list.user.email[index]
                  userStory[i] = list.userStory.name[index]
                  i++
              }
              builder.response("code": 200,"id": id,"name": name,"description":description, "status":status ,"dateCreated":dateCreated,"endDate":endDate,"lastUpdated":lastUpdated,"assignTo":assignTo,"userStory":userStory)
              render builder.toString()   
           
                               
            }
            else
            {
                builder.response(status:"user doesnt have this sprint",code:"200")
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
     *Functionality : Call getAllUsers method of GetUserService if user exist with the sesionToken
     *Return :
     */
    def getAllUsers()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {
            List list = getUserService.getAllUsers()
            render list as JSON
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }   
    }
    
    def addTaskFromReleaseBoard()
    {
        def json = request.JSON
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {    
            
                def result = taskInfoService.addTaskFromReleaseBoard(json,user)
                if( result == "dateNotCorrect"  )
                {
                    builder.response(status:"End date should be greater than equal to start date", code:"600")
                    render builder.toString()
                }
                else if( result == "notSave" )
                {
                    builder.response(status:"please select sprint and user story!!!!!",code:"800");    
                    render builder.toString();
                }
                else if( result == "save" )
                {
                    builder.response(status:"Your data is save !!!!!",code:"200")
                    render builder.toString()
                } 
                else
                {
                    builder.response(status:result,code:"300")
                    render builder.toString()
                }  
            
       }
       else
       {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
       }
    }
}