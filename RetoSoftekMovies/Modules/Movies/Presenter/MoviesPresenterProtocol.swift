//
//  MoviesPresenterProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation

protocol MoviesPresenterProtocol {
    
    func getMovieList()
    func didGetMovieList(movieList: MoviesResponse)
    func failGetMovieList(error: ErrorModel)
    
    func getMovies() -> [MovieModel]
    func getSearchedMovies() -> [MovieModel]
    func putNewSearchedMoview(movie: MovieModel)
    func setSearchedMovies(movies: [MovieModel])
    func clearSearchedMovies()
    func getPage() -> Int
    func getTotalPages() -> Int
    
    func saveMovie(movie: MovieModel)
    
    func goToDetail(movie: MovieModel)
    func goToErrorPopUp(title: String, message: String)
}
