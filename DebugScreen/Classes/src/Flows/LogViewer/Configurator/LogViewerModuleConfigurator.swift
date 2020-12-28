//
//  LogViewerModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

typealias LogViewerModuleComponents = (view: UIViewController, output: LogViewerModuleOutput, input: LogViewerModuleInput)

class LogViewerModuleConfigurator {

    func configure() -> LogViewerModuleComponents {
        let viewController: LogViewerViewController = UIViewController.instantiate(ofType: LogViewerViewController.self)

        let presenter = LogViewerPresenter(service: DebugScreenConfiguration.shared.logCatcherService)

        presenter.view = viewController
        viewController.output = presenter

        return (viewController, presenter, presenter)
    }
}
