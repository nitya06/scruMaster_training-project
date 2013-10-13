package com.neev.domain


class ProjectMembers {

     Project projects
     User users
    
     static belongsTo = [ projects : Project, users : User ]
    
    static constraints = {
    }
}