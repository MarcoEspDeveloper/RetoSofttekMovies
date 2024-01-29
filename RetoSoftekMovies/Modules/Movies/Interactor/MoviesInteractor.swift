//
//  MoviesInteractor.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation

class MoviesInteractor: MoviesInteractorProtocol {
    
    var presenter: MoviesPresenterProtocol?
    var repository: MoviesRepositoryProtocol?
    
    init(presenter: MoviesPresenterProtocol) {
        
        self.presenter = presenter
        self.repository = MoviesRepository()
    }
    
    func getMovieList(page: Int) {
        
        self.repository?.getMovieList(page: page) { (response, error) in
            
            if let moviesResponse = response {
                
                self.presenter?.didGetMovieList(movieList: moviesResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetMovieList(error: error as! ErrorModel)
            }
        }
    }
}
