//
//  ViewController.swift
//  Example
//
//  Created by vasilev on 09.06.2022.
//

import UIKit
import DebugScreen

final class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        DebugScreenConfiguration.shared.cacheCleanerActionsProvider = ActionsProvider()
        DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
        DebugScreenConfiguration.shared.featureToggleActionsProvider = FeatureToggleProvider()
        DebugScreenConfiguration.shared.logCatcherService.setStdErrCatcherEnabled()
        DebugScreenConfiguration.shared.logCatcherService.setStdOutCatcherEnabled()
    }

}

final class ActionsProvider: CacheCleanerActionsProvider {
    func actions() -> [CacheCleanerAction] {
        return [
            CacheCleanerAction(title: "First action", block: {

            }),
            CacheCleanerAction(title: "Second action", block: {

            })
        ]
    }
}

final class ServersProvider: SelectServerActionsProvider {

    private var serverActions = [
        SelectServerAction(url: URL(string: "https://google.com")!, title: "Google 123321 тут все фичи 123 321 лонгтитла", isActive: false),
        SelectServerAction(url: URL(string: "https://surf.ru")!, title: "Surf", isActive: true),
        SelectServerAction(url: URL(string: "https://yandex.ru")!, title: "yandex какой-то", isActive: false)
    ]

    func servers() -> [SelectServerAction] {
        return serverActions
    }

    func didSelectServer(_ server: SelectServerAction) {
        serverActions = serverActions.map {
            SelectServerAction(url: $0.url, title: $0.title, isActive: $0.url == server.url)
        }
    }

}

/// All feature toggles
enum FeatureToggleKey: String {
    case feature1
    case feature2
    case feature3
    case business1 = "PushNotifications"
}

/// Business FeatureToggles, only true/false, without handling
enum BusinessFeatureToggle {
    static var isPushNotificationsAvailable = false
}

final class FeatureToggleProvider: FeatureToggleActionsProvider {

    private var featureActions = [
        FeatureToggleModel(text: FeatureToggleKey.feature1.rawValue, value: true),
        FeatureToggleModel(text: FeatureToggleKey.feature2.rawValue, value: false),
        FeatureToggleModel(text: FeatureToggleKey.feature3.rawValue, value: true),
        FeatureToggleModel(text: FeatureToggleKey.business1.rawValue, value: BusinessFeatureToggle.isPushNotificationsAvailable)
    ]

    func actions() -> [FeatureToggleModel] {
        return featureActions
    }

    func handleAction(with text: String, newValue: Bool) {
        guard let featureToggle = FeatureToggleKey(rawValue: text) else {
            return
        }

        if let featureIndex = featureActions.firstIndex(
            where: { $0.text == featureToggle.rawValue }
        ) {
            featureActions[featureIndex].value = newValue
        }

        switch featureToggle {
        case .feature1:
            doAction1()
        case .feature2:
            doAction2()
        case .feature3:
            doAction3()
        case .business1:
            BusinessFeatureToggle.isPushNotificationsAvailable = newValue
        }
    }

    func doAction1() { }
    func doAction2() { }
    func doAction3() { }

}
