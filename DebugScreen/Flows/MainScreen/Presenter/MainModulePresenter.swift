//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation
import UIKit

final class MainModulePresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var onActionListShow: ((ActionList) -> Void)?
    var onAlertShow: ((AlertModel) -> Void)?
    var onInfoTableShow: ((InfoTableModel) -> Void)?
    var onNestedScreenShow: ((NestedScreen) -> Void)?
    var didModuleClosed: (() -> Void)?
    var didModuleDismissed: (() -> Void)?

    // MARK: - Properties

    weak var view: MainViewInput?

    // MARK: - Private Properties

    private let title: String
    private let sections: [TableSection]

    // MARK: - Initialization

    init(title: String, sections: [TableSection]) {
        self.title = title
        self.sections = sections
    }

    // MARK: - Deinitialization

    deinit {
        didModuleDismissed?()
    }

}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput { }

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func viewLoaded() {
        view?.setupInitialState(
            title: title,
            sections: sections
        )
//        view?.setupInitialState(
//            title: L10n.MainViewController.debugTitle,
//            sections: DebugScreenConfiguration.shared.sections
//        )
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

    func didTapNestedScreen(model: NestedScreen) {
        onNestedScreenShow?(model)
    }

    func didTapCloseButton() {
        didModuleClosed?()
    }

}
