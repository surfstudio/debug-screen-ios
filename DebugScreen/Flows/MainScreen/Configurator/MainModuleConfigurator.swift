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

    func configureMain() -> MainModuleComponents {
        let view = UIViewController.instantiate(ofType: MainViewController.self)
        let presenter = MainModulePresenter(
            title: L10n.MainViewController.debugTitle,
            sections: DebugScreenConfiguration.shared.sections
        )

        presenter.view = view
        view.output = presenter

        let navController = BaseNavigationController(rootViewController: view)
        navController.modalPresentationStyle = .overFullScreen

        return (navController, presenter)
    }

    func configureNestedModule(model: NestedScreen) -> MainModuleComponents {
        let view = UIViewController.instantiate(ofType: MainViewController.self)
        let presenter = MainModulePresenter(
            title: model.title,
            sections: model.sections
        )

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
