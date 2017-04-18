//
//  AppliationErrorType.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/16/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation

enum ApplicationError: Error {
    case Bad(String)
    case Worse(String)
    case Terrible(String)
}
