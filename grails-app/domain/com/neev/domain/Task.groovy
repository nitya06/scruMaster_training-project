package com.neev.domain

class Task {
    String name
    String description
    String status
    Project project
    Sprint sprint
    User user
    UserStory userStory
    
    static belongsTo = [ project: Project , sprint : Sprint , user:User , userStory : UserStory]
   
    static constraints = {

        user nullable:true
        sprint nullable:true
        userStory nullable:true
    }
    
     static mapping = {
        autoTimestamp false
        version false
        description type: "text"
    }
}