//
//  AppDelegate.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import UIKit
import CoreData
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MagicalRecord.setupCoreDataStack()        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        MagicalRecord.cleanUp()
    }
}

