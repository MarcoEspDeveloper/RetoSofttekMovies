//
//  LoginInteractorProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

protocol LoginInteractorProtocol {
    
    func getUserValidation(userLoginInfo: UserRequest) -> Bool
}
