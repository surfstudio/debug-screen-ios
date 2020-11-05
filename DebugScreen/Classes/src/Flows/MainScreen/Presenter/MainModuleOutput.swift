//
//  MainModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

protocol MainModuleOutput {

    var closeModuleBlock: (() -> Void)? { get set }
    var showCacheClearingOptionsBlock: (([CacheCleanerAction]) -> Void)? { get set }
    var showBugReportBlock: (() -> Void)? { get set }

}
