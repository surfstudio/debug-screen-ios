//
//  FileViewerPresenter.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 19.05.2023.
//

import QuickLook

final class FileViewerPresenter: FileViewerModuleOutput {

    // MARK: - Constants

    private enum Constants {
        static let numberOfPreviewItems = 1
    }

    // MARK: - Properties

    weak var view: FileViewerViewInput?

    // MARK: - Private Properties

    private let model: FileViewerModel
    private var filePreviewItem: QLPreviewItem {
        return NSURL(fileURLWithPath: model.filePath) as QLPreviewItem
    }

    // MARK: - Initialization

    init(model: FileViewerModel) {
        self.model = model
    }

}

// MARK: - FileViewerModuleInput

extension FileViewerPresenter: FileViewerModuleInput {

    // MARK: - QLPreviewControllerDataSource

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return Constants.numberOfPreviewItems
    }

    func previewController( _ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return filePreviewItem
    }

}

// MARK: - FileViewerViewOutput

extension FileViewerPresenter: FileViewerViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
