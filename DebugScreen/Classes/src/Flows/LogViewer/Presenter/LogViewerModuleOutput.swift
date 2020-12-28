//
//  LogViewerModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

protocol LogViewerModuleOutput {
    var shareLogsBlock: ((String) -> Void)? { get set }
}
