//
//  InfoTableViewController.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import UIKit

final class InfoTableViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Constants

    private enum Constants {
        static let headerHeight: CGFloat = 50
    }

    // MARK: - @IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: InfoTableViewOutput?

    // MARK: - Private Properties

    private var adapter: InfoTableViewAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - InfoTableViewInput

extension InfoTableViewController: InfoTableViewInput {

    func setupInitialState(with model: InfoTableModel) {
        configureAppearance(with: model.header)
        adapter?.fill(with: model.sections)
    }

}

// MARK: - Appearance

private extension InfoTableViewController {

    func configureAppearance(with title: String) {
        view.backgroundColor = Colors.Main.background

        configureNavigationBar(with: title)
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar(with title: String) {
        navigationItem.title = title
    }

    func configureTableView() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = Colors.Main.background
        tableView.contentInset = .init(top: 8,
                                       left: 0,
                                       bottom: 32,
                                       right: 0)
        tableView.sectionHeaderHeight = Constants.headerHeight
        tableView.estimatedSectionHeaderHeight = Constants.headerHeight
    }

    func configureAdapter() {
        adapter = InfoTableViewAdapter(tableView: tableView)
    }

}
