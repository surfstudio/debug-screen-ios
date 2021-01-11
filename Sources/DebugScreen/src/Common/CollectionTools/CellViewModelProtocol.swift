//
//  CellViewModelProtocol.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit.UIView


protocol CellViewModelProtocol {
    static var reuseIdentifier: String { get }
    static var cellType: UIView.Type { get }
    static var bundle: Bundle { get }
}


extension CellViewModelProtocol {
    static var reuseIdentifier: String {
        return "\(self.cellType).\(self)"
    }

    static var bundle: Bundle {
        return Bundle(for: self.cellType)
    }
}
