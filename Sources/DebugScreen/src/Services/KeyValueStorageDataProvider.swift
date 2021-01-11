//
//  KeyValueStorageDataProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

public protocol KeyValueStorageDataProvider {
    func name() -> String
    func data(completion: (([String: Any?]?) -> Void))
}

// MARK: - KeyValueStoragesProvider

public protocol KeyValueStoragesProvider {
    func storages() -> [KeyValueStorageDataProvider]
}

public final class DefaultKeyValueStoragesProvider: KeyValueStoragesProvider {

    public init() { }

    public func storages() -> [KeyValueStorageDataProvider] {
        return [DefaultUserDefaultsDataProvider(), DefaultKeychainDataProvider()]
    }
}

// MARK: - DefaultUserDefaultsDataProvider

public final class DefaultUserDefaultsDataProvider: KeyValueStorageDataProvider {

    public init() { }

    public func name() -> String {
        return "UserDefaults (standard)"
    }

    public func data(completion: (([String: Any?]?) -> Void)) {
        completion(UserDefaults.standard.dictionaryRepresentation())
    }

}

// MARK: - DefaultKeychainDataProvider

public final class DefaultKeychainDataProvider: KeyValueStorageDataProvider {

    public init() { }

    public func name() -> String {
        return "Keychain"
    }

    public func data(completion: (([String: Any?]?) -> Void)) {
        completion(nil)
    }

}
