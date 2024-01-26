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
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let navController = storyboard.instantiateViewController(withIdentifier: "MoviesNavigation")
        
        return navController
    }
}
