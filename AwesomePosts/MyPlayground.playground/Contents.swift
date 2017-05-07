//: Playground - noun: a place where people can play

import UIKit
import ObjectMapper

/*: 
 # ObjectMapper
 
     Int
     Bool
     Double
     Float
     String
     RawRepresentable (Enums)
     Array<AnyObject>
     Dictionary<String, AnyObject>
     Object<T: Mappable>
     Array<T: Mappable>
     Array<Array<T: Mappable>>
     Set<T: Mappable>
     Dictionary<String, T: Mappable>
     Dictionary<String, Array<T: Mappable>>
     Optionals of all the above
     Implicitly Unwrapped Optionals of the above
 
 */

/*:
    ObjectMapper Sample
 
 // Convert JSON String to Model
 let user = Mapper<User>().map(JSONString: JSONString)
 // Create JSON String from Model
 let JSONString = Mapper().toJSONString(user, prettyPrint: true)
 let list = Mapper<TBasicTableRow>().mapArray(JSONString: json)

 */

/*:
 builder = TTableViewBuilder(source: dataSource)
 .debug(true)
 .cellType(.Dynamic)
 .customTableCellName("TCustomTableViewCell")
 .onSelection { (indexPath, emlement) -> Void in
 print("You selected cell #\(indexPath.row)!")
 }
 .bind(tableView)
 */

var num = 4