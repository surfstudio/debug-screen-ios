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
    private let navigationController = UINavigationController()

    // MARK: - Public properties

    var completionHandler: (() -> Void)?

    // MARK: - Methods

    override func start() {
        var components: MainModuleComponents = MainModuleConfigurator().configure()
        navigationController.setViewControllers([components.view], animated: false)
        navigationController.modalPresentationStyle = .overFullScreen

        components.output.didModuleClosed = { [weak self] in
            self?.navigationController.dismiss(animated: true, completion: self?.completionHandler)
        }

        components.output.didCacheClearingOptionsShowed = { [weak self] (actions: [CacheCleanerAction]) in
            self?.showCacheCleaningActions(actions: actions)
        }

        router.present(navigationController)
    }
}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showCacheCleaningActions(actions: [CacheCleanerAction]) {
        let actionsSheet = UIAlertController(
            title: nil,
            message: L10n.DebugScreenCoordinator.clearCache,
            preferredStyle: .actionSheet
        )

        actions.forEach { action in
            actionsSheet.addAction(UIAlertAction(title: action.title, style: .destructive) { _ in
                action.block()
            })
        }

        actionsSheet.addAction(UIAlertAction(
            title: L10n.DebugScreenCoordinator.cancelAction,
            style: .cancel,
            handler: nil
        ))

        self.navigationController.present(actionsSheet, animated: true, completion: nil)
    }

}
