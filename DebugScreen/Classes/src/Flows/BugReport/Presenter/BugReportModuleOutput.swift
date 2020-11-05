//
//  BugReportModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

protocol BugReportModuleOutput {

    var pickImageBlock: (() -> Void)? { get set }
    var shareReportBlock: ((String, String?, UIImage?) -> Void)? { get set }

}
