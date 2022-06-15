//
//  DebugScreenPresenterService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

final class DebugScreenPresenterService {

    // MARK: - Public properties

    static let shared = DebugScreenPresenterService()

    // MARK: - Private properties

    private var coordinator: DebugScreenCoordinator?

    // MARK: - Initialization

    private init() { }

    // MARK: - Public methods

    func handleMotionEnded() {
        guard coordinator == nil else {
            return
        }

        coordinator = DebugScreenCoordinator()
        coordinator?.start()
        coordinator?.completionHandler = { [weak self] in
            self?.coordinator = nil
        }
    }
}
