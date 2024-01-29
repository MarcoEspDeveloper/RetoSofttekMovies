//
//  MoviesAssembly.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import Foundation
import UIKit

class MoviesAssembly {
    
    // MARK: - Build MoviesViewController wih navigation
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let navController = storyboard.instantiateViewController(withIdentifier: "MoviesNavigation")
        
        return navController
    }
    
    // MARK: - Build DetailMovieViewController
    static func build(movie: MovieViewModel) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let detailMovieViewController = storyboard.instantiateViewController(withIdentifier: "DetailMovieViewController") as! DetailMovieViewController
        detailMovieViewController.movieViewModel = movie
        
        return detailMovieViewController
    }
    
    // MARK: - Build Alert Messages
    static func build(title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
}
