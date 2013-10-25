package com.neev.controller

import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.Sprint
import com.neev.domain.User
import com.neev.mainservice.SprintInfoService
import org.codehaus.groovy.grails.web.json.JSONArray
import com.neev.mainservice.*
import com.neev.userservice.*
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class SprintController {

    final Logger logger = LoggerFactory.getLogger(SprintController.class)
    JsonBuilder builder = new JsonBuilder();
    def sprintInfoService
    def commonUserValidationService
    
    /*
     *Parameters : No Parameters
     *Functionality :
     *Return :
    */
    def index() 
    {
       
    }
    
    /*
     *Parameters : No Parameters
     *Functionality : Call add method of SprintInfoService
     *Return :
    */
    def add()
    {
        def json = request.JSON
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {   
            if(sprintInfoService.isHasRelease(user,json))
            {   
                def result = sprintInfoService.add(json,user)
                if( result == "dateNotCorrect"  )
                {
                    builder.response(status:"End date should be greater than equal to start date", code:"600")
                    render builder.toString()
                }
                else if( result == "notSave" )
                {
                    builder.response(status:"Your data is not save .!!!!! some information is wrong !!!!!",code:"400");    
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
                builder.response(status:"user doesnt have this release",code:"200")
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
     *Functionality : Call update method of SprintInfoService
     *Return :
     */
    
   def getPageCountForSprints()
   {
       def json = params
       def user = commonUserValidationService.verifySessionToken(json.token)
       if(user)
       {
              def todoCount = 0
              def in_progressCount = 0
              def completedCount = 0
              
              List list = sprintInfoService.get(json) 
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
    
    
    def update()
    {
        def json = request.JSON
        def user = commonUserValidationService.verifySessionToken(json.token)
        
        if(user)
        {   
            if(sprintInfoService.isHasSprint(user,json))
            {
                def result = sprintInfoService.update(json , user)
                println result
                if( result == "update" )
                {
                    builder.response(status:"user authentication success and Data updated",code:"200");    
                    render builder.toString();
                }
                else if( result == "notUpdate" )
                {
                    builder.response(status:"some information is wrong !!! data not updated",code:"600");    
                    render builder.toString();
                }
                
                else if( result == "notValidDate" )
                {
                    builder.response(status:"your date is invalid",code:"600");    
                    render builder.toString();
                }  
                   else
            {
                builder.response(status:result,code:"300")
                render builder.toString()
            }
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
     *Functionality : Call get method of SprintInfoService
     *Return :
    */
    def get()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {   
            if(sprintInfoService.isHasRelease(user,json))
            {   
                List list1 = sprintInfoService.get(json)
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
                  i++
              }
              builder.response("code": 200,"id": id,"name": name,"description":description ,"status":status ,"dateCreated":dateCreated,"endDate":endDate,"lastUpdated":lastUpdated)
              render builder.toString() 
           
        }
    }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }   
    }
    
   
    def getSprintsForSpecificRelease()
    {
        def json = params
        def user = commonUserValidationService.verifySessionToken(json.token)
        
        if(user)
        {   
               
                List list = sprintInfoService.getSprintsForSpecificRelease(json)
                println list
                JSONArray id = new JSONArray(list.id)
                JSONArray name = new JSONArray(list.name)
               
                builder.response("code": 200,"id": id,"name": name)
                render builder.toString()
           
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }   
    }
    
     def fetchDatesForParticularSprint()
    {
        def json=params
        def user = commonUserValidationService.verifySessionToken(json.token)
        if(user)
        {   
               
               def sprintTuple  = sprintInfoService.fetchDatesForParticularSprint(json)
                builder.response("code": 200,"startDate": sprintTuple.dateCreated.toString(),"endDate": sprintTuple.endDate.toString())
                render builder.toString()
           
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500")
            render builder.toString()
        }   
    }
}