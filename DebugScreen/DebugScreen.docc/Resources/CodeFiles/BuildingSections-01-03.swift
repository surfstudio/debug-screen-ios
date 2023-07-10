import DebugScreen
import Foundation

final class ServerSelectionSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = configureSelectionList()
        return .init(title: L10n.ServerSelection.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension ServerSelectionSectionBuilder {

    func configureSelectionList() -> [MainTableBlock] {
        return []
    }

}
