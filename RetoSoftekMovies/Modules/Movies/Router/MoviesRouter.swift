//
//  MoviesRouter.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation
import UIKit

class MoviesRouter {
    
    private weak var moviesViewProtocol: MoviesViewProtocol!
    
    init(withView view: MoviesViewProtocol) {
        self.moviesViewProtocol = view
    }
}

extension MoviesRouter: MoviesRouterProtocol {
    
    func goToMovieDetail(movieViewModel: MovieViewModel) {
        
        let originViewController = self.moviesViewProtocol as! MoviesViewController
        let destinyViewController = MoviesAssembly.build(movie: movieViewModel)
        
        originViewController.navigationController?.pushViewController(destinyViewController, animated: true)
    }
    
    func showErrorPopUp(title: String, message: String) {
        
        let alertVC = MoviesAssembly.build(title: title, message: message)
        let originViewController = self.moviesViewProtocol as! MoviesViewController
        originViewController.present(alertVC, animated: true, completion: nil)
    }
}
