//
//  Result.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/18/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)


    func flatMap<U>(f: (T) -> Result<U>) -> Result<U> {
        switch self {
        case let .success(t): return f(t)
        case let .failure(err): return .failure(err)
        }
    }
    
//    func errorHandler<U>(result: (Result<U>)) -> Void {
//        
//    }
//    
//    func flatMap<U>(f: @escaping (T, (Result<U>)) -> Void)
//        -> ((Result<U>) -> Void) {
//            return {
//                completion in
//                switch self {
//                case let .success(t): f(t,completion)
//                case let .failure(err): return self.errorHandler(result: self)
//                }
//            }
//    }
}

/*
 */

/*
 This is functional programming
 
 func readFile(fileName: String) -> Result<Data> {}
 func toJson(data: Data) -> Result<Dictionary> {}
 func toCar(dic: Dictionary) -> Result<Car> {}
 
 let userResult = readFile("car.json")
                    .flatMap(toJson)
                    .flatMap(toCar)
 */
