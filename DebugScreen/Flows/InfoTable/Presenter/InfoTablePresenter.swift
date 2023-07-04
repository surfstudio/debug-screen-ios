//
//  InfoTablePresenter.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

final class InfoTablePresenter: InfoTableModuleOutput {

    // MARK: - InfoTableModuleOutput

    var didModuleClosed: (() -> Void)?

    // MARK: - Properties

    weak var view: InfoTableViewInput?

    // MARK: - Private Properties

    private let model: InfoTableModel

    // MARK: - Initialization

    init(model: InfoTableModel) {
        self.model = model
    }

}

// MARK: - InfoTableModuleInput

extension InfoTablePresenter: InfoTableModuleInput {}

// MARK: - InfoTableViewOutput

extension InfoTablePresenter: InfoTableViewOutput {

    func viewLoaded() {
        view?.setupInitialState(with: model)
    }

    func didTapBackButton() {
        didModuleClosed?()
    }

}
