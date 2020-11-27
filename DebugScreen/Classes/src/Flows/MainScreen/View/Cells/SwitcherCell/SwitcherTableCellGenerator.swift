//
//  SwitcherTableCellGenerator.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

import ReactiveDataDisplayManager

final class SwitcherTableCellGenerator {

    // MARK: - Public Properties

    var didChangeSwitch: ((Bool) -> Void)?

    // MARK: - Private Properties

    private var view: SwitcherTableCell?

    // MARK: - Initialization

    init(with model: FeatureToggleModel) {
        configureCell()
        view?.configure(with: model)
        view?.didChangeSwitch = { [weak self] newValue in
            self?.didChangeSwitch?(newValue)
        }
    }

    // MARK: - Private Methods

    private func configureCell() {
        let bundle = Bundle(for: SwitcherTableCell.self)
        let nib = UINib(nibName: identifier, bundle: bundle)

        view = nib.instantiate(withOwner: SwitcherTableCell.self, options: nil).first as? SwitcherTableCell
    }

}

// MARK: - UITableViewCell

extension SwitcherTableCellGenerator: TableCellGenerator {

    func registerCell(in tableView: UITableView) {
        tableView.register(SwitcherTableCell.self, forCellReuseIdentifier: identifier)
    }

    var identifier: String {
        String(describing: SwitcherTableCell.self)
    }

    func generate(tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        view ?? UITableViewCell()
    }

}
