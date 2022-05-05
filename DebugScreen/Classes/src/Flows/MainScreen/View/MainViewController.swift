//
//  MainViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Public properties

    var output: MainViewOutput?

    // MARK: - Private properties

    @IBOutlet private weak var tableView: UITableView!
    private var adapter: MainAdapter?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

    func setupInitialState(blocks: [MainTableBlock]) {
        configureAppearance()
        adapter?.fill(with: blocks)
    }

}

// MARK: - Private methods

private extension MainViewController {

    func configureAppearance() {
        title = "Debug Screen"
        setCloseButton()
        configureAdapter()
    }

    func configureAdapter() {
        adapter = MainAdapter(tableView: tableView)
        adapter?.onSelectCacheCleanerAction = { [weak self] actions in
            self?.output?.clearCacheSelected(actions: actions)
        }
        adapter?.onSelectServer = { [weak self] in
            self?.output?.serverSelected()
        }
        adapter?.onToggleFeatureAction = { [weak self] action, newValue in
            self?.output?.featureToggled(model: action, newValue: newValue)
        }
    }

    func setCloseButton() {
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(didTapCloseButton))
        self.navigationItem.rightBarButtonItem = item
    }

    @objc
    func didTapCloseButton() {
        output?.didTapCloseButton()
    }

}
