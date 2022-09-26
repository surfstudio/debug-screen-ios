//
//  ViewController.swift
//  Example
//
//  Created by vasilev on 20.06.2022.
//

import UIKit
import DebugScreen

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DebugScreenConfiguration.shared.actionsProvider = ActionsProviderExample()
        DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
        DebugScreenConfiguration.shared.featureToggleActionsProvider = FeatureToggleProvider()
    }

}

final class ActionsProviderExample: ActionsProvider {

    func makeActions() -> [ActionsProviderModel] {
        let modelForFirstAction = ActionModel(title: "First action", block: {
            print("perform first clear action")
        })
        let modelForSecondAction = ActionModel(title: "Second action", block: {
            print("perform second clear action")
        })
        return [
            ActionsProviderModel(
                header: "Header of first action",
                title: "First action",
                message: "Some info first message",
                actions: [modelForFirstAction, modelForSecondAction]
            ),
            ActionsProviderModel(
                header: "Header of second action",
                title: "Second action",
                message: "Some info second message",
                actions: [modelForFirstAction, modelForSecondAction]
            )
        ]

    }
}

final class ServersProvider: SelectServerActionsProvider {

    private var serverActions = [
        SelectServerAction(
            url: URL(string: "https://surf.ru/address/prod"),
            title: "Production",
            isActive: false
        ),
        SelectServerAction(
            url: URL(string: "https://surf.ru/address/test"),
            title: "Test server",
            isActive: true
        ),
        SelectServerAction(
            url: URL(string: "https://surf.ru/address/stage"),
            title: "Stage server (with long long long description)",
            isActive: false
        )
    ]

    func servers() -> [SelectServerAction] {
        return serverActions
    }

    func didSelectServer(_ server: SelectServerAction) {
        serverActions = serverActions.map {
            .init(url: $0.url, title: $0.title, isActive: $0.url == server.url)
        }
        // do something usefull
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
        FeatureToggleModel(
            text: FeatureToggleKey.business1.rawValue,
            value: BusinessFeatureToggle.isPushNotificationsAvailable
        )
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
