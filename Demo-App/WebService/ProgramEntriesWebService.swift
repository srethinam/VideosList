//
//  APIService.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import Foundation

class ProgramEntriesWebService :  NSObject {
    
    private let urlSession: URLSession!
    
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }

    func fetchProgramEntriesData(completion : @escaping (Programs?, ProgramEntriesError?) -> Void){
        guard let url = URL(string: urlString) else {
            completion(nil, ProgramEntriesError.invalidRequestUrlString)
            return
        }

        let dataTask = urlSession.dataTask(with: url) { (data, urlResponse, error) in
            
            if let requestError = error {
                completion(nil, ProgramEntriesError.failedRequestError(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let programEnriesData = try? JSONDecoder().decode(Programs.self, from: data) {
                completion(programEnriesData, nil)
                
            } else {
                completion(nil, ProgramEntriesError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
}
