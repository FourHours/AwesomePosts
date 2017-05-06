//
//  TBundleFile.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation

class TBundleFile {
    enum DataType {
        case array
        case dictionary
    }
    
    var fileName:   String
    var ext:        String
    var type =      DataType.dictionary
    
    var onSuccessDictionayHandler: (([String: AnyObject]) -> Void)!
    var onSuccessArrayHandler: (([Any]) -> Void)!
    
    init(fileName: String, ext: String) {
        self.fileName = fileName
        self.ext = ext
    }
    
    func dataType(_ type: DataType) -> TBundleFile {
        self.type = type
        return self
    }
    
    func start() -> Void {
        guard let path = Bundle.main.path(forResource: fileName, ofType: ext)
            else { return }
        
        switch self.type {
        case .dictionary:
            if let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
                onSuccessDictionayHandler(dict)
            }
        case .array:
            if let array = NSArray(contentsOfFile: path) as? [Any] {
                onSuccessArrayHandler(array)
            }
        }
    }
    
    func onSuccess(handler: @escaping ([String: AnyObject]) -> Void) -> TBundleFile {
        onSuccessDictionayHandler = handler
        return self
    }
    
    func onFailure() -> TBundleFile {
        return self
    }
}

func test() {
    TBundleFile(fileName: "a", ext: "b")
        .dataType(.dictionary)
        .onSuccess { (array) in
            print(array)
        }
        .onFailure()
        .start()
 
}




