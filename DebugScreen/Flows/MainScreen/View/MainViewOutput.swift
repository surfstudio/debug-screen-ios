//
//  MainViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

protocol MainViewOutput {
    func viewLoaded()
    func didTapCloseButton()
    func selectServer(model: SelectServerActionModel)
    func selectAction(model: ActionsProviderModel)
    func selectText(model: SelectableTextModel)
    func featureToggled(model: FeatureToggleModel, newValue: Bool)
}
