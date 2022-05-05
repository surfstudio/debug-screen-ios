//
//  SelectServerPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

final class SelectServerPresenter: SelectServerModuleOutput {

    // MARK: - Public properties

    weak var view: SelectServerViewInput?

    // MARK: - Private properties

    private let provider: SelectServerActionsProvider

    // MARK: - Initialization

    init(provider: SelectServerActionsProvider) {
        self.provider = provider
    }

}

// MARK: - SelectServerModuleInput

extension SelectServerPresenter: SelectServerModuleInput { }

// MARK: - SelectServerViewOutput

extension SelectServerPresenter: SelectServerViewOutput {

    func viewLoaded() {
        let actions: [SelectServerAction] = provider.servers()
        view?.setupInitialState(actions: actions)
    }

    func serverSelected(action: SelectServerAction) {
        provider.didSelectServer(action)
        view?.update(actions: provider.servers())
    }

}
