//
//  TableSection.swift
//  DebugScreen
//
//  Created by Евгений Васильев on 22.06.2022.
//

/// Representation of main screen table section.
public struct TableSection {

    // MARK: - Properties

    /// Section title, that will be displayed inside section header view.
    public let title: String
    /// Section elements list.
    public let blocks: [MainTableBlock]

    // MARK: - Initialization

    public init(title: String, blocks: [MainTableBlock]) {
        self.title = title
        self.blocks = blocks
    }

}

// MARK: - Logger Section

public extension TableSection {

    // MARK: - Static Methods

    /**

     Build logger section with given components.
     - Parameter components: Array of components, that need to be included into logger section.
     - Returns: Section, contains selected components.

     Framework provides ready-to-use components ``LoggerSectionComponent`` to build logger section:
     ```swift
     let loggerSection: TableSection = .logger(with: [.loggerActivationToggle,
                                                      .enableLogInfoToggle,
                                                      .enableLogErrorsToggle,
                                                      .logFileActionList])
     ```
     Also you can use your own components to build this block same way like other sections.
     */
    static func logger(with components: [LoggerSectionComponent]) -> TableSection {
        return LoggerSectionBuilder(components: components).build()
    }

}
