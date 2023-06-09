//
//  ViewController.swift
//  Example
//
//  Created by vasilev on 20.06.2022.
//

import UIKit
import DebugScreen

final class ViewController: UIViewController {

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

}

// MARK: - Appearance

private extension ViewController {

    func configureAppearance() {
        shakeMeLabel.alpha = 0
        shakeSupportToggle.isOn = false

        configureShowButton()
    }

    func configureShowButton() {
        showButton.clipsToBounds = true
        showButton.layer.cornerRadius = 12

        let normalBackground = UIColor(red: 0.051, green: 0.047, blue: 0.071, alpha: 1)
        let highlightedBackground = UIColor(red: 0.122, green: 0.122, blue: 0.129, alpha: 1)

        showButton.setTitleColor(.white, for: [.normal, .highlighted, .disabled])
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

        UIView.animate(withDuration: Constants.animationDuration) {
            self.shakeMeLabel.alpha = sender.isOn ? 1 : 0
        }
    }

}
