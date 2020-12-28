//
//  KeyValueStorageViewerViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

protocol KeyValueStorageViewerViewOutput {
    func viewLoaded()
    func configureAdapter(tableView: UITableView)
}
