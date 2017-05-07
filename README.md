# AwesomePosts
The goal was to design and implement a clean and testable MVVM production application.

[Project requirements] are detailed here.

### TTableViewBuilder Sample
        let p1 = TBasicTableRow(title: "John", detailText: "a")
        let p2 = TBasicTableRow(title: "Kate", detailText: "b")        
        let persons = Array(arrayLiteral: p1,p2)        
        let dataSource = TTableDataSource(sections: [TSection(title: "Person", rows: persons)])
        
        builder = TTableViewBuilder(source: dataSource)
            .debug(true)
            .cellType(.Dynamic)
            .customTableCellName("TCustomTableViewCell")
            .onSelection { (indexPath, emlement) -> Void in
                print("You selected cell #\(indexPath.row)!")
            }
            .bind(tableView)
### THttpResource Sample
        THttpResource()
            .debug(true)
            .url("http://example.com/")
            .onStringResponseHandler { (json) in
                let list = Mapper<TBasicTableRow>().mapArray(JSONString: json)
            }
            .onDataResponseHandler({ (data) in
                print(data)
            })
            .onErrorHandler({ (error) in
                print(error.localizedDescription)
            })
            .start()
### TSequeBuilder Sample

### ObjectMapper Sample
         let user = Mapper<User>().map(JSONString: JSONString)
         let JSONString = Mapper().toJSONString(user, prettyPrint: true)
         let list = Mapper<TBasicTableRow>().mapArray(JSONString: json)

### Architecture - MVVM
* Thin ViewControllers
   * No mutable states
   * No callbacks
   * PostsViewController: 86 lines
   * PostDetailTableViewController: 32 lines
* Testable View Model 
   * Supply all ViewControllers states
   * Capture all business logics
   * Ability to init with mock data for Unit Test
   * Unit Test demoed by **testFindUserById**
* Unified Error Handler
   * Protocol ErrorHandler with default behavior
   * Custom behavior for ViewContollers
* Dependency Injection
   * External dependencies are injected for all ViewControllers
   * Captured in dedicated **struct InjectedProperty**
* Resource Abstraction
   * Extendable self-contained generic Resource struct
* Offline support
   * Cache data with CoreData framework
   * Persistable protocol for extension 
### User Interface
* Pull to refresh
* Auto resizing UITableViewCell
* Dynamic Font size
### Discussion
* Preload or on demand lazy loading remote resources
  * The app loads all 3 resources at one go to avoid waiting while user navigate to detail screen
  * Static remote resources
  * Few resources
  * While applicable, should prefer on-demand requests 
* Third party library
   * Conditions to integrate third party library
### Technical Debt
* Localization
* UI styling
* Full code coverage Unit Tests
* UI Tests
* iPhone Only
* Lack of custom application error type
* Comments and Documentation
* CI integration 
### Developement Environment
* Xcode 8.3
* Swift 3
### Cocoapods Dependencies
* pod "PromiseKit", "~> 4.0"
* pod 'ObjectMapper', '~> 2.2'
* pod 'MBProgressHUD', '~> 1.0.0'
* pod 'ReactiveCocoa', '~> 5.0.0'
* pod 'Static', git: 'https://github.com/venmo/Static'
* pod "MagicalRecord"
