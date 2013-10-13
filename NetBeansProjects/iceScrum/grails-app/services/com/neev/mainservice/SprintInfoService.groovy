package com.neev.mainservice

import grails.transaction.Transactional
import com.neev.domain.Sprint
import com.neev.domain.User
import com.neev.domain.*
import java.text.SimpleDateFormat

@Transactional
class SprintInfoService {

 
   def add(def json , def user)
   {
        Sprint newSprint = new Sprint()
        
        newSprint.name=json.name
        newSprint.description=json.description
        newSprint.status=json.status
        
        def release = Release1.findById(json.rid)
        newSprint.release=release
        newSprint.userId= user.id
        try
        {
           SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
           java.util.Date releasestartdate = sdf1.parse(release.dateCreated.toString())
           java.sql.Date sqlReleaseStartDate = new java.sql.Date(releasestartdate.getTime());          
           java.util.Date releaseenddate = sdf1.parse(release.endDate.toString())  
           java.sql.Date sqlReleaseEndDate = new java.sql.Date(releaseenddate.getTime());

            String startDate=json.startdate
            String endDate=json.enddate
            
            java.util.Date startdate = sdf1.parse(json.startdate)
           
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
           
            
            java.util.Date enddate = sdf1.parse(json.enddate)
            
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
            
            
            int x=sqlStartDate.compareTo(sqlEndDate)
            
            if(x<=0)
            {
               
                if((startdate.after(releasestartdate) && enddate.before(releaseenddate)||(startdate.compareTo(releasestartdate)>=0 && enddate.compareTo(releaseenddate)<=0)))
                {

                    newSprint.dateCreated=sqlStartDate
                    newSprint.lastUpdated=sqlStartDate
                    newSprint.endDate=sqlEndDate

                    if(newSprint.save())
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
   
   
   def update(def json , def user)
   {
        def newSprint = Sprint.findById(json.sid)
        def release = newSprint.release
        newSprint.name=json.name
        newSprint.description=json.description
        newSprint.userId= user.id
        try
        {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date releasestartdate = sdf1.parse(release.dateCreated.toString())

            java.sql.Date sqlReleaseStartDate = new java.sql.Date(releasestartdate.getTime());

            java.util.Date releaseenddate = sdf1.parse(release.endDate.toString())

            java.sql.Date sqlReleaseEndDate = new java.sql.Date(releaseenddate.getTime());

            String startDate=json.startdate
            String endDate=json.enddate
            
            java.util.Date startdate = sdf1.parse(json.startdate)
            
            java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
           
            
            java.util.Date enddate = sdf1.parse(json.enddate)
            
            java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
            
            
            int x=sqlStartDate.compareTo(sqlEndDate)
            
            if(x<=0)
            {
               
                if((startdate.after(releasestartdate) && enddate.before(releaseenddate)||(startdate.compareTo(releasestartdate)>=0 && enddate.compareTo(releaseenddate)<=0)))
                {

                    newSprint.dateCreated=sqlStartDate
                    newSprint.lastUpdated=sqlStartDate
                    newSprint.endDate=sqlEndDate
                    
                    
                    if(newSprint.save())
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
       def release=Release1.findById(json.rid)
       List list = Sprint.findAllByRelease(release)
       return list
   }
  
    
    //varification all
    
    
    
    
    
    boolean isHasRelease(def user , def json)
    {  
        def release = Release1.findById(json.rid)
        
        if(release.userId==user.id)
        {
            return true
        }
        
         return false
    }
   
    boolean isHasSprint(def user,def json)
    {
        def sprint = Sprint.findById(json.sid)
        
        if(sprint.userId==user.id)
        {
            return true
        }
        
         return false
    }
    
    
    
    
}
