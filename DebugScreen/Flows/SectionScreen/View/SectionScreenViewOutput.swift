//
//  SectionScreenViewOutput.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

protocol SectionScreenViewOutput {
    func viewLoaded()
    func didTapActionList(model: ActionList)
    func didTapInfoTable(model: InfoTableModel)
    func didTapSelectableText(model: CopiedText)
    func didTapSectionScreen(model: SectionScreen)
}
