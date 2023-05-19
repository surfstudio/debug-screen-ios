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
        DebugScreenConfiguration.shared.selectableTextProvider = TextsProvider()

        DebugScreenConfiguration.shared.logCatcherService.start()
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
        SelectServerActionModel(
            url: URL(string: "https://surf.ru/address/prod"),
            title: "Production",
            isActive: false
        ),
        SelectServerActionModel(
            url: URL(string: "https://surf.ru/address/test"),
            title: "Test server",
            isActive: true
        ),
        SelectServerActionModel(
            url: URL(string: "https://surf.ru/address/stage"),
            title: "Stage server (with long long long description)",
            isActive: false
        )
    ]

    func servers() -> [SelectServerActionModel] {
        return serverActions
    }

    func didSelectServer(_ server: SelectServerActionModel) {
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

    private var featureActions: [FeatureToggleModel] = []

    func actions() -> [FeatureToggleModel] {
        let featureActions = [
            FeatureToggleModel(text: FeatureToggleKey.feature1.rawValue, value: true) { [weak self] newValue in
                self?.updateModel(with: FeatureToggleKey.feature1.rawValue, newValue: newValue)
                self?.doAction1()
            },
            FeatureToggleModel(text: FeatureToggleKey.feature2.rawValue, value: false) { [weak self] newValue in
                self?.updateModel(with: FeatureToggleKey.feature2.rawValue, newValue: newValue)
                self?.doAction2()
            },
            FeatureToggleModel(text: FeatureToggleKey.feature3.rawValue, value: true) { [weak self] newValue in
                self?.updateModel(with: FeatureToggleKey.feature3.rawValue, newValue: newValue)
                self?.doAction3()
            },
            FeatureToggleModel(
                text: FeatureToggleKey.business1.rawValue,
                value: BusinessFeatureToggle.isPushNotificationsAvailable
            ) { [weak self] newValue in
                self?.updateModel(with: FeatureToggleKey.business1.rawValue, newValue: newValue)
                BusinessFeatureToggle.isPushNotificationsAvailable = newValue
            }
        ]

        self.featureActions = featureActions

        return featureActions
    }

    func updateModel(with text: String, newValue: Bool) {
        guard
            let featureToggle = FeatureToggleKey(rawValue: text),
            let featureIndex = featureActions.firstIndex(where: { $0.text == featureToggle.rawValue })
        else {
            return
        }

        featureActions[featureIndex].value = newValue
    }

    func doAction1() {}

    func doAction2() {}

    func doAction3() {}

}

final class TextsProvider: SelectableTextProvider {

    private var selectedText: [SelectableTextModel] = [
        .init(title: "SSH key", value: "kjdhgaieagf8yhfb8445u_SSH_key"),
        .init(title: "Token", value: "2283gghug4783g4h_Token"),
        .init(title: "Some data for copy")
    ]

    func texts() -> [SelectableTextModel] {
        return selectedText
    }

    func didSelectText(_ model: SelectableTextModel) {
        print("Text selected \(model.title) with value \(model.value ?? "<empty>")")
    }

}
