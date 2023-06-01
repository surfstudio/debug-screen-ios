//
//  MainModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

protocol MainModuleOutput: AnyObject {
    /// Call then open actions list
    var onActionsListShow: ((ActionsList) -> Void)? { get set }
    /// Call then show alert with text
    var onAlertShow: ((String) -> Void)? { get set }
    /// Call then close module
    var didModuleClosed: (() -> Void)? { get set }
    /// Call after module deinit from memory
    var didModuleDismissed: (() -> Void)? { get set }
}
