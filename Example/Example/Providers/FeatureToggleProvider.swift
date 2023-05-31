//
//  FeatureToggleProvider.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen

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
