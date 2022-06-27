//
//  MainModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

protocol MainModuleOutput {
    var didModuleClosed: (() -> Void)? { get set }
    var didCacheClearingOptionsShowed: (([CacheCleanerAction]) -> Void)? { get set }
}
