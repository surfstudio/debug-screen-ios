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
        case .alert(let model):
            showAlert(with: model.value as? String, isRoot: model.isRootModule)
        case .customScreen(let model):
            if let view = model.value as? DebugScreenPresentableController {
                showCustomScreen(screen: view, isRoot: model.isRootModule)
            }
        case .fileViewer(let model):
            if let filePath = model.value as? String {
                showFile(with: filePath, isRoot: model.isRootModule)
            }
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
        output.onActionListShow = { [weak self] model in
            self?.showActionList(model: model)
        }
        output.onAlertShow = { [weak self] message in
            self?.showAlert(with: message)
        }
        output.didModuleDismissed = { [weak self] in
            self?.completionHandler?()
        }
        router.present(view)
    }

    func showActionList(model: ActionList) {
        let actionsSheet = UIAlertController(title: nil,
                                             message: model.message,
                                             preferredStyle: .actionSheet)

        model.actions.forEach { model in
            let action = configureActionSheetItem(with: model)
            actionsSheet.addAction(action)
        }

        let cancelAction = UIAlertAction(title: L10n.Common.Actions.cancel,
                                         style: .cancel,
                                         handler: nil)
        actionsSheet.addAction(cancelAction)

        router.present(actionsSheet)
    }

    func showFile(with filePath: String, isRoot: Bool = false) {
        let (view, output) = FileViewerModuleConfigurator().configure(with: filePath)
        output.didModuleDismissed = { [weak self] in
            guard isRoot else {
                return
            }

            self?.completionHandler?()
        }
        router.present(view)
    }

    func showAlert(with message: String?, isRoot: Bool = false) {
        let view = SimpleAlertModuleConfigurator().configure(with: message) { [weak self] in
            guard isRoot else {
                return
            }

            self?.completionHandler?()
        }
        router.present(view)
    }

    func showCustomScreen(screen: DebugScreenPresentableController, isRoot: Bool = false) {
        let (view, output) = CustomScreenModuleConfigurator().configure(with: screen)
        output.didModuleDismissed = { [weak self] in
            guard isRoot else {
                return
            }

            self?.completionHandler?()
        }

        router.present(view)
    }

    func configureActionSheetItem(with model: any Action) -> UIAlertAction {
        let style: UIAlertAction.Style = model.style == .destructive ? .destructive : .default
        let action = UIAlertAction(title: model.title, style: style) { _ in
            model.block?()
        }

        return action
    }

}
