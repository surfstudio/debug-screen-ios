//
//  DebugScreenPresenterService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

public final class DebugScreenPresenterService {

    // MARK: - Static Properties

    public static let shared = DebugScreenPresenterService()

    // MARK: - Private Properties

    private var coordinator: DebugScreenCoordinator?

    // MARK: - Initialization

    private init() { }

    // MARK: - Methods

    public func showDebugScreen() {
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
