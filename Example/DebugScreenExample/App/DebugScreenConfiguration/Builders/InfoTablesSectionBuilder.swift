//
//  InfoTablesSectionBuilder.swift
//  DebugScreenExample
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import DebugScreen

final class InfoTablesSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let appInfoTable: InfoTableModel = .appInfoTable()
        let deviceInfoTable: InfoTableModel = .deviceInfoTable()
        let combinedInfoTable = configureCombinedTableModel()

        let blocks: [MainTableBlock] = [
            .infoTable(model: appInfoTable),
            .infoTable(model: deviceInfoTable),
            .infoTable(model: combinedInfoTable)
        ]

        return .init(title: L10n.InfoTable.header,blocks: blocks)
    }

}

// MARK: - Private Methods

private extension InfoTablesSectionBuilder {

    func configureCombinedTableModel() -> InfoTableModel {
        let appInfoSection: InfoTableSection = .appInfoSection(title: L10n.InfoTable.aboutApp)
        let deviceInfoSection: InfoTableSection = .deviceInfoSection(title: L10n.InfoTable.aboutDevice)

        return .init(header: L10n.InfoTable.custom,
                     sections: [appInfoSection, deviceInfoSection])
    }

}
