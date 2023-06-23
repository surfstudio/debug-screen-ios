//
//  DestinationViewController.swift
//  Example
//
//  Created by Ilya Klimenyuk on 04.06.2023.
//

import DebugScreen
import UIKit

final class DestinationViewController: UIViewController {

    // MARK: - Private Properties

    private let titleLabel = UILabel()

    // MARK: - Deinitialization

    deinit {
        debugPrint("❗️\(self) deinitialized")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

}

// MARK: - Appearance

private extension DestinationViewController {

    func configureAppearance() {
        view.backgroundColor = Colors.Main.background

        configureNavigationBar()
        setupConstraints()
        configureTitleLabel()
    }

    func configureNavigationBar() {
        navigationItem.title = L10n.DestinationController.title
        configureCloseButton()
    }

    func setupConstraints() {
        view.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        titleLabel.textColor = Colors.Text.primary
        titleLabel.textAlignment = .center

        titleLabel.text = L10n.DestinationController.contentText
    }

    func configureCloseButton() {
        let closeIcon = Resources.Assets.Icons.close.image.withTintColor(Colors.Buttons.Primary.normalBackground,
                                                                         renderingMode: .alwaysOriginal)
        let closeButton = UIBarButtonItem(
            image: closeIcon,
            style: .plain,
            target: self,
            action: #selector(didTapCloseButton)
        )

        navigationItem.rightBarButtonItem = closeButton
    }

}

// MARK: - Actions

private extension DestinationViewController {

    @objc
    func didTapCloseButton() {
        navigationController?.dismiss(animated: true)
    }

}
