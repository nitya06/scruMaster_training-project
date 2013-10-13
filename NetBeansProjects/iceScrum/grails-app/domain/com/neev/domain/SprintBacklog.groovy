package com.neev.domain

class SprintBacklog {

    Sprint sprint
    Backlog backlog
    
    static belongsTo = [ sprint : Sprint, backlog : Backlog ]
    
    static constraints = {
    }
}