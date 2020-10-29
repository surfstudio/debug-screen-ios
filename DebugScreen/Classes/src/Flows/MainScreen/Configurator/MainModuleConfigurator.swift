//
//  MainModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

final class MainModuleConfigurator {

    func configure(output: MainModuleOutput?) -> MainViewController {
        let viewController: MainViewController = UIViewController.instantiate(ofType: MainViewController.self)
    
        let presenter = MainModulePresenter()

        presenter.view = viewController
        presenter.output = output

        return viewController
    }

}
