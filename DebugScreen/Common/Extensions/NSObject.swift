//
//  NSObject.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

@objc
extension NSObject {

    /// Return class name
    class var className: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

}
