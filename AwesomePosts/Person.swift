//
//  Person.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//
import ObjectMapper

class Person: Mappable {
    var firstName:          String?
    var lastName:           String?
    
    required init?(map: Map) {
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func mapping(map: Map) {
        firstName       <- map["firstName"]
        lastName        <- map["lastName"]
    }
}
