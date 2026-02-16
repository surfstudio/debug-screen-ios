//
//  SectionScreenPresenter.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import UIKit

final class SectionScreenPresenter: SectionScreenModuleOutput {

    // MARK: - SectionScreenModuleOutput

    var onActionListShow: ((ActionList) -> Void)?
    var onAlertShow: ((AlertModel) -> Void)?
    var onInfoTableShow: ((InfoTableModel) -> Void)?
    var onSectionScreenShow: ((SectionScreen) -> Void)?

    // MARK: - Properties

    weak var view: SectionScreenViewInput?

    // MARK: - Private Properties

    private let model: SectionScreen

    // MARK: - Initialization

    init(model: SectionScreen) {
        self.model = model
    }

}

// MARK: - SectionScreenModuleInput

extension SectionScreenPresenter: SectionScreenModuleInput { }

// MARK: - SectionScreenViewOutput

extension SectionScreenPresenter: SectionScreenViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: model.title, sections: model.sections)
    }

    func didTapActionList(model: ActionList) {
        onActionListShow?(model)
    }

    func didTapInfoTable(model: InfoTableModel) {
        onInfoTableShow?(model)
    }

    func didTapSelectableText(model: CopiedText) {
        UIPasteboard.general.string = model.value
        onAlertShow?(.init(message: L10n.MainPresenter.CopyTextAction.complete))
        debugPrint("✅ \(model.title) copied to clipboard")
    }

    func didTapSectionScreen(model: SectionScreen) {
        onSectionScreenShow?(model)
    }

}
