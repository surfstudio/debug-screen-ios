//
//  InfoTableModuleConfigurator.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import UIKit

typealias InfoTableModuleComponents = (
    view: UIViewController,
    output: InfoTableModuleOutput
)

final class InfoTableModuleConfigurator {

    // MARK: - Methods

    func configure(with model: InfoTableModel) -> InfoTableModuleComponents {
        let view = UIViewController.instantiate(ofType: InfoTableViewController.self)
        let presenter = InfoTablePresenter(model: model)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
