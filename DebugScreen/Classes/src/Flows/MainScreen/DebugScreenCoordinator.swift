//
//  DebugScreenCoordinator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

final class DebugScreenCoordinator: BaseCoordinator {

    // MARK: - Private properties

    private let router = MainRouter()
    private let navigationController = UINavigationController()

    // MARK: - Public properties

    var completionHandler: (() -> Void)?

    // MARK: - Public methods

    override func start() {
        var components: MainModuleComponents = MainModuleConfigurator().configure(output: nil)
        navigationController.setViewControllers([components.view], animated: false)
        navigationController.modalPresentationStyle = .overFullScreen

        components.output.closeModuleBlock = { [weak self] in
            self?.navigationController.dismiss(animated: true, completion: self?.completionHandler)
        }

        router.present(navigationController)
    }
}

// MARK: - Private methods

private extension DebugScreenCoordinator {

}
