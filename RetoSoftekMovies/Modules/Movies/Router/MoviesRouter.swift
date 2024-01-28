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
    
    func goToMovieDetail(originViewController: MoviesViewController, movieViewModel: MovieViewModel) {
        
        
    }
}
