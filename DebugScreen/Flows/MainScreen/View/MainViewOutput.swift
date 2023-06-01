//
//  MainViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

protocol MainViewOutput {
    func viewLoaded()
    func didTapActionsList(model: ActionsList)
    func didTapSelectableText(model: CopiedText)
    func didTapCloseButton()
}
