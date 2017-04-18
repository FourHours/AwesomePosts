//
//  User.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/8/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
    var userId:     Int?
    var name:       String?
    var userName:   String?
    var email:      String?
    var address:    [String : AnyObject] = [:]
    var geo:        [String : AnyObject] = [:]
    var phone:      String?
    var website:    String?
    var company:    [String : AnyObject] = [:]
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        userId      <- map["id"]
        name        <- map["name"]
        userName    <- map["username"]
        email       <- map["email"]
        address     <- map["address"]
        geo         <- map["geo"]
        phone       <- map["phone"]
        website     <- map["website"]
        company     <- map["company"]
    }
}
