//
//  Post.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import ObjectMapper
import CoreData
import MagicalRecord

struct Post: Mappable {
    var userId:     Int?
    var postId:     Int?
    var title:      String?
    var body:       String?
    
    init?(map: Map) {
    }
    
    init() {
    }
    
    mutating func mapping(map: Map) {
        userId      <- map["userId"]
        postId      <- map["id"]
        title       <- map["title"]
        body        <- map["body"]
    }
}

extension Post: Persistable {
    func save() {
        MagicalRecord.save({ (context) in
            let postCoreData = PostCoreData.mr_createEntity(in: context)
            postCoreData?.postId = Int32(self.postId ?? 0)
            postCoreData?.userId = Int32(self.userId ?? 0)
            postCoreData?.title = self.title
            postCoreData?.body = self.body
            
        })
    }
    
    mutating func load(managedObject: NSManagedObject) {
        if let managedObject = managedObject as? PostCoreData {
            self.userId = Int(managedObject.userId)
            self.postId = Int(managedObject.postId)
            self.title = managedObject.title
            self.body = managedObject.body
        }
    }
 
}

