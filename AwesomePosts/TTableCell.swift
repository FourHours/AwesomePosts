//
//  TableCell.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol TTableCellDatasource: class{
    func configure(row: Mappable)
}

class TBasicTableCell: UITableViewCell, TTableCellDatasource {
    public func configure(row: Mappable) {
        if let rowData = row as? TBasicTableRow {
            textLabel?.text = rowData.title
        }
    }
}


