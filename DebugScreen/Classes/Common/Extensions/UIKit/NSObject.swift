//
//  NSObject.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

public extension NSObject {

    @objc class var className: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

    @objc var className: String {
        if let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

}
