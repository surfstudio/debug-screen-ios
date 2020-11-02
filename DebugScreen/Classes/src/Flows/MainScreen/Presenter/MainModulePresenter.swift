//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

final class MainModulePresenter: MainModuleOutput {

    var closeModuleBlock: (() -> Void)?

    weak var view: MainViewInput?

}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput {
    
}

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func didTapCloseButton() {
        closeModuleBlock?()
    }

}
