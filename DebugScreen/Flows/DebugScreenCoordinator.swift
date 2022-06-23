//
//  DebugScreenCoordinator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation
import UIKit

final class DebugScreenCoordinator: BaseCoordinator {

    // MARK: - Constants

    private enum Constants {
        static let clearCache = "Clear cache"
        static let cancelAction = "Cancel"
    }

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

        components.output.closeModuleBlock = { [weak self] in
            self?.navigationController.dismiss(animated: true, completion: self?.completionHandler)
        }

        components.output.showCacheClearingOptionsBlock = { [weak self] (actions: [CacheCleanerAction]) in
            self?.showCacheCleaningActions(actions: actions)
        }

        router.present(navigationController)
    }
}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showCacheCleaningActions(actions: [CacheCleanerAction]) {
        let actionsSheet = UIAlertController(title: nil, message: Constants.clearCache, preferredStyle: .actionSheet)

        actions.forEach { action in
            actionsSheet.addAction(UIAlertAction(title: action.title, style: .destructive) { _ in
                action.block()
            })
        }

        actionsSheet.addAction(UIAlertAction(title: Constants.cancelAction, style: .cancel, handler: nil))

        self.navigationController.present(actionsSheet, animated: true, completion: nil)
    }

}
