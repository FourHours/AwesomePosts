//
//  TCoceInjectionable.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import UIKit

protocol TInjectProperty: class {
    var props: Dictionary<String, Any>? {set get}
}

/*
extension TCodeInjectable where Self: UIViewController {
    var props: Dictionary<String, Any>

}
 */
