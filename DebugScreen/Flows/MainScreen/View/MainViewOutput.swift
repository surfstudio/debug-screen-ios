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
    func selectServer(action: SelectServerAction)
    func selectAction(model: ActionsProviderModel)
    func featureToggled(model: FeatureToggleModel, newValue: Bool)
}
