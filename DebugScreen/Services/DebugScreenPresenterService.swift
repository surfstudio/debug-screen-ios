//
//  DebugScreenPresenterService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import UIKit

/// Provides functionality for open DebugScreen, logs file, show custom screens and simple alerts with messages.
public final class DebugScreenPresenterService {

    // MARK: - Static Properties

    /// Singleton that provides access to all presenter functions.
    public static let shared = DebugScreenPresenterService()

    // MARK: - Private Properties

    private var coordinator: DebugScreenCoordinator?

    // MARK: - Initialization

    private init() { }

    // MARK: - Public Methods

    /// Open Debug screen menu.
    public func showDebugScreen() {
        guard coordinator == nil else {
            return
        }

        configureCoordinator()
        coordinator?.start()
    }

    /// Show alert with title and message.
    /// Can be showed only when debug screen is open.
    /// - Parameters:
    ///   - title: Alert title.
    ///   - message: Alert message.
    public func showAlert(title: String? = nil, message: String) {
        let model = AlertModel(title: title, message: message)
        openModule(.alert(model: model))
    }

    /// Show custom view controller modally.
    /// Can be showed only when debug screen is open.
    /// - Parameter view: Screen to display.
    public func presentCustomScreen(_ view: UIViewController) {
        openModule(.customScreen(view, method: .present))
    }

    /// Push custom view controller onto the debug screen navigation stack.
    /// Provides a standard back button to return to the debug menu.
    /// Can be used only when debug screen is open.
    /// - Parameter view: Screen to display.
    public func pushCustomScreen(_ view: UIViewController) {
        openModule(.customScreen(view, method: .push))
    }

    /// Open log file.
    /// Can be showed only when debug screen is open.
    public func openLogFile() {
        let model = FileViewerModel(filePath: DebugScreenConfiguration.shared.logCatcherService.logFilePath)
        openModule(.fileViewer(model: model))
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

    func isDebugScreenAvailable() -> Bool {
        guard coordinator != nil else {
            debugPrint("ℹ️ Modules presentation available only from Debug Screen menu!")
            return false
        }

        return true
    }

    func openModule(_ module: ModuleType) {
        guard isDebugScreenAvailable() else {
            return
        }

        coordinator?.open(module: module)
    }

}
