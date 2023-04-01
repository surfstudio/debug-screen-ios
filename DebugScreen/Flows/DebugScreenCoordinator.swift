//
//  DebugScreenCoordinator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation
import UIKit

final class DebugScreenCoordinator: BaseCoordinator {

    // MARK: - Private properties

    private let router = MainRouter()

    // MARK: - Properties

    var completionHandler: (() -> Void)?

    // MARK: - Methods

    override func start() {
        showMainScreen()
    }

}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showMainScreen() {
        let (view, output) = MainModuleConfigurator().configure()
        output.didModuleClosed = { [weak self] in
            self?.router.dismissModule()
        }
        output.didActionOptionsShowed = { [weak self] model in
            self?.showCacheCleaningActions(model: model)
        }
        output.didModuleDismissed = { [weak self] in
            self?.completionHandler?()
        }
        router.present(view)
    }

    func showCacheCleaningActions(model: ActionsProviderModel) {
        let actionsSheet = UIAlertController(
            title: nil,
            message: model.message,
            preferredStyle: .actionSheet
        )
        model.actions.forEach { action in
            actionsSheet.addAction(UIAlertAction(
                title: action.title,
                style: .destructive) { _ in
                    action.block()
            })
        }
        actionsSheet.addAction(UIAlertAction(
            title: L10n.DebugScreenCoordinator.cancelAction,
            style: .cancel,
            handler: nil
        ))
        router.present(actionsSheet)
    }

}
