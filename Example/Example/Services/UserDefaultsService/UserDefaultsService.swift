//
//  UserDefaultsService.swift
//  Example
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import Foundation

final class UserDefaultsService {

    // MARK: - Properties

    var serverUrl: String? {
        get {
            guard
                let value = UserDefaults.standard.value(forKey: UserDefaultsKeys.serverUrl),
                let url = value as? String
            else {
                return nil
            }

            return url
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.serverUrl)
        }
    }

    var isNeedShowTouches: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isNeedShowTouches)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isNeedShowTouches)
        }
    }

    var isNeedUseSSH: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isNeedUseSSH)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isNeedUseSSH)
        }
    }

    var isNeedShowEcomCatalog: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isNeedShowEcomCatalog)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isNeedShowEcomCatalog)
        }
    }

}
