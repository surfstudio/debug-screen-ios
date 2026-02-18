//
//  MainViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

protocol MainViewOutput {
    func viewLoaded()
    func didTapActionList(model: ActionList)
    func didTapInfoTable(model: InfoTableModel)
    func didTapSelectableText(model: CopiedText)
    func didTapNestedScreen(model: NestedScreen)
    func didTapCloseButton()
}
