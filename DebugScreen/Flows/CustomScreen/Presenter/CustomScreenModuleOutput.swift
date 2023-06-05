//
//  CustomScreenModuleOutput.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 05.06.2023.
//

protocol CustomScreenModuleOutput: AnyObject {
    /// Call after module deinit from memory
    var didModuleDismissed: (() -> Void)? { get set }
}
