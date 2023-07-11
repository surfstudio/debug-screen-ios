//
//  UITableViewCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 23.06.2023.
//

import UIKit

extension UITableViewCell {

    func setDefaultStyle() {
        selectionStyle = .none
        backgroundColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor
    }

}
