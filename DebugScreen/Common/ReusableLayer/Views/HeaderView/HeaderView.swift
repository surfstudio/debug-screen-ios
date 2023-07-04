//
//  HeaderView.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

final class HeaderView: UIView {

    // MARK: - Private Properties

    private let titleLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: HeaderViewModel) {
        configureTitleLabel(with: model)
        backgroundColor = model.backgroundColor
    }

}

// MARK: - Appearance

private extension HeaderView {

    func configureAppearance() {
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

}

// MARK: - Private Methods

private extension HeaderView {

    func configureTitleLabel(with model: HeaderViewModel) {
        titleLabel.font = model.font
        titleLabel.textColor = model.textColor
        titleLabel.textAlignment = .left

        titleLabel.text = model.text
    }

}
