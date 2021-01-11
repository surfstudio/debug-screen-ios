//
//  KeyValueStorageViewerPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation
import UIKit

final class KeyValueStorageViewerPresenter: KeyValueStorageViewerModuleOutput {

    // MARK: - Public Properties

    weak var view: KeyValueStorageViewerViewInput?

    // MARK: - Private Properties

    private let storage: KeyValueStorageDataProvider
    private let adapter = BaseTableManager()

    // MARK: - Initialization

    init(storage: KeyValueStorageDataProvider) {
        self.storage = storage
    }

}

// MARK: - KeyValueStorageViewerModuleInput

extension KeyValueStorageViewerPresenter: KeyValueStorageViewerModuleInput { }

// MARK: - KeyValueStorageViewerViewOutput

extension KeyValueStorageViewerPresenter: KeyValueStorageViewerViewOutput {

    func viewLoaded() {
        view?.setTitle(storage.name())

        storage.data { [weak self] (data: [String : Any?]?) in
            self?.fillAdapter(data: data ?? [:])
        }
    }

    func configureAdapter(tableView: UITableView) {
        adapter.bindTableView(tableView)
    }

}

// MARK: - Private Methods

private extension KeyValueStorageViewerPresenter {

    func fillAdapter(data: [String: Any?]) {
        var units = [TableUnitItem]()

        for (key, value) in data {
            let model = KeyValueTableCell.Model(key: key, value: "\(value ?? "(nil)")")
            units.append(TableCellUnit<KeyValueTableCell>.create(model))
        }

        adapter.setSections([units])
    }

}
