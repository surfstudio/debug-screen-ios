//
//  SectionScreenModuleOutput.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

protocol SectionScreenModuleOutput: AnyObject {
    /// Called when an action list needs to be shown
    var onActionListShow: ((ActionList) -> Void)? { get set }
    /// Called when an alert needs to be shown
    var onAlertShow: ((AlertModel) -> Void)? { get set }
    /// Called when an info table screen needs to be shown
    var onInfoTableShow: ((InfoTableModel) -> Void)? { get set }
    /// Called when a nested section screen needs to be shown
    var onSectionScreenShow: ((SectionScreen) -> Void)? { get set }
}
