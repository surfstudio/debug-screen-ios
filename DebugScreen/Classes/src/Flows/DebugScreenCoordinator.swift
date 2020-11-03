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

    // MARK: - Public methods

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

        components.output.showSelectServerBlock = { [weak self] in
            self?.showSelectServer()
        }

        router.present(navigationController)
    }
}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showCacheCleaningActions(actions: [CacheCleanerAction]) {
        let actionsSheet = UIAlertController(title: nil, message: "Clear cache", preferredStyle: .actionSheet)

        for action in actions {
            actionsSheet.addAction(UIAlertAction(title: action.title, style: .destructive, handler: { (_: UIAlertAction) in
                action.block()
            }))
        }

        actionsSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.navigationController.present(actionsSheet, animated: true, completion: nil)
    }

    func showSelectServer() {
        guard let provider: SelectServerActionsProvider = DebugScreenConfiguration.shared.selectServerActionsProvider else {
            assertionFailure("Impossible!")
            return
        }

        let components: SelectServerModuleComponents = SelectServerModuleConfigurator().configure(provider: provider)

        self.navigationController.pushViewController(components.view, animated: true)
    }

}
