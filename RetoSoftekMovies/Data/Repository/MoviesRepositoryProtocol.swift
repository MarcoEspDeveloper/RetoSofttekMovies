//
//  MoviesRepositoryProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation

protocol MoviesRepositoryProtocol {
    
    func getMovieList(page: Int, completion: @escaping (MoviesResponse?, Error?) -> Void)
}
