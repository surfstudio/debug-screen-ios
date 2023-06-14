//
//  AppDelegate.swift
//  Example
//
//  Created by vasilev on 20.06.2022.
//

import UIKit
import DebugScreen

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureDebugScreen()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) { }

}

// MARK: - Private Methods

private extension AppDelegate {

    func configureDebugScreen() {
        /// Activate logger at start if you want to write logs
        /// Also you can do it with `loggerActivationToggle`
        /// at logger section (if you'll add this element to sections list)
        DebugScreenConfiguration.shared.logCatcherService.isActive = true
        configureDebugScreenSections()
    }

    func configureDebugScreenSections() {
        let serverSelectionSection = ServerSelectionSectionBuilder().build()
        let actionsSection = ActionsSectionBuilder().build()
        let togglesSection = TogglesSectionBuilder().build()
        let copiedTextSection = CopiedTextSectionBuilder().build()

        /// You can build logger section from ready-to-use components
        /// or you create it manually like other sections by implementing `SectionBuilder` protocol
        let loggerSection = TableSection.logger(with: [.loggerActivationToggle,
                                                       .enableLogInfoToggle,
                                                       .enableLogErrorsToggle,
                                                       .logFileActionList,
                                                       .logFileOpenAction,
                                                       .logFileClearAction])

        DebugScreenConfiguration.shared.sections = [serverSelectionSection,
                                                    actionsSection,
                                                    togglesSection,
                                                    copiedTextSection,
                                                    loggerSection]
    }

}
