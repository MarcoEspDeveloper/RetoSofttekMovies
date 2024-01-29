//
//  MoviesConfigurator.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation

class MoviesConfigurator: MoviesConfiguratorProtocol {
    
    func configure(viewController: MoviesViewController) {
        
        viewController.presenter = MoviesPresenter(view: viewController)
    }
}
