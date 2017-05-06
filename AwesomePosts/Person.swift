//
//  Person.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//
import ObjectMapper

class Person: Mappable {
    var title:          String?
    var detailText:           String?
    
    required init?(map: Map) {
    }
    
    init(title: String, detailText: String) {
        self.title = title
        self.detailText = detailText
    }
    
    func mapping(map: Map) {
        title               <- map["title"]
        detailText          <- map["detailText"]
    }
}
