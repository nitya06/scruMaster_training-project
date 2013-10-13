package com.neev.mainservice

import grails.transaction.Transactional
import com.neev.domain.Project
import com.neev.domain.User
import java.text.SimpleDateFormat
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Transactional
class ProjectInfoService {

   final Logger logger = LoggerFactory.getLogger(ProjectInfoService.class);
   def add(def json , def user)
   {
        logger.info("Ok loggers are workin good")
        logger.debug("Userid {}. ", user.id);
        Project newProject = new Project()
        newProject.name=json.name
        newProject.description=json.description
        newProject.status=json.status
        
        try
        {
            String startDate=json.startdate
            String endDate=json.enddate
        
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        
            java.util.Date startdate = sdf1.parse(json.startdate)
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());  
            
            
            java.util.Date enddate = sdf1.parse(json.enddate)
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());  
        
            int x=sqlStartDate.compareTo(sqlEndDate)
            if(x<=0)
            {
                newProject.dateCreated=sqlStartDate
                newProject.lastUpdated=sqlStartDate
                newProject.endDate=sqlEndDate
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
      
        newProject.user=user
        
        if(newProject.save())
         return "save"
         else
         return "notSave"  
   }
   
   
    
    
   def get(def user)
   {  
       List list = Project.findAllByUser(user)
       return list
   }
   
    
    
   def update(def user , def json)
   {     
        def newProject = Project.findById(json.project_id)
        newProject.name=json.name
        newProject.description=json.description
   
        try
        {
            String startDate=json.startdate
            String endDate=json.enddate 
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        
            java.util.Date startdate = sdf1.parse(json.startdate) 
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());  
              
            java.util.Date enddate = sdf1.parse(json.enddate)
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());  
          
            int x=sqlStartDate.compareTo(sqlEndDate)
            if(x<=0)
            {
                newProject.dateCreated=sqlStartDate
                newProject.lastUpdated=sqlStartDate
                newProject.endDate=sqlEndDate
            }
            else
            {
                return "DateNotValid"
            }
        }
        catch(Exception e)
        {
            println e
        }
      
        newProject.user=user
        
        if(newProject.save())
         return "update"
         else
         return "notUpdate"   
       
   }
   
    
    
    
    // all Verification for Project ------------------------------->
    
    
    
    
    boolean isHasProject(def user , def json)
    {
        def project = Project.findById(json.project_id)
        if(project.user==user)
        {
            return true
        }
        
         return false
    }
    
    
    
}