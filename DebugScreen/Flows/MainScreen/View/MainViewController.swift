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
        adapter?.fill(with: sections)
    }

}

// MARK: - Appearance

private extension MainViewController {

    func configureAppearance() {
        configureNavigationBar()
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar() {
        navigationItem.title = L10n.MainViewController.debugTitle
        configureCloseButton()
    }

    func configureTableView() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 10,
                                       left: 0,
                                       bottom: 32,
                                       right: 0)
    }

    func configureAdapter() {
        adapter = MainAdapter(tableView: tableView)
        adapter?.onOpenActionList = { [weak self] model in
            self?.output?.didTapActionList(model: model)
        }
        adapter?.onOpenScreenAction = { [weak self] view in
            self?.output?.didTapOpenScreenAction(view: view)
        }
        adapter?.onSelectableTextTap = { [weak self] model in
            self?.output?.didTapSelectableText(model: model)
        }
    }

    func configureCloseButton() {
        let closeButton = UIBarButtonItem(
            image: Resources.Assets.Icons.close.image.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(didTapCloseButton)
        )

        self.navigationItem.rightBarButtonItem = closeButton
    }

}

// MARK: - Actions

private extension MainViewController {

    @objc
    func didTapCloseButton() {
        output?.didTapCloseButton()
    }

}
