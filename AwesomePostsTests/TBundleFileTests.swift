//
//  TBundleFileTests.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import XCTest
@testable import AwesomePosts


class TBundleFileTests: XCTestCase {
    func testReadInfoPlist() {
        TBundleFile(fileName: "Info", ext: "plist")
            .dataType(.dictionary)
            .onSuccessDictionayHandler({ (dic) in
                XCTAssertEqual(dic["CFBundleDevelopmentRegion"] as! String, "en")
            })
            .start()
    }
}
