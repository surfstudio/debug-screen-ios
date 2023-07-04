//
//  AppInfo.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import Foundation

enum AppInfo {

    static var appName: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
    }

    static var version: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    static var buildNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

    static var bundleId: String {
        return Bundle.main.bundleIdentifier ?? ""
    }

}
