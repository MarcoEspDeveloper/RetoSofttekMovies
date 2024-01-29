//
//  MoviesViewProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation

protocol MoviesViewProtocol: AnyObject {
    
    func showBasicAlert(title:String?, message: String?)
    func showMovieList(fromSaved: Bool)
}
