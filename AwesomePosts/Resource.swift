//
//  Resource.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/14/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import PromiseKit
import ObjectMapper

struct Resource<T> where T:Mappable {
    let url: String
    
    func start<T>() -> Promise<[T]> where T:Mappable {
        return Promise { fulfill, reject in
            let request = URLRequest(url: URL(string: self.url)!)
            
            URLSession.shared.dataTask(with: request)
                .then { data -> Void in
                    if  let json = String(data: data, encoding: String.Encoding.utf8),
                        let list = Mapper<T>().mapArray(JSONString: json) {
                            fulfill(list)
                    }
                    else {
                        let error = NSError(domain: "AwesomePosts", code: 0,
                                            userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                        reject(error)
                    }
                }
                .catch(execute: reject)
        }
    }
    
    func fetch<T>() -> Promise<[T]> where T:Mappable {
        return Promise { fulfill, reject in
            let request = URLRequest(url: URL(string: self.url)!)
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data,
                    let json = String(data: data, encoding: String.Encoding.utf8),
                    let list = Mapper<T>().mapArray(JSONString: json) {
                    fulfill(list)
                } else if let error = error {
                    reject(error)
                } else {
                    let error = NSError(domain: "AwesomePosts", code: 0,
                                        userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                    reject(error)
                }
            }
            dataTask.resume()
        }
    }
}
