//
//  ErrorHandler.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/15/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import Foundation
import UIKit


protocol ErrorHandler {
    func handleError(_ error: Error)
}

extension ErrorHandler {
    func handleError(_ error: Error) {
        print(error.localizedDescription)
    }
}

extension ErrorHandler where Self: UIViewController {
    func handleError(_ error: Error) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
