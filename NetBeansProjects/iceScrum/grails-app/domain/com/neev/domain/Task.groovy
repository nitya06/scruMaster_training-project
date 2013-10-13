package com.neev.domain

class Task {
    String name
    String description
    String status
    java.sql.Date dateCreated
    java.sql.Date lastUpdated  
    java.sql.Date endDate
    
    Sprint sprint
    User user
    Backlog backlog
    
    static belongsTo = [ sprint : Sprint , user:User , backlog : Backlog]
   
    static constraints = {
        endDate nullable:true
    }
    
     static mapping = {
        autoTimestamp false
    }
}