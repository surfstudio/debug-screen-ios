//
//  SelectServerViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

class SelectServerViewController: UIViewController {

    // MARK: - Public properties

    var output: SelectServerViewOutput?

    // MARK: - Private properties

    @IBOutlet private weak var tableView: UITableView!
    private var adapter: SelectServerAdapter?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - SelectServerViewInput

extension SelectServerViewController: SelectServerViewInput {

    func setupInitialState(actions: [SelectServerAction]) {
        configureAppearance()
        update(actions: actions)
    }

    func update(actions: [SelectServerAction]) {
        adapter?.fill(with: actions)
    }

}

// MARK: - Appearance

private extension SelectServerViewController {

    func configureAppearance() {
        title = "Select server"
        configureAdapter()
    }

    func configureAdapter() {
        adapter = SelectServerAdapter(tableView: tableView)
        adapter?.onSelectServer = { [weak self] action in
            self?.output?.serverSelected(action: action)
        }
    }

}
