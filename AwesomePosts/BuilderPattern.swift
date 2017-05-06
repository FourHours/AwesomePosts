//
//  BuilderPattern.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/6/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation

class NameBuilder{
    
    private var firstName = ""
    private var lastName = ""
    
    func setFirstName(f: String){
        firstName = f
    }
    
    func setLastName(l: String){
        lastName = l
    }
    
    func toString() -> String{
        return "\(firstName) \(lastName)"
    }
    
}

/*
 let builder = NameBuilder()
 builder.setFirstName("Vandad")
 builder.setLastName("Nahavandipoor")
 print(builder.toString())
 */

class Boy {
    
    func jump() -> Self{
        print("Jumping...")
        return self
    }
    
    func run() -> Self{
        print("Running...")
        return self
    }
    
    func restFor(seconds: Int) -> Self{
        print("Resting for \(seconds) seconds")
        return self
    }
    
    func stop() -> Self{
        print("Stopping")
        return self
    }
}
/*
 Boy().run().run().jump().run().restFor(10).jump().stop()
 */


typealias FluentQueueTask = () -> ()

class FluentSerialQueue {
    
    func onBackround(task: FluentQueueTask) -> Self{
        return self
    }
    
    func onMainThread(task: FluentQueueTask) -> Self{
        
        return self
    }
    
    func start() -> Self{
        return self
    }
    
}

/*
 FluentSerialQueue().onBackround { () -> () in
 println("Background 1, thread = \(NSThread.currentThread())")
 }.onMainThread { () -> () in
 println("Main 1, thread = \(NSThread.currentThread())")
 }.onBackround { () -> () in
 println("Background 2, thread = \(NSThread.currentThread())")
 }.onMainThread { () -> () in
 println("Main 2, thread = \(NSThread.currentThread())")
 }.start()
 */
