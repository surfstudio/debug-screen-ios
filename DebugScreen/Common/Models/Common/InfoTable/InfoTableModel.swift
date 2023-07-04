//
//  InfoTableModel.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

/// Representation of information table .
public struct InfoTableModel {

    // MARK: - Properties

    /// Table's header.
    let header: String
    /// Table's sections.
    let sections: [InfoTableSection]

    // MARK: - Initialization

    public init(header: String, sections: [InfoTableSection]) {
        self.header = header
        self.sections = sections
    }

    // MARK: - Static Methods

    /**

     Build app info table screen with standart components.
     - Returns: App info table screen model.

     Example of usage:
     ```swift
     let appInfoTable: InfoTableModel = .appInfoTable()
     ```
     */
    public static func appInfoTable() -> InfoTableModel {
        return .init(header: L10n.InfoTable.AppInfo.title, sections: [.appInfoSection()])
    }

    /**

     Build device info table screen with standart components.
     - Returns: Device info table screen model.

     Example of usage:
     ```swift
     let deviceInfoTable: InfoTableModel = .deviceInfoTable()
     ```
     */
    public static func deviceInfoTable() -> InfoTableModel {
        return .init(header: L10n.InfoTable.DeviceInfo.title, sections: [.deviceInfoSection()])
    }

}
