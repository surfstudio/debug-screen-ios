//
//  DeviceInfo.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import UIKit

enum DeviceInfo {

    static var name: String {
        return UIDevice.current.name
    }

    static var systemVersion: String {
        return UIDevice.current.systemVersion
    }

    static var model: String {
        return UIDevice.current.model
    }

    static var localizedBatteryLevel: String {
        return "\(UIDevice.current.batteryLevel * 100.00) %"
    }

    static var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }

}
