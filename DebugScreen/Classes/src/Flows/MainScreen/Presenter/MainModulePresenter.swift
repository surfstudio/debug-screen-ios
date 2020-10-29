//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

final class MainModulePresenter: MainViewOutput, MainModuleInput {

    weak var view: MainViewInput?
    var output: MainModuleOutput?

}
