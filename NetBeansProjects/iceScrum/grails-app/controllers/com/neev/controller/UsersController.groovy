package com.neev.controller
import grails.converters.*
import groovy.json.JsonBuilder
import com.neev.domain.User
import com.neev.userservice.*
import grails.converters.JSON
import com.neev.mainservice.*


class UsersController {
  JsonBuilder builder = new JsonBuilder();
    def saveDataService
    def validationService
    def setForgetPasswordService
    def getUserService
    def commonUserValidationService
    def projectInfoService
    
    def index() 
    {
        redirect(action:"/users/LoginPage")
    }
    
    
    
    def addData()
    {
        if( User.findByEmail(params.email) )
        {
            flash.message="This user already Registered!!"
            render(view:"/users/LoginPage")
        }
        else
        {
             String status = saveDataService.saveData(params.name , params.email , params.password)
             if(status=="vailidData")
             {
                 flash.message="SignUp Successfully !!"
                 redirect(action:"LoginPage")
             }
             else if(status=="msgSendingFail")
             {
                 flash.message="Email-Id is Invalid"
                 render(view:"/users/LoginPage")
             }
             else if(status=="dataNotValid")
             {
                 flash.message="Information Invalid"
                 render(view:"/users/LoginPage")
             }
        }
              
    }
    
    
    def verify()
    {
        String status = validationService.verifyToken(params.token)
        render(view:"/users/${status}")
    }
    
    
    
    
    def verifySignIn()
    {
       if( validationService.verifyEmail(params.email) )
       {
           if( validationService.verifyPassword( params.email ,params.password) )
           {
               if( validationService.verifyStatus(params.email) )
               {
                   
                   flash.message="You are successfully Login !!!!!"
                     
                     def sessionToken = saveDataService.getSessionToken(params.email)
                     def username = saveDataService.saveSessionToken(params.email , sessionToken)
                    //nitya
                     def email = saveDataService.saveEmailId(sessionToken)
                     println sessionToken
                     redirect(action:"home" , controller:"project", params:[sessionToken:sessionToken, username:username ,email:email]) 
                  
               }else
               {
                   flash.message="First verify your account !!!!!"
                   render(view:"/users/LoginPage")
               }
         
           }else
           {
               flash.message="Password is incorrect!!!!!"
               render(view:"/users/LoginPage")
           }
           
       }else
       {
            flash.message="Email-Id is Invalid !!!!!"
            render(view:"/users/LoginPage") 
       }
        
    }
    
  
    def sendEmail()
    {
       
        if( validationService.verifyEmail(params.email)   )
        { 
           setForgetPasswordService.setForgetPasswordToken(params.email)
           flash.message="check your email for reset your password"
           render(view:"/users/LoginPage")
        }
        else
        {
            flash.message="Email-Id is invalid !!"
            render(view:"/users/getEmailForPassword")
        }
       
        
    }
    

   
    def enterEmail()
    {
        render(view:"/users/getEmailForPassword")
    }
    
    
    
    
    def newPassword()
    {
        
        def user = validationService.verifyForgetPasswordToken(params.passwordtoken)
        if(user)
        {
           render(view:"/users/resetPassword",model: [email:user.email])
        }
        else
        {
            render(view:"/users/alreadyVerifiedForPassword")
        }
    }    
    

    def setPassword()
    {
        if(  saveDataService.updatePassword(params.new_password,params.email))
        {
            flash.message="Your password has been changed !!"
            render(view:"/users/LoginPage")
        }
        else
        {
            flash.message="Some internal Error"
            render(view:"/users/LoginPage")
        }  
    }
    
    
     def signOut()
    {
       
        saveDataService.nullSessionToken(params.token)
        flash.message="LogOut Successfully !!!!!!!"
        redirect(action:"LoginPage")
    }
   
    def LoginPage()
    {
        
    }
    
    
    
    def getAllUsers()
    {
        def json = params
       
        println json.token
        def user = commonUserValidationService.verifySessionToken(json.token)
        
        if(user)
        {
            List list = getUserService.getAllUsers()
            render list as JSON
        }
        else
        {
            builder.response(status:"user authentication fail",code:"500");    
            render builder.toString();
        }   
    }
    
    //nitya
    def updateProfile()//def json
   {
       println"=================================" 
       def json=request.JSON
       println "============ token is"+json.token
       def user = commonUserValidationService.verifySessionToken(json.token)
    println"in contro;errrrrrrrrr"
       if(user)
        {
            if(saveDataService.updateProfile(json))
            { println"entrerd for chng pswd"
                builder.response(status:"password changed",code:"200")   
                render builder.toString()
             //redirect(action:"/View1/project")
        
            }
            else 
                {
                    println" paasword nt chngd"
                
                builder.response(status:"password not changed",code:"500");    
               render builder.toString();
                }
           
        }
        else
        {
             println" session lost"
                builder.response(status:"session expired",code:"500");    
               render builder.toString()
         }
           
    //return "session expired"
} 
   


}


