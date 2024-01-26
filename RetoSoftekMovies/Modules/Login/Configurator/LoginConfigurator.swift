//
//  LoginConfigurator.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(viewController: LoginViewController) {
        
        viewController.presenter = LoginPresenter(view: viewController)
    }
}
