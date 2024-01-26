//
//  LoginViewController.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresenterProtocol?
    var configurator: LoginConfiguratorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = LoginConfigurator()
        configurator?.configure(viewController: self)
        
        self.setupView()
    }

}

// MARK: - General Functions
extension LoginViewController {
    
    func setupView() {
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleViewTap)))
        view.isUserInteractionEnabled = true
    }
    
    @objc func handleViewTap() {
        
        view.endEditing(true)
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        
        self.presenter?.goToValidateUser(userName: self.userTextField.text, userPassword: self.passwordTextField.text)
    }
}

// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    
    func showNextModule() {
        self.presenter?.goToMovies()
    }
    
    func showBasicAlert(title: String?, message: String?) {
        
        self.presenter?.goToErrorPopUp(title: title ?? "", message: message ?? "")
    }
}

