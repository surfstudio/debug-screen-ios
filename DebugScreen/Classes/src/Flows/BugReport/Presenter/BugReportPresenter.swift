//
//  BugReportPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation
import ReactiveDataDisplayManager

final class BugReportPresenter: BugReportModuleOutput {

    // MARK: - Public properties

    var pickImageBlock: (() -> Void)?
    var shareReportBlock: ((String, String?, UIImage?) -> Void)?

    weak var view: BugReportViewInput?

    // MARK: - Private properties

    private var adapter: BaseTableDataDisplayManager?
    private var textReportGenerator: BaseNonReusableCellGenerator<TextViewTableCell>?
    private var text: String?
    private var mediaGenerator: BaseNonReusableCellGenerator<MediaTableCell>?
    private var image: UIImage?

}

// MARK: - BugReportModuleInput

extension BugReportPresenter: BugReportModuleInput {

    func didPickImage(_ image: UIImage) {
        self.image = image

        reloadMediaGenerator()
    }

}

// MARK: - BugReportViewOutput

extension BugReportPresenter: BugReportViewOutput {

    func configureAdapter(tableView: UITableView) {
        adapter = BaseTableDataDisplayManager(collection: tableView)

        fillAdapter()
    }

    func sendReport() {
        guard let text = self.text else {
            return
        }

        shareReportBlock?(text, DebugScreenConfiguration.shared.logCatcherService.logPath, image)
    }

}

// MARK: - Private methods

private extension BugReportPresenter {

    func fillAdapter() {
        adapter?.clearCellGenerators()

        let textGenerator: BaseNonReusableCellGenerator<TextViewTableCell> = createTextReportGenerator()
        textReportGenerator = textGenerator
        adapter?.addCellGenerator(textGenerator)

        let mediaGenerator: BaseNonReusableCellGenerator<MediaTableCell> = createMediaGenerator(image: nil)
        self.mediaGenerator = mediaGenerator
        adapter?.addCellGenerator(mediaGenerator)

        adapter?.forceRefill()
    }

    func createTextReportGenerator() -> BaseNonReusableCellGenerator<TextViewTableCell> {
        let generator = BaseNonReusableCellGenerator<TextViewTableCell>(with: TextViewTableCell.Model(
                                                                            didChangeTextBlock: { [weak self] (text: String?) in
            self?.text = text
        }))

        return generator
    }

    func createMediaGenerator(image: UIImage?) -> BaseNonReusableCellGenerator<MediaTableCell> {
        let model = MediaTableCell.Model(previewImage: image, title: (image != nil) ? "Delete image" : "Add image")
        let generator = BaseNonReusableCellGenerator<MediaTableCell>(with: model)

        generator.didSelectEvent += { [weak self] in
            (image != nil) ? self?.deleteImage() : self?.addImage()
        }

        return generator
    }

    func reloadMediaGenerator() {
        guard let mediaGenerator: TableCellGenerator = self.mediaGenerator else {
            assertionFailure()
            return
        }

        adapter?.remove(mediaGenerator, with: .left, needScrollAt: nil, needRemoveEmptySection: false)

        let newMediaGenerator: BaseNonReusableCellGenerator<MediaTableCell> = createMediaGenerator(image: image)
        self.mediaGenerator = newMediaGenerator
        adapter?.addCellGenerator(newMediaGenerator)

        adapter?.forceRefill()
    }

    func deleteImage() {
        image = nil

        reloadMediaGenerator()
    }

    func addImage() {
        pickImageBlock?()
    }

}
