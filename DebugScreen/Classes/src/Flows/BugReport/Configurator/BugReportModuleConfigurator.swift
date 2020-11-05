//
//  BugReportModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

typealias BugReportModuleComponents = (view: UIViewController, output: BugReportModuleOutput, input: BugReportModuleInput)

class BugReportModuleConfigurator {

    func configure() -> BugReportModuleComponents {
        let viewController: BugReportViewController = UIViewController.instantiate(ofType: BugReportViewController.self)

        let presenter = BugReportPresenter()

        presenter.view = viewController
        viewController.output = presenter

        return (viewController, presenter, presenter)
    }
}
