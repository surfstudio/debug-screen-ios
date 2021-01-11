//
//  KeyValueStorageViewerViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit

final class KeyValueStorageViewerViewController: UIViewController {

    // MARK: - Public Properties

    var output: KeyValueStorageViewerViewOutput?

    // MARK: - Private Properties

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.configureAdapter(tableView: tableView)
        output?.viewLoaded()
    }

}

// MARK: - UserDefaultsViewerViewInput

extension KeyValueStorageViewerViewController: KeyValueStorageViewerViewInput {

    func setTitle(_ title: String?) {
        self.title = title
    }

}
