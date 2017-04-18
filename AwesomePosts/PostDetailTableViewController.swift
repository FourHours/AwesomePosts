//
//  PostDetailTableViewController.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/8/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit
import Static

class PostDetailTableViewController: TableViewController {
    // MARK: - UI Controls
    struct InjectedProperty {
        let viewModel: ApplicationViewModel
        let postId: Int
    }
    var injected: InjectedProperty!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80.0
        
        self.title = "Comments"
        
        if let sections = self.injected.viewModel.postDetailTableSectionsByPostId(self.injected.postId) {
            dataSource.sections = sections
        }        
    }
}
