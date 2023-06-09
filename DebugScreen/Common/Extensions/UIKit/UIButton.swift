//
//  UIButton.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

extension UIButton {

    func configure(type: ActionType) {
        clipsToBounds = true
        layer.cornerRadius = 12

        titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        setTitleColor(type.titleColor, for: .normal)
        setTitleColor(type.titleColor, for: .highlighted)
        setTitleColor(type.titleColor, for: .disabled)

        set(backgroundColor: type.backgroundColor, for: .normal)
        set(backgroundColor: type.highlightedBackgroundColor, for: [.highlighted, .selected])
    }

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
