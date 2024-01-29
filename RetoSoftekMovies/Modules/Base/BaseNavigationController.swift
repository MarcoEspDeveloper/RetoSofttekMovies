//
//  BaseNavigationController.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
}
