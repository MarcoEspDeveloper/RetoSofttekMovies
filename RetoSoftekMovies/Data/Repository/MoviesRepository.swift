//
//  MoviesRepository.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import Foundation

class MoviesRepository: MoviesRepositoryProtocol {
    
    let baseUrl = "\(Constants.ConnectionUrl.baseUrl)"
    
    private let dataSource: ServiceDataSourceProtocol?
    
    init() {
        self.dataSource = ServiceDataSource()
    }
    
    func getMovieList(page: Int, completion: @escaping (MoviesResponse?, Error?) -> Void) {
        
        let urlPath = "\(baseUrl)\(Constants.ConnectionUrl.moviesUrl)?page=\(page)&api_key=\(Constants.ConnectionUrl.urlApiKey)"
        
        self.dataSource?.getServiceRequestGet(urlPath: urlPath) { (result) in
                
            switch result {
            case .success(let movies):
                guard let moviesResponse = try? JSONDecoder().decode(MoviesResponse?.self, from: movies as! Data) else {
                    
                    let newError = ErrorModel(code: 0, description: NSLocalizedString("GENERAL_ERROR_MESSAGE", comment: ""))
                    
                    completion(nil, newError)
                    
                    return
                }
                
                completion(moviesResponse, nil)
            case .failure(let error):
                let newError = ErrorModel(code: error.code, description: error.localizedDescription)
                
                completion(nil, newError)
            }
        }
    }
}
