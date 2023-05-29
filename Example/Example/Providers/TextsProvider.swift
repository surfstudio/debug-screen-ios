//
//  TextsProvider.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen

final class TextsProvider: SelectableTextProvider {

    private var selectedText: [SelectableTextModel] = [
        .init(title: L10n.SelectableTextProvider.FirstText.title, value: "kjdhgaieagf8yhfb8445u_SSH_key"),
        .init(title: L10n.SelectableTextProvider.SecondText.title, value: "2283gghug4783g4h_Token"),
        .init(title: L10n.SelectableTextProvider.ThirdText.title)
    ]

    func texts() -> [SelectableTextModel] {
        return selectedText
    }

    func didSelectText(_ model: SelectableTextModel) {
        print("Text selected \(model.title) with value \(model.value ?? "<empty>")")
    }

}
