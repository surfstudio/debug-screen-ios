//
//  UserDefaultsFeatureToggle.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen
import Foundation

final class UserDefaultsFeatureToggle: FeatureToggle {

    // MARK: - Properties

    let title: String

    var isEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: key)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }

    }

    // MARK: - Private Properties

    private let key: String

    // MARK: - Initialization

    init(title: String, key: String) {
        self.title = title
        self.key = key
    }

}
