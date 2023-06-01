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

    override func handle(deepLinkOption option: DeepLinkOption) {
        switch option {
        case .alert(let message):
            showAlert(with: message)
        case .fileViewer(let path):
            showFile(with: path)
        }
    }

}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showMainScreen() {
        let (view, output) = MainModuleConfigurator().configure()
        output.didModuleClosed = { [weak self] in
            self?.router.dismissModule()
        }
        output.onActionsListShow = { [weak self] model in
            self?.showActionsList(model: model)
        }
        output.onAlertShow = { [weak self] message in
            self?.showAlert(with: message)
        }
        output.didModuleDismissed = { [weak self] in
            self?.completionHandler?()
        }
        router.present(view)
    }

    func showActionsList(model: ActionsList) {
        let actionsSheet = UIAlertController(title: nil,
                                             message: model.message,
                                             preferredStyle: .actionSheet)

        model.actions.forEach { actionModel in
            let action = UIAlertAction(title: actionModel.title, style: .destructive) { _ in
                actionModel.block?()
            }

            actionsSheet.addAction(action)
        }

        let cancelAction = UIAlertAction(title: L10n.Common.Actions.cancel,
                                         style: .cancel,
                                         handler: nil)
        actionsSheet.addAction(cancelAction)

        router.present(actionsSheet)
    }

    func showFile(with filePath: String) {
        let (view, _) = FileViewerModuleConfigurator().configure(with: filePath)
        router.present(view)
    }

    func showAlert(with message: String?) {
        let view = SimpleAlertModuleConfigurator().configure(with: message)
        router.present(view)
    }

}
