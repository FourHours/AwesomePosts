//
//  DemoTableViewController.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit
import ObjectMapper

class TDemoTableViewController: UITableViewController, TInjectProperty {
    var props: Dictionary<String, Any>?

    var builder: TTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = TBasicTableRow(title: "John", detailText: "a")
        let p2 = TBasicTableRow(title: "Kate", detailText: "b")
        
        let persons = Array(arrayLiteral: p1,p2)
        
        let dataSource = TTableDataSource(sections: [TSection(title: "Person", rows: persons)])
        
        
        builder = TTableView(source: dataSource)
            .debug(true)
            .cellType(.Dynamic)
            .customTableCellName("TCustomTableViewCell")
            .onSelection { (indexPath, emlement) -> Void in
                print("You selected cell #\(indexPath.row)!")
            }
            .bind(tableView)
        
        THttpConnection()
            .debug(true)
            .url("http://example.com/")
            .onStringResponseHandler { (json) in
//                let list = Mapper<TBasicTableRow>().mapArray(JSONString: json)
            }
            .onDataResponseHandler({ (data) in
                print(data)
            })
            .onErrorHandler({ (error) in
                print(error.localizedDescription)
            })
            .start()
    }
}







