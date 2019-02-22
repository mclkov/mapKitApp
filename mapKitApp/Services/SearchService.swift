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
    
}

class SearchService {
    static let shared = SearchService()
    
}
