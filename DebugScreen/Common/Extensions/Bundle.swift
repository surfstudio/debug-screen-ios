//
//  Bundle.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 29.04.2022.
//

import Foundation

extension Bundle {

    static func getBundle(for type: AnyClass) -> Bundle {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: type)
        #endif
    }

}
