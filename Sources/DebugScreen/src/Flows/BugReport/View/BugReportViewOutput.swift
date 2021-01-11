//
//  BugReportViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation
import UIKit

protocol BugReportViewOutput {
    func configureAdapter(tableView: UITableView)
    func sendReport()
}
