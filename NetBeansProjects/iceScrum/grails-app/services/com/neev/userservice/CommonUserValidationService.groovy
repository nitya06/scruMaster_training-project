package com.neev.userservice

import grails.transaction.Transactional
import com.neev.domain.*

@Transactional
class CommonUserValidationService {

    def verifySessionToken(def sessionToken)
    {
        def user = User.findBySession_token(sessionToken)
        if(user)
        {
            return user
        }
        return null
    }
}
