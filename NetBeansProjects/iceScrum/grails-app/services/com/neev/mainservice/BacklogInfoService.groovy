package com.neev.mainservice

import grails.transaction.Transactional
import com.neev.domain.*


@Transactional
class BacklogInfoService {

   boolean add(def json , def user)
   {
       
        Backlog newBacklog = new Backlog()
        newBacklog.name=json.name
        newBacklog.description=json.description
        def project = Project.findById(json.project_id)
        def release = Release1.findById(json.release_id)
        newBacklog.projects = project
        newBacklog.release = release
        newBacklog.user=user
        if(newBacklog.save())
         return true
         else
         return false   
   }
   
   boolean update(def json)
   {     
       def backlog = Backlog.findById(json.bid)
       backlog.name=json.n
       if(backlog.save())
        return true 
        else
        return false
       
   }
   
   def get(def json)
   {
       def release = Release1.findById(json.release_id)
       List list = Backlog.findAllByRelease(release)
       return list
   }
   
    
    
    //verification
   
    
    boolean isHasProject(def user , def json)
    {

        def project = Project.findById(json.project_id)
        if(project.user==user)
        {
            return true
        }
        
         return false
    }
    
    
    boolean isHasBacklog(def user , def json)
    {
        def bid = json.bid
        def backlog = Backlog.findById(bid)
        if(backlog.user == user)
        {
            return true
        }
        return false
    }
    
}
