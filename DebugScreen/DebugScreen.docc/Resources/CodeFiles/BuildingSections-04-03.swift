import DebugScreen

final class CopiedTextSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let textItems = getTextItems()
        let blocks = configureBlocks(with: textItems)
        return .init(title: L10n.CopiedText.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension CopiedTextSectionBuilder {

    func getTextItems() -> [CopiedTextItem] {
        let items: [CopiedTextItem] = [
            .init(title: L10n.CopiedText.firstTextTitle,
                  value: "kjdhgaieagf8yhfb8445u_SSH_key"),
            .init(title: L10n.CopiedText.secondTextTitle,
                  value: "2283gghug4783g4h_Token"),
            .init(title: L10n.CopiedText.thirdTextTitle,
                  value: "This is very important info")
        ]

        return items
    }

    func configureBlocks(with items: [CopiedTextItem]) -> [MainTableBlock] {
        return items.map { .copiedText(model: $0) }
    }

}
