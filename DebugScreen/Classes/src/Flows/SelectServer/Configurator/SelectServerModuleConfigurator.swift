//
//  SelectServerModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

typealias SelectServerModuleComponents = (view: UIViewController, output: SelectServerModuleOutput)

final class SelectServerModuleConfigurator {

    // MARK: - Public methods

    func configure(provider: SelectServerActionsProvider) -> SelectServerModuleComponents {
        let viewController: SelectServerViewController = UIViewController.instantiate(ofType: SelectServerViewController.self)

        let presenter = SelectServerPresenter(provider: provider)

        presenter.view = viewController
        viewController.output = presenter

        return (viewController, presenter)
    }

}
