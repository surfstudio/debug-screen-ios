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

    // MARK: - MainModuleOutput

    var didModuleDismissed: (() -> Void)?

    // MARK: - Properties

    weak var view: FileViewerViewInput?

    // MARK: - Private Properties

    private let filePath: String
    private var filePreviewItem: QLPreviewItem {
        NSURL(fileURLWithPath: filePath) as QLPreviewItem
    }

    // MARK: - Initialization

    init(filePath: String) {
        self.filePath = filePath
    }

    // MARK: - Deinitialization

    deinit {
        didModuleDismissed?()
    }

}

// MARK: - FileViewerModuleInput

extension FileViewerPresenter: FileViewerModuleInput {

    // MARK: - QLPreviewControllerDataSource

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        Constants.numberOfPreviewItems
    }

    func previewController( _ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        filePreviewItem
    }

}

// MARK: - FileViewerViewOutput

extension FileViewerPresenter: FileViewerViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
