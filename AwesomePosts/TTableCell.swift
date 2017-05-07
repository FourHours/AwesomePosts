//
//  TableCell.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol TTableCell: class{
    func configure(row: Mappable)
}

extension TTableCell {

}

extension TTableCell where Self: UITableViewCell {
    public func configure(row: Mappable) {
        if let person = row as? TBasicTableRow {
            textLabel?.text = person.title
        }
//        textLabel?.text = row.text
//        detailTextLabel?.text = row.detailText
//        imageView?.image = row.image
//        accessoryType = row.accessory.type
//        accessoryView = row.accessory.view
    }
}

extension UITableViewCell: TTableCell {

}

