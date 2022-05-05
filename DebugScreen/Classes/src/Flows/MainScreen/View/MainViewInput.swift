//
//  MainViewInput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

protocol MainViewInput: AnyObject {
    func setupInitialState(blocks: [MainTableBlock]) 
}
