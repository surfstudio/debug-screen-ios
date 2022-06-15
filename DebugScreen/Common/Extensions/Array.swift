//
//  Array.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 29.04.2022.
//

import Foundation

extension Array {

    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }

}
