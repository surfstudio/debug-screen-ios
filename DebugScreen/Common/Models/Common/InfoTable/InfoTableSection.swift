//
//  InfoTableSection.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 04.07.2023.
//

/// Representation of info table section.
public struct InfoTableSection {

    // MARK: - Properties

    /// Section title, that will be displayed in section header view.
    public let title: String?
    /// Section elements list.
    public var items: [InfoTableItem]

    // MARK: - Initialization

    public init(title: String? = nil, items: [InfoTableItem]) {
        self.title = title
        self.items = items
    }

    // MARK: - Static Methods

    /**

     Build app info section of information table with standart components.
     - Parameter title: Section title. By default the section will be displayed without title.
     - Returns: App info section.

     Example of usage:
     ```swift
     let sectionWithoutTitle: InfoTableSection = .appInfoSection()
     let sectionWithTitle: InfoTableSection = .appInfoSection(title: "About App")
     ```
     */
    public static func appInfoSection(title: String? = nil) -> InfoTableSection {
        let items: [InfoTableItem] = [
            .init(key: L10n.InfoTable.AppInfo.appName, value: AppInfo.appName),
            .init(key: L10n.InfoTable.AppInfo.version, value: AppInfo.version),
            .init(key: L10n.InfoTable.AppInfo.build, value: AppInfo.buildNumber),
            .init(key: L10n.InfoTable.AppInfo.bundleId, value: AppInfo.bundleId)
        ]

        return .init(title: title, items: items)
    }

    /**

     Build device info section of information table with standart components.
     - Parameter title: Section title. By default the section will be displayed without title.
     - Returns: Device info section.

     Example of usage:
     ```swift
     let sectionWithoutTitle: InfoTableSection = .deviceInfoSection()
     let sectionWithTitle: InfoTableSection = .deviceInfoSection(title: "About Device")
     ```
     */
    public static func deviceInfoSection(title: String? = nil) -> InfoTableSection {
        let isLowPowerMode = DeviceInfo.isLowPowerModeEnabled ?
            L10n.Common.BoolValues.true :
            L10n.Common.BoolValues.false

        let items: [InfoTableItem] = [
            .init(key: L10n.InfoTable.DeviceInfo.name, value: DeviceInfo.name),
            .init(key: L10n.InfoTable.DeviceInfo.systemVersion, value: DeviceInfo.systemVersion),
            .init(key: L10n.InfoTable.DeviceInfo.model, value: DeviceInfo.model),
            .init(key: L10n.InfoTable.DeviceInfo.batteryLevel, value: DeviceInfo.localizedBatteryLevel),
            .init(key: L10n.InfoTable.DeviceInfo.lowPowerMode, value: isLowPowerMode)
        ]

        return .init(title: title, items: items)
    }

}
