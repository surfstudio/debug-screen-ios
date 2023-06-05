//
//  CustomScreenModuleConfigurator.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 05.06.2023.
//

import UIKit

typealias CustomScreenModuleComponents = (
    view: UIViewController,
    output: CustomScreenModuleOutput
)

final class CustomScreenModuleConfigurator {

    // MARK: - Initialization

    init() {}

    // MARK: - Methods

    func configure(with view: DebugScreenPresentableController) -> CustomScreenModuleComponents {
        let presenter = CustomScreenPresenter()

        view.output = presenter
        presenter.view = view

        let navController = UINavigationController(rootViewController: view)
        navController.modalPresentationStyle = .overFullScreen

        return (navController, presenter)
    }

}
