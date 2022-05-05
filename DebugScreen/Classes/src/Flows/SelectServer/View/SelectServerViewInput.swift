//
//  SelectServerViewInput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

protocol SelectServerViewInput: AnyObject {
    func setupInitialState(actions: [SelectServerAction])
    func update(actions: [SelectServerAction])
}
