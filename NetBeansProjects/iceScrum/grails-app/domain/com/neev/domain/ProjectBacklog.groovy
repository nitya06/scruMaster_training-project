package com.neev.domain

class ProjectBacklog {
 
    Project project
    Backlog backlog
    
    static belongsTo = [ project : Project, backlog : Backlog ]
    static constraints = {
    }
}
