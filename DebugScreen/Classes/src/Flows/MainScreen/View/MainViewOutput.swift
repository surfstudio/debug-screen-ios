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
    func serverSelected()
    func clearCacheSelected(actions: [CacheCleanerAction])
    func featureToggled(model: FeatureToggleModel, newValue: Bool)

}
