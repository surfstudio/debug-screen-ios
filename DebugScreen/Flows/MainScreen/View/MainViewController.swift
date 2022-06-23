//
//  MainViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let debugTitle = "Debug Screen"
    }

    // MARK: - @IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Public properties

    var output: MainViewOutput?

    // MARK: - Private properties

    private var adapter: MainAdapter?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

    func setupInitialState(sections: [TableSection]) {
        configureAppearance()
        update(sections: sections)
    }

    func update(sections: [TableSection]) {
        adapter?.fill(with: sections)
    }

}

// MARK: - Configuration

private extension MainViewController {

    func configureAppearance() {
        title = Constants.debugTitle
        setCloseButton()
        configureAdapter()
    }

    func configureAdapter() {
        adapter = MainAdapter(tableView: tableView)
        adapter?.onSelectCacheCleanerAction = { [weak self] actions in
            self?.output?.clearCacheSelected(actions: actions)
        }
        adapter?.onSelectServer = { [weak self] action in
            self?.output?.serverSelected(action: action)
        }
        adapter?.onToggleFeatureAction = { [weak self] action, newValue in
            self?.output?.featureToggled(model: action, newValue: newValue)
        }
    }

    func setCloseButton() {
        let item = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.cancel,
            target: self,
            action: #selector(didTapCloseButton)
        )
        self.navigationItem.rightBarButtonItem = item
    }

}

// MARK: - Actions

private extension MainViewController {

    @objc
    func didTapCloseButton() {
        output?.didTapCloseButton()
    }

}
