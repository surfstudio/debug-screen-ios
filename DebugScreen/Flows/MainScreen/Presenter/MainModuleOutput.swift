//
//  MainModuleOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

protocol MainModuleOutput {
    /// Call then clouse module
    var didModuleClosed: (() -> Void)? { get set }
    /// Call then press clear cache button
    var didActionOptionsShowed: ((ActionsProviderModel) -> Void)? { get set }
    /// Call after module dissapeared from window
    var didModuleDissapear: (() -> Void)? { get set }
}
