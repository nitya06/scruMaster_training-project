package com.neev.mainservice

import grails.transaction.Transactional
import com.neev.domain.*
import java.text.SimpleDateFormat
import java.util.*

@Transactional
class TaskInfoService {

    
   def add(def json , def user)
   {
  
        def newTask = new Task()
        newTask.name=json.name
        newTask.status=json.status
        newTask.description=json.description
        def sprint = Sprint.findById(json.sid)
        newTask.sprint = sprint
        
        def backlog = Backlog.findByName(json.backlog)
        newTask.backlog = backlog
        
        
        def adduser = User.findByEmail(json.user)       
        newTask.user = adduser
        
        
        try
        {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd")
            java.util.Date sprintstartdate = sdf1.parse(sprint.dateCreated.toString())
            java.sql.Date sqlSprintStartDate = new java.sql.Date(sprintstartdate.getTime())
            
            java.util.Date sprintenddate = sdf1.parse(sprint.endDate.toString())
            java.sql.Date sqlSprintEndDate = new java.sql.Date(sprintenddate.getTime());
            
            
            
            String startDate=json.startdate
            String endDate=json.enddate
            
            java.util.Date startdate = sdf1.parse(json.startdate)
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
        
            
            java.util.Date enddate = sdf1.parse(json.enddate)
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
            
            int x=sqlStartDate.compareTo(sqlEndDate)
            
            if(x<=0)
            {
                if((startdate.after(sprintstartdate) && enddate.before(sprintenddate)||(startdate.compareTo(sprintstartdate)>=0 && enddate.compareTo(sprintenddate)<=0)))
                { 
                    newTask.dateCreated=sqlStartDate
                    newTask.lastUpdated=sqlStartDate
                    newTask.endDate=sqlEndDate
                    if(newTask.save())
                    {
                        return "save"
                    }
                    else
                    {
                        return "notSave"
                    }  
                }
                else
                { 
                    return "notMatch"
                }
            }
            else
            {
                return "dateNotCorrect"
            }
            
        }
        catch(Exception e)
        {
            println e
        }
   }
   
   
  
   

    
   def update(def json)
   {     
        def newTask = Task.findById(json.tid)
        newTask.name=json.name
        def sprint = newTask.sprint 
        def backlog = Backlog.findByName(json.backlog)
        newTask.backlog = backlog
        newTask.description=json.description  
        def adduser = User.findByEmail(json.user)       
        newTask.user = adduser
             
        try
        {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd")
            java.util.Date sprintstartdate = sdf1.parse(sprint.dateCreated.toString())       
            java.sql.Date sqlSprintStartDate = new java.sql.Date(sprintstartdate.getTime())
            java.util.Date sprintenddate = sdf1.parse(sprint.endDate.toString())        
            java.sql.Date sqlSprintEndDate = new java.sql.Date(sprintenddate.getTime());
     
            String startDate=json.startdate
            String endDate=json.enddate
            
            java.util.Date startdate = sdf1.parse(json.startdate)
            
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
     
            java.util.Date enddate = sdf1.parse(json.enddate)
            
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
            
            
            int x=sqlStartDate.compareTo(sqlEndDate)
            
            if(x<=0)
            {
                if((startdate.after(sprintstartdate) && enddate.before(sprintenddate)||(startdate.compareTo(sprintstartdate)>=0 && enddate.compareTo(sprintenddate)<=0)))
                {
      
                    newTask.dateCreated=sqlStartDate
                    newTask.lastUpdated=sqlStartDate
                    newTask.endDate=sqlEndDate
                    if(newTask.save())
                    {
                        return "update"
                    }
                    else
                    {
                       return "notUpdate"
                    }  
                }
                else
                {
                     return "notMatch"
                }
            }
            else
            {
                return "notValidDate"
            }
            
        }
        catch(Exception e)
        {
            println e
        }
       
   }
    
     
   def get(def json)
   {  
       def sprint = Sprint.findById(json.sid)
       List list = Task.findAllBySprint(sprint)
       return list
   }
    
    
    //verification
    
    
    
    boolean isHasSprint(def user,def json)
    {
        def sprint = Sprint.findById(json.sid)  //To be Verified
        
        if(sprint?.userId==user.id)
        {
            return true
        }
        
         return false
    }
    
    boolean isBacklogAvailableForProject(def json)
    {
       
        def backlog = Backlog.findByName(json.backlog)
       
        def sprint = Sprint.findById(json.sid)
        def release = sprint.release
        
        def release1 = Release1.findById(release.id)
        
        if(release1.project ==  backlog.projects )
        {
            return true
        }
        
        return false        
    }
    
    
    boolean isHasTask(def user,def json)
    {
        def task  = Task.findById(json.tid)         //to be verified
        def sprint1 = task.sprint
        def sprint = Sprint.findById(sprint1.id)
        if(sprint?.userId == user.id)
        {
            return true
        }
        return false
    }
    
}
