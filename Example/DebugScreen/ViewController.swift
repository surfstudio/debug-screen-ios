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

//        DebugScreenConfiguration.shared.cacheCleanerActionsProvider = ActionsProvider()
//        DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
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
enum FeatureToggleKey {
    case feature1
    case feature2
    case feature3
    case business1
}

/// Business FeatureToggles, only true/false, without handling
enum BusinessFeatureToggle {
    static var isPushNotificationsAvailable = false
}

class FeatureToggleProvider: FeatureToggleActionsProvider {

    let featureToggles: KeyValuePairs<FeatureToggleKey, FeatureToggleModel> = [
        .feature1: FeatureToggleModel(text: "feature1", value: true),
        .feature2: FeatureToggleModel(text: "feature2", value: false),
        .feature3: FeatureToggleModel(text: "feature3", value: true),
        .business1: FeatureToggleModel(text: "PushNotifications", value: BusinessFeatureToggle.isPushNotificationsAvailable)
    ]

    func actions() -> [FeatureToggleModel] {
        return featureToggles.map { $0.value }
    }

    func handleAction(with text: String, newValue: Bool) {
        guard
            let featureToggle = featureToggles.first(where: { $1.text == text }) else {
            return
        }

        switch featureToggle.key {
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
