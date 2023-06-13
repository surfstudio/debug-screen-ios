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
        view.backgroundColor = .white
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
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center

        titleLabel.text = L10n.DestinationController.contentText
    }

    func configureCloseButton() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapOnClose))
        navigationItem.rightBarButtonItem = closeButton
    }

}

// MARK: - Actions

private extension DestinationViewController {

    @objc
    func tapOnClose() {
        navigationController?.dismiss(animated: true)
    }

}
