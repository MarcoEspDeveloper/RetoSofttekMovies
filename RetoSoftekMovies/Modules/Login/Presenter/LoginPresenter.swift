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
            
            loginView.showBasicAlert(title: NSLocalizedString("ERROR_TITLE", comment: ""), message: NSLocalizedString("WRONG_USER_PASS_MESSAGE", comment: ""))
        }
    }
    
    func validationEmptyFields(userText: String?, passText: String?) -> Bool {
        
        guard let userString = userText, let passString = passText else {
            
            return false
        }
        
        if !userString.isEmpty && !passString.isEmpty {
            
            return true
        }
        
        return false
    }
    
    func goToMovies() {
        
        self.router?.goToMovies()
    }
    
    func goToErrorPopUp(title: String, message: String) {
        
        self.router?.showErrorPopUp(title: title, message: message)
    }
}
