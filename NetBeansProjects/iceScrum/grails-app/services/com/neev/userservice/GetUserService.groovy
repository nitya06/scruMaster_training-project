package com.neev.userservice

import com.neev.domain.User;
import grails.transaction.Transactional

@Transactional
class GetUserService {

    def serviceMethod() {

    }
    
    def getAllUsers()
    {
        User user= new User()
        List list = user.findAll()
        return list
    }
}

