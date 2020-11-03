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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Select server"

        output?.configureAdapter(tableView: tableView)
    }

}

// MARK: - SelectServerViewInput

extension SelectServerViewController: SelectServerViewInput { }
