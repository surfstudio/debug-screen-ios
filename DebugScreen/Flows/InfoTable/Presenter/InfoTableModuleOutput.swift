//
//  InfoTableModuleOutput.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

protocol InfoTableModuleOutput: AnyObject {
    /// Call then close module
    var didModuleClosed: (() -> Void)? { get set }
}
