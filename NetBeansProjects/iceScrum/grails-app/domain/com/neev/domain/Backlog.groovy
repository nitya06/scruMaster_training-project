package com.neev.domain

class Backlog {
     String name
     String description
     Project projects
     User user
     Release1 release
     Sprint sprint
     static hasMany = [ task : Task ]
         
     static constraints = {
         sprint nullable:true
         
     }
}