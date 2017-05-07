//
//  TSequeBuilder.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 5/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import UIKit

/*
 guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("identifier") as? SecondViewController else {
 print("Could not instantiate view controller with identifier of type SecondViewController")
 return
 }
 
 vc.resultsArray = self.resultsArray
 self.navigationController?.pushViewController(vc, animated:true)
 */

/*
 override func prepare(for segue: UIStoryboardSegue, sender: Any?)
 */

class TSequeBuilder {
    var destViewController: String
    var props:              Dictionary<String, Any>
    var source:             UIViewController
    var storyboardName =    "Main"
    
    init(source: UIViewController, dest: String, props: Dictionary<String, Any>) {
        self.destViewController = dest
        self.props = props
        self.source = source
    }
    
    func storyboardName(_ name: String) -> TSequeBuilder {
        self.storyboardName = name
        return self
    }
    
    func push() {
        guard let vc = UIStoryboard(name:self.storyboardName, bundle:nil).instantiateViewController(withIdentifier: "identifier") as? TCodeInjectable
            else {
            print("Could not instantiate view controller with identifier of type SecondViewController")
            return
        }
        vc.props = self.props
        source.navigationController?.pushViewController(vc as! UIViewController, animated: true)

    }
    
    func present() {
        guard let vc = UIStoryboard(name:self.storyboardName, bundle:nil).instantiateViewController(withIdentifier: "identifier") as? TCodeInjectable
            else {
                print("Could not instantiate view controller with identifier of type SecondViewController")
                return
        }
        vc.props = self.props

        source.present(vc as! UIViewController, animated: true, completion: nil)
    }
    
    func perform() {
        
    }
}
