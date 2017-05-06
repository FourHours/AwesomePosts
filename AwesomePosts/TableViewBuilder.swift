//
//  TableViewBuilder.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

struct TableDataSource {
    struct TableSection {
        var title: String?
        var rows: [Mappable]?
    }
    
    struct TableRow {
    }

    var sections = [TableSection]()
    
    init(sections: [TableSection]) {
        self.sections = sections
    }

    mutating func insertSection(_ section: TableSection) {
        sections.append(section)
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    subscript(indexPath: IndexPath) -> Mappable {
        get {
            return (sections[indexPath.section].rows?[indexPath.row])!
        }
    }
    
    subscript(section: Int) -> TableSection {
        get {
            assert(section < sections.count, "Index out of range")
            return sections[section]
        }
    }

}

class TableViewBuilder: NSObject {
    enum TableCellType {
        case Value1
        case Nib
    }
    
    var dataSource:             TableDataSource
    var selection:              ((IndexPath) -> Void)?
    var bindingTableView:       UITableView?
    var cellType =              TableCellType.Value1
    var debugging =             false
    
    
    init(source: TableDataSource) {
        dataSource = source
    }
    
    func bind(tableView: UITableView) -> TableViewBuilder {
        bindingTableView = tableView
        
        bindingTableView?.delegate = self
        bindingTableView?.dataSource = self
        
        switch cellType {
        case .Value1:
            bindingTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellItentifier())
        default: break
        }
        
        return self
    }
    
    func onSelection(sel: @escaping (IndexPath) -> Void) -> TableViewBuilder {
        selection = sel
        return self
    }
    
    func debug(_ debug: Bool) -> TableViewBuilder {
        debugging = debug
        return self
    }
    
    func cellType(_ type: TableCellType) -> TableViewBuilder{
        cellType = type
        return self
    }
}

extension TableViewBuilder: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if(debugging) {
            print("numberOfSections = \(dataSource.numberOfSections())")
        }
        return dataSource.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(debugging) {
            print("section = \(section), numberOfRowsInSection = \(dataSource[section].rows?.count ?? 0)")
        }
        return dataSource[section].rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(debugging) {
            print("cellType = \(cellType), cellForRowAt = \(indexPath.row)")
        }
        
        switch cellType {
        case .Value1:
            let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellItentifier())
            let element = dataSource[indexPath] as? TableCell
            cell.textLabel?.text = element?.title
            cell.detailTextLabel?.text = element?.detailText
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellItentifier(), for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(indexPath)
    }
    
    func cellItentifier() -> String {
        return String(describing: type(of: self))
    }
}
