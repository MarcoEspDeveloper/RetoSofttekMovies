//
//  MovieModel.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation

struct MovieModel: Decodable {
    
    var id: Int64?
    var title: String?
    var original_title: String?
    var overview: String?
    var release_date: String?
    var poster_path: String?
    var vote_average: Double?
}
