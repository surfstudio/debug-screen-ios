//
//  StartViewController.swift
//  Example
//
//  Created by vasilev on 20.06.2022.
//

import UIKit
import DebugScreen

final class StartViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let animationDuration: CGFloat = 0.3
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var shakeMeLabel: UILabel!
    @IBOutlet private weak var shakeSupportToggle: UISwitch!
    @IBOutlet private weak var showButton: UIButton!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureShowButton()
    }

}

// MARK: - Appearance

private extension StartViewController {

    func configureAppearance() {
        configureShakeMeLabel()
        configureShakeSupportToggle()
        configureShowButton()
    }

    func configureShakeMeLabel() {
        shakeMeLabel.alpha = 0
        shakeMeLabel.textColor = Colors.Text.primary
    }

    func configureShakeSupportToggle() {
        shakeSupportToggle.isOn = false
        shakeSupportToggle.onTintColor = Colors.Buttons.Secondary.normalBackground
    }

    func configureShowButton() {
        showButton.clipsToBounds = true
        showButton.layer.cornerRadius = 12

        showButton.setTitleColor(Colors.Buttons.Primary.text, for: [.normal, .highlighted, .disabled])
        showButton.set(backgroundColor: Colors.Buttons.Primary.normalBackground, for: .normal)
        showButton.set(backgroundColor: Colors.Buttons.Primary.highlightedBackground, for: [.highlighted, .selected])

        showButton.setTitleForAllState("Debug Screen")
    }

}

// MARK: - Actions

private extension StartViewController {

    @IBAction func onShowButtonTap(_ sender: UIButton) {
        DebugScreenPresenterService.shared.showDebugScreen()
    }

    @IBAction func onToggleShakeEnabled(_ sender: UISwitch) {
        DebugScreenConfiguration.shared.isEnabledOnShake = sender.isOn

        UIView.animate(withDuration: Constants.animationDuration) {
            self.shakeMeLabel.alpha = sender.isOn ? 1 : 0
        }
    }

}
