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

    var didModuleClosed: (() -> Void)?
    var onActionListShow: ((ActionList) -> Void)?
    var onAlertShow: ((String) -> Void)?
    var didModuleDismissed: (() -> Void)?

    // MARK: - Properties

    weak var view: MainViewInput?

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
        view?.setupInitialState(sections: DebugScreenConfiguration.shared.sections)
    }

    func didTapActionList(model: ActionList) {
        onActionListShow?(model)
    }

    func didTapSelectableText(model: CopiedText) {
        UIPasteboard.general.string = model.value
        onAlertShow?(L10n.MainPresenter.CopyTextAction.complete)
        debugPrint("✅ \(model.title) copied to clipboard")
    }

    func didTapCloseButton() {
        didModuleClosed?()
    }

}
