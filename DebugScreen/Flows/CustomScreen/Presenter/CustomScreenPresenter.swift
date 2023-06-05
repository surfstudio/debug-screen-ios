//
//  CustomScreenPresenter.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 05.06.2023.
//

import UIKit

final class CustomScreenPresenter: CustomScreenModuleOutput {

    // MARK: - CustomScreenModuleOutput

    var didModuleDismissed: (() -> Void)?

    // MARK: - Properties

    weak var view: DebugScreenPresentableViewInput?

    // MARK: - Deinitialization

    deinit {
        didModuleDismissed?()
    }

}

// MARK: - CustomScreenModuleInput

extension CustomScreenPresenter: CustomScreenModuleInput {}

// MARK: - DebugScreenPresentableViewOutput

extension CustomScreenPresenter: DebugScreenPresentableViewOutput {}
