import DebugScreen

final class InfoTablesSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let appInfo: InfoTableModel = .appInfoTable()
        let customInfo = createCustomInfoModel()

        let blocks: [MainTableBlock] = [
            .infoTable(model: appInfo),
            .infoTable(model: customInfo)
        ]

        return .init(title: L10n.InfoTable.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension InfoTablesSectionBuilder {

    func createCustomInfoModel() -> InfoTableModel {
        let item1: InfoTableItem = .init(key: "key1", value: "value1")
        let item2: InfoTableItem = .init(key: "key2", value: "value2")
        return .init(header: L10n.InfoTable.custom,
                     sections: [.init(items: [item1, item2])])
    }

}
