//
//  InfoTableViewInput.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

protocol InfoTableViewInput: AnyObject {
    func setupInitialState(with model: InfoTableModel)
}