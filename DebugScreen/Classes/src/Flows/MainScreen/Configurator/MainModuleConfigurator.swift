//
//  MainModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

typealias MainModuleComponents = (view: UIViewController, output: MainModuleOutput)

final class MainModuleConfigurator {

    // MARK: - Public methods

    func configure(output: MainModuleOutput?) -> MainModuleComponents {
        let viewController: MainViewController = UIViewController.instantiate(ofType: MainViewController.self)
        viewController.modalPresentationStyle = .overFullScreen
    
        let presenter = MainModulePresenter()

        presenter.view = viewController
        viewController.output = presenter

        return (viewController, presenter)
    }

}
