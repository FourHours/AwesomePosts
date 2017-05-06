//
//  TCustomTableViewCell.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper


class TCustomTableViewCell: UITableViewCell{
    
    @IBOutlet weak var headline: UILabel!
    
    public static func identifier() -> String {
        return String(describing: type(of: self))
    }
    func configure(row: Mappable) {
        if let person = row as? Person {
            headline?.text = person.title
        }
    }
}
