//
//  LoginInteractor.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    func getUserValidation(userLoginInfo: UserRequest) -> Bool {
        
        let userData = UserModel()
        
        if userLoginInfo.userName != userData.email {
            
            return false
        }
        
        if userLoginInfo.userPassword != userData.passwrd {
            
            return false
        }
        
        return true
    }
}
