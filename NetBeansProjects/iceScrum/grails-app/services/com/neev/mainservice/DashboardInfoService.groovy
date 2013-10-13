package com.neev.mainservice

import grails.transaction.Transactional
import com.neev.domain.*

@Transactional
class DashboardInfoService {

    def getAllAssignedTask(def user)
    {
        def list = Task.findAllByUser(user)
        return list
    }
    
    def getAllCreatedProject( def user )
    {
        def list  = Project.findAllByUser(user)
        return list
    }
    
    boolean updateAssignedTask(def json)
    {     
        def task = Task.findById(json.task_id)
        task.status=json.status
        if( task.save() )
        {  
            def tasks=Task.findAllBySprint(task.sprint) 
            def sprint_id
            boolean status=true
            for(t in tasks)
            {
                sprint_id=t.sprint
                if(t.status!="Completed")
                {
                    status=false
                    break
                }
            }
            if(status==true)
            {
                
                
                def sprint=Sprint.findById(sprint_id.id)       //sid sprintid
                
                sprint.status="Completed"
                
                if(sprint.save())
                {
                    
                    boolean sprintStatus=true
                    
                    def release= Release1.findById(sprint.release.id)
                    
                    def sprints= Sprint.findByRelease(release)
                    
                    for(s in sprints)
                    {
                        if(s.status!="Completed")
                        {
                            sprintStatus=false
                            break
                        }
                    }
                    if(sprintStatus==true)
                    {
                        
                        release.status="Completed"
                        if(release.save())
                        {
                            boolean releaseStatus=true
                            def project= Project.findById(release.project.id)
                            
                            def releases= Release1.findByProject(project)
                            
                            for(r in releases)
                            {
                                if(r.status!="Completed")
                                {
                                    releaseStatus=false
                                    break
                                }
                            }
                            if(releaseStatus==true)
                            {
                                project.status="Completed"
                                if(project.save())
                                {
                                    
                                    return true
                                }
                            }
                            return true
                        }
                    }
                    return true     //return false because release is not changed
                }
            }
            else //if(status==false)          //if not all tasks are completed
            {
                if(task.status=="In Progress")       //if current task is updated to InProgress
                {
                    def sprint = Sprint.findById(task.sprint.id)  //sid sprintId
                    sprint.status="In Progress"
                    if(sprint.save())
                    {
                        def release=Release1.findById(sprint.release.id)
                        release.status="In Progress"
                        if(release.save())
                        {
                            def project= Project.findById(release.project.id)
                            project.status="In Progress"
                            if(project.save())
                            {
                                return true
                            }
                        }
                    }
                }   
                return true
            }
        }
        else
        {
           return false
        }
    }
    
   
    
    
    
    def getTaskStatus(def json)
    {
        def Task = Task.findById(json.tid)
        def status = Task.status
        return status
    }
    
    
}