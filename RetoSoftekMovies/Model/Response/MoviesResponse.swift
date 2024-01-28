//
//  MoviesResponse.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation

struct MoviesResponse: Decodable {
    
    var page: Int?
    var results: [MovieModel]?
    var total_pages: Int?
    var total_results: Int?
}
