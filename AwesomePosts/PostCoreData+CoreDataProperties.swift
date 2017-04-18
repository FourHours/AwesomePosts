//
//  PostCoreData+CoreDataProperties.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/15/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import CoreData


extension PostCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostCoreData> {
        return NSFetchRequest<PostCoreData>(entityName: "PostCoreData")
    }

    @NSManaged public var body: String?
    @NSManaged public var postId: Int32
    @NSManaged public var title: String?
    @NSManaged public var userId: Int32

}
