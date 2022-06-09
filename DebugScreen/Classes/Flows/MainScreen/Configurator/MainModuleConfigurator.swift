//
//  MainModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

typealias MainModuleComponents = (view: UIViewController, output: MainModuleOutput)

final class MainModuleConfigurator {

    // MARK: - Methods

    func configure() -> MainModuleComponents {
        let viewController = UIViewController.instantiate(ofType: MainViewController.self)
        viewController.modalPresentationStyle = .overFullScreen
    
        let presenter = MainModulePresenter()

        presenter.view = viewController
        viewController.output = presenter

        return (viewController, presenter)
    }

}
