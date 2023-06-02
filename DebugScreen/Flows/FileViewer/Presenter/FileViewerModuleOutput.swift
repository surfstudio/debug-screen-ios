//
//  FileViewerModuleOutput.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 19.05.2023.
//

public protocol FileViewerModuleOutput: AnyObject {
    /// Call after module deinit from memory
    var didModuleDismissed: (() -> Void)? { get set }
}
