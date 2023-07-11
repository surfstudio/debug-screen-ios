//
//  UIButton.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

extension UIButton {

    func configure(style: ActionStyle) {
        var appearance = ButtonAppearance.appearance(for: style)

        switch style {
        case .primary:
            appearance = DebugScreenConfiguration.shared.colorScheme.buttonConfigurations.primary
        case .secondary:
            appearance = DebugScreenConfiguration.shared.colorScheme.buttonConfigurations.secondary
        case .destructive:
            appearance = DebugScreenConfiguration.shared.colorScheme.buttonConfigurations.destructive
        }

        clipsToBounds = true
        layer.cornerRadius = 12

        titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        setTitleColor(appearance.textColor, for: .normal)
        setTitleColor(appearance.textColor, for: .highlighted)
        setTitleColor(appearance.textColor, for: .disabled)

        set(backgroundColor: appearance.normalBackground, for: .normal)
        set(backgroundColor: appearance.highlightedBackground, for: [.highlighted, .selected])
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
