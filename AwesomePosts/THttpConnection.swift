//
//  THttpBuilder.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import ObjectMapper


enum TBackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}

class THttpConnection {
    enum method {
        case get
        case post
    }
    
    var url:                    String!
    var dataResponseHandler:    ((Data) -> Void)?
    var stringResponseHandler:  ((String) -> Void)?
    var errorHandler:           ((Error) -> Void)?
    var debugging =             false
    
    
    init() {
    }
    
    init(URL: String) {
        self.url = URL
    }
    
    func url(_ URL: String) -> THttpResource {
        url = URL
        return self
    }
    
    func debug(_ debug: Bool) -> THttpResource {
        debugging = debug
        return self
    }
    
    func onDataResponseHandler(_ handler: @escaping (Data) -> Void) -> THttpResource {
        dataResponseHandler = handler
        return self
    }
    
    func onStringResponseHandler(_ handler: @escaping (String) -> Void) -> THttpResource {
        stringResponseHandler = handler
        return self
    }
    
    func onErrorHandler(_ handler: @escaping (Error) -> Void) -> THttpResource {
        errorHandler = handler
        return self
    }
    
    
    func start() {
        /*
            public init?(string: String, relativeTo url: URL?)

        */
        let request = URLRequest(url: URL(string: self.url)!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if  let data = data,
                let jsonString = String(data: data, encoding: String.Encoding.utf8) {
                
                if self.debugging {
                    print("json = \(jsonString)")
                }
                
                if let handler = self.dataResponseHandler {
                    handler(data)
                }
                
                if let handler = self.stringResponseHandler {
                    handler(jsonString)
                }
            } else if let error = error {
                self.errorHandler?(error)
            } else {
                let error = NSError(domain: "THttpResource", code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                self.errorHandler?(error)
            }
        }
        dataTask.resume()
    }
}
