//
//  CellUnit.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit.UIView


protocol CellProtocol {
    associatedtype Model: CellViewModelProtocol

    func setModel(_ model: Model)
}


class CellUnit<T: CellProtocol> {
    let model: T.Model
    let reuseIdentifier: String
    let cellType: UIView.Type
    let bundle: Bundle

    init(model: T.Model, reuseIdentifier: String, cellType: UIView.Type, bundle: Bundle) {
        self.model = model
        self.reuseIdentifier = reuseIdentifier
        self.cellType = cellType
        self.bundle = bundle
    }
}
