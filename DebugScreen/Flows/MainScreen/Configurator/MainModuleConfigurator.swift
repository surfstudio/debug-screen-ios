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
        let presenter = MainModulePresenter()

        presenter.view = viewController
        viewController.output = presenter

        let navController = BaseNavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .overFullScreen

        return (navController, presenter)
    }

}
