//
//  MainModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

protocol MainModuleOutput: AnyObject {
    /// Call then open action list
    var onActionListShow: ((ActionList) -> Void)? { get set }
    /// Call then show alert with text
    var onAlertShow: ((AlertModel) -> Void)? { get set }
    /// Call then show information table screen
    var onInfoTableShow: ((InfoTableModel) -> Void)? { get set }
    /// Called when a section screen needs to be shown
    var onNestedScreenShow: ((NestedScreen) -> Void)? { get set }
    /// Call then close module
    var didModuleClosed: (() -> Void)? { get set }
    /// Call after module deinit from memory
    var didModuleDismissed: (() -> Void)? { get set }
}
