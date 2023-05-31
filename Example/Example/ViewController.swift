//
//  ViewController.swift
//  Example
//
//  Created by vasilev on 20.06.2022.
//

import UIKit
import DebugScreen

final class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var shakeMeLabel: UILabel!
    @IBOutlet private weak var shakeEnabledToggle: UISwitch!
    @IBOutlet private weak var showButton: UIButton!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureDebugScreen()
    }

}

// MARK: - Appearance

private extension ViewController {

    func configureAppearance() {
        shakeMeLabel.alpha = 0
        shakeEnabledToggle.isOn = false

        configureShowButton()
    }

    func configureShowButton() {
        showButton.clipsToBounds = true
        showButton.layer.cornerRadius = 12
        showButton.titleLabel?.textColor = .white

        let normalBackground = UIColor(red: 0.094, green: 0.094, blue: 0.102, alpha: 1)
        let highlightedBackground = UIColor(red: 0.075, green: 0.075, blue: 0.078, alpha: 1)

        showButton.setTitleColor(.white, for: .normal)
        showButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        showButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .disabled)

        showButton.set(backgroundColor: normalBackground, for: .normal)
        showButton.set(backgroundColor: highlightedBackground, for: [.highlighted, .selected])

        showButton.setTitleForAllState("Debug Screen")
    }

}

// MARK: - Actions

private extension ViewController {

    @IBAction func onShowButtonTap(_ sender: UIButton) {
        DebugScreenPresenterService.shared.showDebugScreen()
    }

    @IBAction func onToggleShakeEnabled(_ sender: UISwitch) {
        DebugScreenConfiguration.shared.isEnabledOnShake = sender.isOn

        UIView.animate(withDuration: 0.3) {
            self.shakeMeLabel.alpha = sender.isOn ? 1 : 0
        }
    }

}

// MARK: - Private Methods

private extension ViewController {

    func configureDebugScreen() {
        DebugScreenConfiguration.shared.actionsProvider = ActionsProviderExample()
        DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
        DebugScreenConfiguration.shared.featureToggleActionsProvider = FeatureToggleProvider()
        DebugScreenConfiguration.shared.selectableTextProvider = TextsProvider()

        DebugScreenConfiguration.shared.logCatcherService.start()
    }

}
