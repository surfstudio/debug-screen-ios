//
//  SectionScreenModuleConfigurator.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import UIKit

typealias SectionScreenModuleComponents = (
    view: UIViewController,
    output: SectionScreenModuleOutput
)

final class SectionScreenModuleConfigurator {

    // MARK: - Methods

    func configure(with model: SectionScreen) -> SectionScreenModuleComponents {
        let view = UIViewController.instantiate(ofType: SectionScreenViewController.self)
        let presenter = SectionScreenPresenter(model: model)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
