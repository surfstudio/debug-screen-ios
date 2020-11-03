//
//  MainViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit
import ReactiveDataDisplayManager

class MainViewController: UIViewController {

    // MARK: - Public properties

    var output: MainViewOutput?

    // MARK: - Private properties

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Debug Screen"

        setCloseButton()

        output?.configureAdapter(tableView: tableView)
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput { }

// MARK: - Private methods

private extension MainViewController {

    func setCloseButton() {
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(didTapCloseButton))
        self.navigationItem.rightBarButtonItem = item
    }

    @objc
    func didTapCloseButton() {
        output?.didTapCloseButton()
    }

}
