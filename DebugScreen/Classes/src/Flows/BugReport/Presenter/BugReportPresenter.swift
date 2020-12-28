//
//  BugReportPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

final class BugReportPresenter: BugReportModuleOutput {

    // MARK: - Public properties

    var pickImageBlock: (() -> Void)?
    var shareReportBlock: ((String, String?, UIImage?) -> Void)?

    weak var view: BugReportViewInput?

    // MARK: - Private properties

    private let adapter = BaseTableManager()
    private let textReportViewModel = TextViewTableCell.Model()
    private let mediaViewModel = MediaTableCell.Model()

}

// MARK: - BugReportModuleInput

extension BugReportPresenter: BugReportModuleInput {

    func didPickImage(_ image: UIImage) {
        mediaViewModel.previewImage.value = image
        adapter.didChangeCellHeight()
    }

}

// MARK: - BugReportViewOutput

extension BugReportPresenter: BugReportViewOutput {

    func configureAdapter(tableView: UITableView) {
        adapter.bindTableView(tableView)

        fillAdapter()
    }

    func sendReport() {
        guard let text = self.textReportViewModel.text.value else {
            return
        }

        shareReportBlock?(text, DebugScreenConfiguration.shared.logCatcherService.logPath, mediaViewModel.previewImage.value)
    }

}

// MARK: - Private methods

private extension BugReportPresenter {

    func fillAdapter() {
        adapter.setSections([[createTextReportUnit(), createMediaUnit() ]])
    }

    func createTextReportUnit() -> TableUnitItem {
        return TableCellUnit<TextViewTableCell>.create(textReportViewModel)
    }

    func createMediaUnit() -> TableUnitItem {
        mediaViewModel.didSelect = { [weak self] in
            (self?.mediaViewModel.previewImage.value != nil) ? self?.deleteImage() : self?.addImage()
        }

        return TableCellUnit<MediaTableCell>.create(mediaViewModel)
    }

    func deleteImage() {
        mediaViewModel.previewImage.value = nil
        adapter.didChangeCellHeight()
    }

    func addImage() {
        pickImageBlock?()
    }

}
