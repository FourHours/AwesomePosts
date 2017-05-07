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

struct TTableDataSource {
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

typealias TSection = TTableDataSource.TableSection

class TTableViewBuilder: NSObject {
    enum TableCellType {
        case Value1
        case Nib
        case Dynamic
    }
    
    var dataSource:             TTableDataSource!
    var selection:              ((IndexPath, Mappable) -> Void)?
    var bindingTableView:       UITableView!
    var cellType =              TableCellType.Value1
    var debugging =             false
    var customClassName:        String!
    
    
    init(source: TTableDataSource) {
        dataSource = source
    }
    
    func bind(_ tableView: UITableView) -> TTableViewBuilder {
        bindingTableView = tableView
        
        bindingTableView?.delegate = self
        bindingTableView?.dataSource = self
        
        switch cellType {
        case .Value1:
            bindingTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellItentifier())
        case .Nib:
            if debugging {
                print("cellClassName = \(customClassName)")
            }
            bindingTableView?.register(UINib(nibName: customClassName, bundle: nil), forCellReuseIdentifier: customClassName)
        default: break
        }
        
        
        
        return self
    }
    
    func onSelection(_ sel: @escaping (IndexPath, Mappable) -> Void) -> TTableViewBuilder {
        selection = sel
        return self
    }
    
    func customTableCellName(_ name: String) -> TTableViewBuilder {
        
        if debugging {
            print("customTableCellName = \(name)")
        }
        customClassName = name
        return self
    }
    
    func debug(_ debug: Bool) -> TTableViewBuilder {
        debugging = debug
        return self
    }
    
    func cellType(_ type: TableCellType) -> TTableViewBuilder{
        cellType = type
        return self
    }
}

extension TTableViewBuilder: UITableViewDelegate, UITableViewDataSource {
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
            let tableCell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellItentifier())
            tableCell.configure(row: dataSource[indexPath])
            return tableCell
            
        case .Nib, .Dynamic:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TCustomTableViewCell", for: indexPath)
            cell.configure(row: dataSource[indexPath])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(indexPath, dataSource[indexPath])
    }
    
    func cellItentifier() -> String {
        return String(describing: type(of: self))
    }
}

/*
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
 */
