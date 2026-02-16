//
//  SectionScreenViewInput.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

protocol SectionScreenViewInput: AnyObject {
    func setupInitialState(with title: String, sections: [TableSection])
}
