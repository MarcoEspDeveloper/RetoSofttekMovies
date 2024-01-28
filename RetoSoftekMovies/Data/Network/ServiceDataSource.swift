//
//  ServiceDataSource.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation
import Alamofire

class ServiceDataSource: ServiceDataSourceProtocol {
    
    private var sessionManager: Session?
    
    init() {
        
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        
        self.sessionManager = Session(configuration: configuration)
    }
    
    func getServiceRequestGet(urlPath: String, completion: @escaping (Result<Any?, NSError>) -> Void) {
        
        let url = urlPath
        
        self.sessionManager?.request(url).validate().responseData(completionHandler: { (response) in
            
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                let newError = NSError(domain: url, code: (response.response?.statusCode ?? 0)!, userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                
                completion(.failure(newError))
            }
        })
    }
}
