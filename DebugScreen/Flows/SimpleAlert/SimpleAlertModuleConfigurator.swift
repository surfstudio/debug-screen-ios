//
//  SimpleAlertModuleConfigurator.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 19.05.2023.
//

import UIKit

public final class SimpleAlertModuleConfigurator {

    // MARK: - Initialization

    public init() {}

    // MARK: - Public Methods

    public func configure(with message: String?) -> UIAlertController? {
        guard let message = message else {
            return nil
        }

        let alertController = configureAlertController(with: message)
        return alertController
    }

}

// MARK: - Private Methods

private extension SimpleAlertModuleConfigurator {

    func configureAlertController(with message: String) -> UIAlertController {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)

        let okAction = UIAlertAction(title: L10n.Common.Actions.ok, style: .default)
        alertController.addAction(okAction)

        return alertController
    }
}
