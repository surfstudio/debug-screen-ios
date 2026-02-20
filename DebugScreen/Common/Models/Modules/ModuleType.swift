//
//  ModuleType.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 12.06.2023.
//

import UIKit

/// DebugScreen module types list.
/// Modules can be presented only from DebugScreen main screen
enum ModuleType {
    /// Module to present alert with message
    case alert(model: AlertModel)
    /// Module to present any view controller by action button tap
    case customScreen(_ screen: UIViewController)
    /// Module to push any view controller onto the debug screen navigation stack
    case pushCustomScreen(_ screen: UIViewController)
    /// Module to open local file by selected filepath
    case fileViewer(model: FileViewerModel)
    /// Module to present information table screen.
    case infoTable(model: InfoTableModel)
}
