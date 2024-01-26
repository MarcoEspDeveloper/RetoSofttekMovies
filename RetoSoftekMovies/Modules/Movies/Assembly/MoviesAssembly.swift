//
//  MoviesAssembly.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation
import UIKit

class MoviesAssembly {
    
    static func build() -> UIViewController {
        
        let navController = UIStoryboard(name: "Movies", bundle: nil).instantiateViewController(withIdentifier: "MoviesNavigation")
        
        return navController
    }
}
