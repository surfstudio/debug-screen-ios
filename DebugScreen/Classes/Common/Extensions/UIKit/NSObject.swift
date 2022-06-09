//
//  NSObject.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

@objc
public extension NSObject {

    class var className: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

    var className: String {
        if let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

}
