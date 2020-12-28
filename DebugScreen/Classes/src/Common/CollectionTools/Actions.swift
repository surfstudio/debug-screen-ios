//
//  Actions.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit.UICollectionView
import UIKit.UITableView


protocol CellViewModelSelectable {
    var didSelect: (() -> Void)? { get set }
}


protocol CellViewModelHeightable {
    func heightForTableView(_ tableView: UITableView) -> CGFloat
}


protocol CellViewModelSizeable {
    func size(for parentView: UICollectionView) -> CGSize
}


protocol CellViewModelDisplayable {
    var willDisplay: (() -> Void)? { get set }
}
