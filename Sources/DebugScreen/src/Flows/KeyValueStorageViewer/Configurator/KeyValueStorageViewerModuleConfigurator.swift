//
//  KeyValueStorageViewerModuleConfigurator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation
import UIKit

typealias KeyValueStorageViewerModuleComponents = (view: UIViewController, output: KeyValueStorageViewerModuleOutput, input: KeyValueStorageViewerModuleInput)

final class KeyValueStorageViewerModuleConfigurator {

    func configure(storage: KeyValueStorageDataProvider) -> KeyValueStorageViewerModuleComponents {
        let viewController: KeyValueStorageViewerViewController = UIViewController.instantiate(ofType: KeyValueStorageViewerViewController.self)

        let presenter = KeyValueStorageViewerPresenter(storage: storage)

        presenter.view = viewController
        viewController.output = presenter

        return (viewController, presenter, presenter)
    }
}
