//
//  PostTableViewCell.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/8/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit
import Static

class PostTableViewCell: UITableViewCell, Cell {
    @IBOutlet weak var postLable: UILabel!
    
    static func nib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    // MARK: - CellType
    func configure(row: Row) {
        postLable.text = row.text
    }
}
