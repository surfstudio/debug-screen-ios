//
//  UIButton.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import UIKit

extension UIButton {

    func set(backgroundColor: UIColor, for state: UIControl.State) {
        setBackgroundImage(UIImage(color: backgroundColor), for: state)
    }

    func set(backgroundColor: UIColor, for states: [UIControl.State]) {
        states.forEach { setBackgroundImage(UIImage(color: backgroundColor), for: $0) }
    }

    func setTitleForAllState(_ title: String?) {
        setTitle(title, for: .normal)
        setTitle(title, for: .disabled)
        setTitle(title, for: .highlighted)
        setTitle(title, for: .selected)
    }

    func setTitleColor(_ color: UIColor, for states: [UIControl.State]) {
        states.forEach { setTitleColor(color, for: $0) }
    }

}
