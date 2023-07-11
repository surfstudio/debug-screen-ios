//
//  HeaderViewModel.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 04.07.2023.
//

import UIKit

struct HeaderViewModel {

    // MARK: - Properties

    let text: String?
    let textColor: UIColor
    let backgroundColor: UIColor
    let font: UIFont

    // MARK: - Initialization

    init(
        text: String?,
        textColor: UIColor = DebugScreenConfiguration.shared.colorScheme.textColor,
        backgroundColor: UIColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor,
        font: UIFont = .systemFont(ofSize: 20, weight: .heavy)
    ) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.font = font
    }

}
