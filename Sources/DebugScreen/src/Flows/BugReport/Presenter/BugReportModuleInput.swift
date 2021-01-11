//
//  BugReportModuleInput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation
import UIKit

protocol BugReportModuleInput: class {
    func didPickImage(_ image: UIImage)
    func sendReport()
}
