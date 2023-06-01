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

    // MARK: - Public Methods

    public func showDebugScreen() {
        guard coordinator == nil else {
            return
        }

        configureCoordinator()
        coordinator?.start()
    }

    public func showAlert(with message: String) {
        if coordinator == nil {
            configureCoordinator()
        }

        coordinator?.handle(deepLinkOption: .alert(message: message))
    }

    public func openLogFile() {
        if coordinator == nil {
            configureCoordinator()
        }

        let logFilePath = DebugScreenConfiguration.shared.logCatcherService.logFilePath
        coordinator?.handle(deepLinkOption: .fileViewer(path: logFilePath))
    }

}

// MARK: - Private Methods

private extension DebugScreenPresenterService {

    func configureCoordinator() {
        coordinator = DebugScreenCoordinator()
        coordinator?.completionHandler = { [weak self] in
            self?.coordinator = nil
        }
    }

}
