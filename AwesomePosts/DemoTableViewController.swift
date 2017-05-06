//
//  DemoTableViewController.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
    var builder: TTableViewBuilder?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = Person(title: "John", detailText: "a")
        let p2 = Person(title: "Kate", detailText: "b")
        
        let persons = Array(arrayLiteral: p1,p2)
        
        let dataSource = TTableDataSource(sections: [TTableDataSource.TableSection(title: "Person", rows: persons)])
        
        
        builder = TTableViewBuilder(source: dataSource)
            .debug(true)
            .cellType(.Dynamic)
            .customTableCellName("TCustomTableViewCell")
            .onSelection { (indexPath) -> Void in
                print("You selected cell #\(indexPath.row)!")
            }
            .bind(tableView)
    }

}
