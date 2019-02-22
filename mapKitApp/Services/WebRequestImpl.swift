//
//  WebRequest.swift
//  mapKitApp
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

class WebRequestImpl: WebRequest {
    var url: String
    var method: String
    
    private var path: String?
    private var request: URLRequest?
    private var userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
    
    
    required init(url: String, method: String) {
        self.url = url
        self.method = method
    }
    
    func setPath(path: String) {
        self.path = path
    }
    
    func setUserAgent(_ userAgent: String) {
        self.userAgent = userAgent
    }
    
    func appyUserAgent() {
        request?.setValue(self.userAgent, forHTTPHeaderField: "User-Agent")
    }
    
    func execute() {
        guard let url = parseUrl() else { return }
        request = URLRequest(url: url)
        self.appyUserAgent()
    }
    
    func parseUrl() -> URL? {
        var urlString = "\(url)"
        if let path = self.path {
            urlString += path
        }
    
        guard let url = URL(string: urlString) else {
            print("Cannot parse url: ", urlString)
            return nil
        }
        
        return url
    }
}
