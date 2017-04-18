//
//  Persistable.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/15/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import CoreData

protocol Persistable {
    func save()
    mutating func load(managedObject: NSManagedObject)
}
