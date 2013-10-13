package com.neev.domain

class ReleaseBacklog {

    Release1 release
    Backlog backlog
    
    static belongsTo = [ release : Release1, backlog : Backlog ]
    static constraints = {
    }
}
