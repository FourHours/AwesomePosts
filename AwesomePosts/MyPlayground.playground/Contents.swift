//: Playground - noun: a place where people can play

import UIKit
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


