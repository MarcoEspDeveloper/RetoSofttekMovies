//
//  LoginPresenter.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var loginView: LoginViewProtocol!
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    init(view: LoginViewProtocol) {
        self.loginView = view
        self.interactor = LoginInteractor()
        self.router = LoginRouter(withView: self.loginView)
    }
    
    func goToValidateUser(userName: String?, userPassword: String?) {
        
        let isValidUser = self.interactor?.getUserValidation(userLoginInfo: UserRequest(userName: userName ?? "", userPassword: userPassword ?? "")) ?? false
        
        if isValidUser {
            
            self.loginView.showNextModule()
        } else {
            
            loginView.showBasicAlert(title: "Error", message: "El usuario y/o la contraseña son incorrectos.")
        }
    }
    
    func goToMovies() {
        
        self.router?.goToMovies()
    }
    
    func goToErrorPopUp(title: String, message: String) {
        
        self.router?.showErrorPopUp(title: title, message: message)
    }
}
