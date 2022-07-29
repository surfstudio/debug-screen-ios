//
//  MainViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - @IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: MainViewOutput?

    // MARK: - Private Properties

    private var adapter: MainAdapter?

    // MARK: - UIViewController

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
        title = L10n.MainViewController.debugTitle
        configureCloseButton()
        configureAdapter()
    }

    func configureCloseButton() {
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel,
                                   target: self,
                                   action: #selector(didTapCloseButton))
        self.navigationItem.rightBarButtonItem = item
    }

    func configureAdapter() {
        adapter = MainAdapter(tableView: tableView)
        adapter?.onSelectCacheCleanerAction = { [weak self] actions in
            self?.output?.selectClearCache(actions: actions)
        }
        adapter?.onSelectServer = { [weak self] action in
            self?.output?.selectServer(action: action)
        }
        adapter?.onToggleFeatureAction = { [weak self] action, newValue in
            self?.output?.featureToggled(model: action, newValue: newValue)
        }
    }

}

// MARK: - Actions

private extension MainViewController {

    @objc
    func didTapCloseButton() {
        output?.didTapCloseButton()
    }

}
