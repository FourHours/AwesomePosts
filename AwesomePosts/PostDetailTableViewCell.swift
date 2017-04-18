//
//  PostDetailTableViewCell.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/14/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import UIKit
import Static

final class PostDetailTableViewCell: UITableViewCell, Cell {
    
    // MARK: - Properties
    private lazy var centeredLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    
    // MARK: - Initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(centeredLabel)
        
        NSLayoutConstraint.activate([
            centeredLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            centeredLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            centeredLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            centeredLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            centeredLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: 8)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - CellType
    func configure(row: Row) {
        centeredLabel.text = row.text
    }
}
