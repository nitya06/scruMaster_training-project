package com.neev.mainservice
import grails.transaction.Transactional
import com.neev.domain.Release1
import com.neev.domain.Project
import com.neev.domain.User
import com.neev.domain.*
import java.text.SimpleDateFormat

@Transactional
class ReleaseInfoService {
    def backlogInfoServices

    def add(def json , def user)
    {
       
       def project = Project.findById(json.pid)  
       def newRelease = new Release1()
       newRelease.name=json.name
       newRelease.description=json.descripition
       newRelease.status=json.status
        
        try
        {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            
            java.util.Date projectstartdate = sdf1.parse(project.dateCreated.toString())
            java.sql.Date sqlProjectStartDate = new java.sql.Date(projectstartdate.getTime());

            java.util.Date projectenddate = sdf1.parse(project.endDate.toString())
            java.sql.Date sqlProjectEndDate = new java.sql.Date(projectenddate.getTime());
     
            String startDate=json.startdate
            String endDate=json.enddate

            java.util.Date startdate = sdf1.parse(json.startdate)
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
            
            java.util.Date enddate = sdf1.parse(json.enddate)
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
            
            int x=sqlStartDate.compareTo(sqlEndDate)
            if(x<=0)
            {
                
                if((startdate.after(projectstartdate) && enddate.before(projectenddate)||(startdate.compareTo(projectstartdate)>=0 && enddate.compareTo(projectenddate)<=0)))
                {
                    
                    newRelease.project=project
                    
                    newRelease.userId= user.id
                    newRelease.dateCreated=sqlStartDate
                    newRelease.endDate=sqlEndDate
                    newRelease.lastUpdated=sqlStartDate
                    if(newRelease.save())
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
   
   // update the release 
    def update(def json , def user)
    {
       
        def newRelease = Release1.findById(json.rid) 
        def project = newRelease.project
         
        newRelease.name=json.name
        newRelease.description=json.description
       
        
        try
        {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            
            java.util.Date projectstartdate = sdf1.parse(project.dateCreated.toString())
            
            java.sql.Date sqlProjectStartDate = new java.sql.Date(projectstartdate.getTime());
           

            java.util.Date projectenddate = sdf1.parse(project.endDate.toString())
            
            java.sql.Date sqlProjectEndDate = new java.sql.Date(projectenddate.getTime());
            

            
            String startDate=json.startdate
            String endDate=json.enddate

            java.util.Date startdate = sdf1.parse(json.startdate)
            
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
            
            
            java.util.Date enddate = sdf1.parse(json.enddate)
            
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
            
            
            int x=sqlStartDate.compareTo(sqlEndDate)
            if(x<=0)
            {
                
                if((startdate.after(projectstartdate) && enddate.before(projectenddate)||(startdate.compareTo(projectstartdate)>=0 && enddate.compareTo(projectenddate)<=0)))
                {
                              
                    newRelease.userId= user.id
                    newRelease.dateCreated=sqlStartDate
                    newRelease.endDate=sqlEndDate
                    newRelease.lastUpdated=sqlStartDate
                    
                    if(newRelease.save())
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
       def project=Project.findById(json.pid)
       List list = Release1.findAllByProject(project)
       return list
   }
    
    //varification all

    
    boolean isHasProject(def user , def json)
    {
        
        def pid = json.pid
        def project = Project.findById(pid)
        if(project.user==user)
        {
            return true
        }
        
         return false
    }
    
    
    
    
    def verifyRelease(def json , def user)
    {
        def user_id = user.id
        def release = Release1.findById(json.rid)
        if(release.userId == user_id)
         return true
         else
         return false
        
    }
    def fetchBacklogForRelease(def pid)
    {
 
        def project=Project.findById(pid)
        println"pid is++"+pid
        List list= Backlog.findAllByProjects(project)
        println list
        return list
    }
   
}