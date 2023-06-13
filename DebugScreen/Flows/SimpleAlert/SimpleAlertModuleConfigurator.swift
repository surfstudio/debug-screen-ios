//
//  SimpleAlertModuleConfigurator.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 19.05.2023.
//

import UIKit

final class SimpleAlertModuleConfigurator {

    // MARK: - Initialization

    init() {}

    // MARK: - Public Methods

    func configure(with model: AlertModel) -> UIAlertController? {
        let alertController = configureAlertController(with: model)
        return alertController
    }

}

// MARK: - Private Methods

private extension SimpleAlertModuleConfigurator {

    func configureAlertController(with model: AlertModel) -> UIAlertController {
        let alertController = UIAlertController(title: model.title,
                                                message: model.message,
                                                preferredStyle: .alert)

        let okAction = UIAlertAction(title: L10n.Common.Actions.ok, style: .default)
        alertController.addAction(okAction)

        return alertController
    }
}
