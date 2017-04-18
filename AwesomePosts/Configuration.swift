//
//  Configuration.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/8/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//
import Foundation
import UIKit

enum Configuration {
    static let applicationTintColor = UIColor.blue
    static let baseUrl = "http://jsonplaceholder.typicode.com/"
    
    static var postUrl: String {
        return "\(baseUrl)posts"
    }
    
    static var commentsUrl: String {
        return "\(baseUrl)comments"
    }
    
    static var usersUrl: String {
        return "\(baseUrl)users"
    }
}
