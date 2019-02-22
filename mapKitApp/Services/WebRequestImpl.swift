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
    var method: RequestMethod
    
    private var path: String?
    private var request: URLRequest?
    private var userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
    
    
    required init(website: String, method: RequestMethod) {
        self.url = website
        self.method = method
    }
    
    func setPath(_ path: String) {
        self.path = path
    }
    
    func setUserAgent(_ userAgent: String) {
        self.userAgent = userAgent
    }
    
    func appyUserAgent() {
        request?.setValue(self.userAgent, forHTTPHeaderField: "User-Agent")
    }
    
    func execute(completionHandler: @escaping (_ result: Data?) -> Void) {
        guard let request = parseUrl() else { return }
        self.appyUserAgent()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) {
            (data, urlResponse, error) in
            // check for any errors
            guard error == nil else {
                print("Error: calling GET")
                print(error!)
                completionHandler(nil)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                completionHandler(nil)
                return
            }
            
            print(responseData)
            completionHandler(responseData)
        }
        task.resume()
    }
    
    func getRequest() -> URLRequest? {
        guard let url = parseUrl() else { return nil }
        return URLRequest(url: url)
    }
    
    func parseUrl() -> URL? {
        var urlString = "\(url)"
        if let path = self.path {
            guard let path = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                print("Error: cannot parse url path")
                return nil
            }
            urlString += path
        }
    
        guard let url = URL(string: urlString) else {
            print("Cannot parse url: ", urlString)
            return nil
        }
        
        return url
    }
}
