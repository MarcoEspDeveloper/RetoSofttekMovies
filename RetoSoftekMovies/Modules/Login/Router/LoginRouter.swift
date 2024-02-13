//
//  LoginRouter.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

class LoginRouter {
    
    private weak var loginViewProtocol: LoginViewProtocol!
    
    init(withView view: LoginViewProtocol) {
        self.loginViewProtocol = view
    }
}

extension LoginRouter: LoginRouterProtocol {
    
    func goToMovies() {
        
        let originViewController = self.loginViewProtocol as! LoginViewController
        let destinyViewController = MoviesAssembly.build()
        let navController = MoviesAssembly.buildNav(viewController: destinyViewController)
        
        originViewController.present(navController, animated: true)
    }
    
    func showErrorPopUp(title: String, message: String) {
        
        let alertVC = LoginAssembly.build(title: title, message: message)
        let originViewController = self.loginViewProtocol as! LoginViewController
        originViewController.present(alertVC, animated: true, completion: nil)
    }
}
