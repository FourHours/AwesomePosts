//
//  DemoTableViewController.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
    var builder: TableViewBuilder?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = TableCell(title: "John", detailText: "a")
        let p2 = TableCell(title: "Kate", detailText: "b")
        
        let persons = Array(arrayLiteral: p1,p2)
        
        let dataSource = TableDataSource(sections: [TableDataSource.TableSection(title: "Person", rows: persons)])
        
        
        builder = TableViewBuilder(source: dataSource)
            .cellType(.Value1)
            .debug(true)
            .onSelection { (indexPath) -> Void in
                print("You selected cell #\(indexPath.row)!")
            }
            .bind(tableView: tableView)
    }

}
