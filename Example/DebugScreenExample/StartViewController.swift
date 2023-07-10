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

    // MARK: - Views

    private let companyNameLabel = UILabel()
    private let shakeMeLabel = UILabel()
    private let showButton = UIButton()
    private let stackView = UIStackView()
    private let shakeSupportTitleLabel = UILabel()
    private let shakeSupportToggle = UISwitch()

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
        view.backgroundColor = Colors.Main.background

        configureCompanyNameLabel()
        configureShakeMeLabel()
        configureShowButton()
        configureStackView()
        configureShakeSupportTitleLabel()
        configureShakeSupportToggle()

        setupConstraints()
    }

    func configureCompanyNameLabel() {
        companyNameLabel.font = .systemFont(ofSize: 45, weight: .regular)
        companyNameLabel.textColor = Colors.Text.primary
        companyNameLabel.text = L10n.StartController.companyNameLabel
    }

    func configureShakeMeLabel() {
        shakeMeLabel.font = .systemFont(ofSize: 22, weight: .regular)
        shakeMeLabel.textColor = Colors.Text.primary
        shakeMeLabel.text = L10n.StartController.shakeMeLabel

        shakeMeLabel.alpha = 0
    }

    func configureShowButton() {
        showButton.clipsToBounds = true
        showButton.layer.cornerRadius = 12

        showButton.setTitleColor(Colors.Buttons.Primary.text, for: [.normal, .highlighted, .disabled])
        showButton.set(backgroundColor: Colors.Buttons.Primary.normalBackground, for: .normal)
        showButton.set(backgroundColor: Colors.Buttons.Primary.highlightedBackground, for: [.highlighted, .selected])

        showButton.setTitleForAllState("Debug Screen")
        showButton.addTarget(self, action: #selector(onShowButtonTap), for: .touchUpInside)
    }

    func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 13
    }

    func configureShakeSupportTitleLabel() {
        shakeSupportTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        shakeSupportTitleLabel.textColor = Colors.Text.primary
        shakeSupportTitleLabel.text = L10n.StartController.shakeSupportTitleLabel
    }

    func configureShakeSupportToggle() {
        shakeSupportToggle.isOn = false
        shakeSupportToggle.addTarget(self, action: #selector(onToggleShakeEnabled), for: .valueChanged)
    }

    func setupConstraints() {
        stackView.addArrangedSubview(shakeSupportTitleLabel)
        stackView.addArrangedSubview(shakeSupportToggle)

        view.addSubview(companyNameLabel)
        view.addSubview(shakeMeLabel)
        view.addSubview(showButton)
        view.addSubview(stackView)

        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        shakeMeLabel.translatesAutoresizingMaskIntoConstraints = false
        showButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            companyNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height / 4),
            shakeMeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shakeMeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            showButton.heightAnchor.constraint(equalToConstant: 50),
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: showButton.bottomAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }

}

// MARK: - Actions

private extension StartViewController {

    @objc
    func onShowButtonTap(_ sender: UIButton) {
        DebugScreenPresenterService.shared.showDebugScreen()
    }

    @objc
    func onToggleShakeEnabled(_ sender: UISwitch) {
        DebugScreenConfiguration.shared.isEnabledOnShake = sender.isOn

        UIView.animate(withDuration: Constants.animationDuration) {
            self.shakeMeLabel.alpha = sender.isOn ? 1 : 0
        }
    }

}
