//
//  LogViewerViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

protocol LogViewerViewOutput {
    func viewLoaded()
    func shareLogs()
    func clearLogs()
}
