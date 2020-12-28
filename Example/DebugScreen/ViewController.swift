//
//  ViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 10/29/2020.
//  Copyright (c) 2020 Anton Shelar. All rights reserved.
//

import UIKit
import DebugScreen

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("___ ERROR!!! ___")

        DebugScreenConfiguration.shared.cacheCleanerActionsProvider = ActionsProvider()
        DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
        DebugScreenConfiguration.shared.featureToggleActionsProvider = FeatureToggleProvider()
        //DebugScreenConfiguration.shared.logCatcherService.setStdErrCatcherEnabled()
        //DebugScreenConfiguration.shared.logCatcherService.setStdOutCatcherEnabled()

    }

}

class ActionsProvider: CacheCleanerActionsProvider {
    func actions() -> [CacheCleanerAction] {
        return [
            CacheCleanerAction(title: "First action", block: {

            }),
            CacheCleanerAction(title: "Second action", block: {

            })
        ]
    }
}

class ServersProvider: SelectServerActionsProvider {

    func servers() -> [SelectServerAction] {
        return [
            SelectServerAction(url: URL(string: "https://google.com")!, title: "Google 123321 тут все фичи 123 321 лонгтитла", isActive: false),
            SelectServerAction(url: URL(string: "https://surf.ru")!, title: "Surf", isActive: true),
            SelectServerAction(url: URL(string: "https://yandex.ru")!, title: "yandex какой-то", isActive: false)
        ]
    }

    func didSelectServer(_ server: SelectServerAction) {
        // TODO: change active server
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

class FeatureToggleProvider: FeatureToggleActionsProvider {

    private let features = [
        FeatureToggleModel(title: FeatureToggleKey.feature1.rawValue, isEnabled: true),
        FeatureToggleModel(title: FeatureToggleKey.feature2.rawValue, isEnabled: false),
        FeatureToggleModel(title: FeatureToggleKey.feature3.rawValue, isEnabled: true),
        FeatureToggleModel(title: FeatureToggleKey.business1.rawValue, isEnabled: BusinessFeatureToggle.isPushNotificationsAvailable)
    ]

    func actions() -> [FeatureToggleModel] {
        return features
    }

    func handleAction(_ action: FeatureToggleModel) {
        guard let feature = features.first(where: { $0 === action }) else {
            assertionFailure()
            return
        }

        feature.setEnabled(!feature.isEnabled)
    }

    func doAction1() { }
    func doAction2() { }
    func doAction3() { }

}
