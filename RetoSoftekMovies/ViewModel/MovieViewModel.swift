//
//  MovieViewModel.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation

struct MovieViewModel {
    
    var title: String?
    var poster: String?
    var voteAverage: Double?
    var releaseDate: String?
    var overview: String?
    
    init(title: String?, poster: String?, voteAverage: Double?, releaseDate: String?, overview: String?) {
        
        self.title = title
        self.poster = poster
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.overview = overview
    }
}
