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
        let model = DeepLinkOptionModel(value: message, isRootModule: coordinator == nil)

        if coordinator == nil {
            configureCoordinator()
        }

        coordinator?.handle(deepLinkOption: .alert(model: model))
    }

    public func openLogFile() {
        let model = DeepLinkOptionModel(value: DebugScreenConfiguration.shared.logCatcherService.logFilePath,
                                        isRootModule: coordinator == nil)

        if coordinator == nil {
            configureCoordinator()
        }

        coordinator?.handle(deepLinkOption: .fileViewer(model: model))
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
