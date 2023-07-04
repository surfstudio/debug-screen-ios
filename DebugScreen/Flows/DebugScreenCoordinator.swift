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

    func open(module: ModuleType) {
        switch module {
        case .alert(let model):
            showAlert(with: model)
        case .customScreen(let screen):
            showCustomScreen(screen)
        case .fileViewer(let model):
            showFile(with: model)
        case .infoTable(let model):
            showInfoTable(with: model)
        }
    }

}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showMainScreen() {
        let (view, output) = MainModuleConfigurator().configure()
        output.onActionListShow = { [weak self] model in
            self?.showActionList(model: model)
        }
        output.onAlertShow = { [weak self] model in
            self?.showAlert(with: model)
        }
        output.onInfoTableShow = { [weak self] model in
            self?.showInfoTable(with: model)
        }
        output.didModuleClosed = { [weak self] in
            self?.router.dismissModule()
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

    func showFile(with model: FileViewerModel) {
        let (view, _) = FileViewerModuleConfigurator().configure(with: model)
        router.present(view)
    }

    func showAlert(with model: AlertModel) {
        let view = SimpleAlertModuleConfigurator().configure(with: model)
        router.present(view)
    }

    func showInfoTable(with model: InfoTableModel) {
        let (view, output) = InfoTableModuleConfigurator().configure(with: model)
        output.didModuleClosed = { [weak self] in
            self?.router.popModule()
        }

        router.push(view)
    }

    func showCustomScreen(_ screen: UIViewController) {
        let view = UINavigationController(rootViewController: screen)
        view.modalPresentationStyle = .overFullScreen

        router.present(view)
    }

    func configureActionSheetItem(with model: Action) -> UIAlertAction {
        let style: UIAlertAction.Style = model.style == .destructive ? .destructive : .default
        let action = UIAlertAction(title: model.title, style: style) { _ in
            model.block?()
        }

        return action
    }

}
