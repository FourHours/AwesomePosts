//
//  Comment.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/8/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import ObjectMapper

struct Comment: Mappable {
    var postId:     Int?
    var commentId:  Int?
    var name:       String?
    var email:      String?
    var body:       String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        postId      <- map["postId"]
        commentId   <- map["id"]
        name        <- map["name"]
        email       <- map["email"]
        body        <- map["body"]
    }
}

