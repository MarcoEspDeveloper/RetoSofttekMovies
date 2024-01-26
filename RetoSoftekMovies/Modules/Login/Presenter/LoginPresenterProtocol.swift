//
//  LoginPresenterProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

protocol LoginPresenterProtocol {
    
    func goToValidateUser(userName: String?, userPassword: String?)
    func goToMovies()
    func goToErrorPopUp(title: String, message: String)
}
