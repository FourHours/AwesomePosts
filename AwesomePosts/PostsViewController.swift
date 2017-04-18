//
//  PostsViewController.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit
import MBProgressHUD
import PromiseKit
import ReactiveCocoa
import ReactiveSwift
import Static

class PostsViewController: UIViewController, ErrorHandler {
    // MARK: - UI Controls
    @IBOutlet weak var tableView: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()

    // MARK: - States
    let viewModel = ApplicationViewModel()
    let dataSource = DataSource()
    var viewTitle: String = NSLocalizedString("Posts", comment: "Posts view title");
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = viewTitle
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100.0
        
        self.tableView.addSubview(self.refreshControl)
        
        viewModel.posts.producer.startWithValues { [weak self] posts in
            if let sections = self?.viewModel.postsTableSections(selection: self!.cellSelected) {
                self?.dataSource.sections = sections
            }
        }
        
        self.dataSource.tableView = self.tableView

        viewModel.isLoading.producer.startWithValues { [weak self] isLoading in
            if isLoading {
                MBProgressHUD.showAdded(to: (self?.view)!, animated: true)
            }
            else {
                MBProgressHUD.hide(for: (self?.view)!, animated: true)
                self?.refreshControl.endRefreshing()
            }
        }
        
        viewModel.error.producer.startWithValues { [weak self] (error) in
            if let error = error {
                self?.handleError(error)
            }
        }

        //Go to fetch the data
        viewModel.fetchPosts()
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        viewModel.fetchPosts()
    }
    
    func cellSelected(post: Post) {
        guard let postId = post.postId else {
            return
        }
        let viewController = PostDetailTableViewController(style: .grouped)
        
        viewController.injected = PostDetailTableViewController.InjectedProperty(viewModel: self.viewModel, postId: postId)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

