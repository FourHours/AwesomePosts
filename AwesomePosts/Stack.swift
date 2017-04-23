//
//  Stack.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/23/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

class Stack<T> {
    var container = [T]()
    
    init(_ array: [T]) {
        container += array
    }
    
    func push(_ element: T) {
        container.append(element)
    }
    
    func popup() -> T? {
        return container.popLast()
    }
    
    func top(_ number: Int) -> [T]? {
        //ArraySlice
        if number > container.count { return .none }
        return Array(container.suffix(number))
    }
}
