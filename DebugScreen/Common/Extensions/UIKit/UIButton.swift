//
//  UIButton.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

extension UIButton {

    func configure(style: ActionStyle) {
        clipsToBounds = true
        layer.cornerRadius = 12

        titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        setTitleColor(style.titleColor, for: .normal)
        setTitleColor(style.titleColor, for: .highlighted)
        setTitleColor(style.titleColor, for: .disabled)

        set(backgroundColor: style.backgroundColor, for: .normal)
        set(backgroundColor: style.highlightedBackgroundColor, for: [.highlighted, .selected])
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
