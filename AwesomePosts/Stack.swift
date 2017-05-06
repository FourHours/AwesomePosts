//
//  Stack.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/23/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

struct Stack<T> {
    private lazy var container:[T] = {
       return [T]()
    }()
    
    mutating func push(_ element: T) {
        container.append(element)
    }
    
    mutating func popup() -> T? {
        return container.popLast()
    }
    
    mutating func top(_ number: Int) -> [T]? {
        //ArraySlice
        if number > container.count { return .none }
        return Array(container.suffix(number))
    }
}

struct Queue {
    func enqueue(element: Int) {
        
    }
    
    func dequeue() -> Int {
        return 0
    }
}


