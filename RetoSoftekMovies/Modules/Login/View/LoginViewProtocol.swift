//
//  LoginViewProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    
    func showNextModule()
    func showBasicAlert(title:String?, message: String?)
}
