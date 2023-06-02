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

    public func configure(with message: String?, _ onClose: (() -> Void)? = nil) -> UIAlertController? {
        guard let message = message else {
            return nil
        }

        let alertController = configureAlertController(with: message, onClose: onClose)
        return alertController
    }

}

// MARK: - Private Methods

private extension SimpleAlertModuleConfigurator {

    func configureAlertController(with message: String, onClose: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)

        let okAction = UIAlertAction(title: L10n.Common.Actions.ok, style: .default) { _ in
            onClose?()
        }
        alertController.addAction(okAction)

        return alertController
    }
}
