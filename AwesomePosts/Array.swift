//
//  Array.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/26/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation

public extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}

/*
 currentStat.statEvents.categorise { $0.name }
 [
 dinner: [
 StatEvents(name: "dinner", date: "01-01-2015", hours: 1),
 StatEvents(name: "dinner", date: "01-01-2015", hours: 1),
 StatEvents(name: "dinner", date: "01-01-2015", hours: 1)
 ], lunch: [
 StatEvents(name: "lunch", date: "01-01-2015", hours: 1),
 StatEvents(name: "lunch", date: "01-01-2015", hours: 1)
 ]
 ]
 */
