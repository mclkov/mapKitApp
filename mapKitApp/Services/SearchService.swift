//
//  SearchService.swift
//  mapKitApp
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

enum RequestMethod {
    case get
    case post
}

protocol WebRequest {
    init(url: String, method: RequestMethod)
    func execute(completionHandler: @escaping (_ result: Data?) -> Void)
}

class SearchService {
    static let shared = SearchService()
    
    func findPlaces(query: String) {
        let url = getQueryString(query: query)
        let request: WebRequest = WebRequestImpl(url: url, method: .get)
        request.execute { (result) in
        guard let data = result else { return }
        
            do {
                let jsonData = try JSONDecoder().decode(ApiResponse.self, from: data)
                print(jsonData.count)
            } catch let jsonError {
                print("Error: serializing \(jsonError)")
            }
        }
    }
    
    func getQueryString(query: String) -> String {
        return "\(MainConstants.apiUrl)?query=\(query)&limit=\(MainConstants.resultsLimitPerRequest)&offset=0&fmt=json"
    }
}
