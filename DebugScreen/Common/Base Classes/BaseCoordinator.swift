//
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

/// Provides base realisation of coordinator's methods
/// Subclass from this base class for making new flow coordinator
class BaseCoordinator: Coordinator {

    // MARK: - Properties

    var childCoordinators: [Coordinator] = []

    // MARK: - Initialization

    init() {
        debugPrint("🎂 \(self) created")
    }

    // MARK: - Deinitialization

    deinit {
        debugPrint("❗️\(self) deinitialized")
    }

    // MARK: - Methods

    func start() {
        start(with: nil)
    }

    func start(with deepLinkOption: DeepLinkOption?) { }

    // Add only unique object
    func addDependency(_ coordinator: Coordinator) {
        guard !haveDependency(coordinator) else {
            return
        }
        childCoordinators.append(coordinator)
        debugPrint("✅ \(coordinator) added into \(self)")
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard
            !childCoordinators.isEmpty,
            let coordinator = coordinator
        else {
            return
        }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    func removeAllChilds() {
        guard !childCoordinators.isEmpty else { return }

        for coordinator in childCoordinators {
            if let coordinator = coordinator as? BaseCoordinator {
                coordinator.removeAllChilds()
            }
        }

        childCoordinators.removeAll()
    }

}

// MARK: - Private Methods

private extension BaseCoordinator {

    func haveDependency(_ coordinator: Coordinator) -> Bool {
        childCoordinators.contains { $0 === coordinator }
    }

}
