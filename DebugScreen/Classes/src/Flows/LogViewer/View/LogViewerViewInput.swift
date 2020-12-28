//
//  LogViewerViewInput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

protocol LogViewerViewInput: class {
    func setLogText(_ text: String?)
    func setStdOutCaptureStatus(_ isEnabled: Bool)
    func setStdErrCaptureStatus(_ isEnabled: Bool)
}
