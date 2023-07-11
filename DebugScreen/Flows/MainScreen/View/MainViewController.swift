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
        view.backgroundColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor
        configureNavigationBar()
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar() {
        navigationItem.title = L10n.MainViewController.debugTitle
        configureCloseButton()
    }

    func configureTableView() {
        tableView.backgroundColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0,
                                       left: 0,
                                       bottom: 32,
                                       right: 0)
    }

    func configureAdapter() {
        adapter = MainAdapter(tableView: tableView)
        adapter?.onOpenActionList = { [weak self] model in
            self?.output?.didTapActionList(model: model)
        }
        adapter?.onOpenInfoTable = { [weak self] model in
            self?.output?.didTapInfoTable(model: model)
        }
        adapter?.onSelectableTextTap = { [weak self] model in
            self?.output?.didTapSelectableText(model: model)
        }
    }

    func configureCloseButton() {
        let closeIcon = Resources.Assets.Icons.close.image.withTintColor(
            DebugScreenConfiguration.shared.colorScheme.textColor,
            renderingMode: .alwaysOriginal
        )
        let closeButton = UIBarButtonItem(
            image: closeIcon,
            style: .plain,
            target: self,
            action: #selector(didTapCloseButton)
        )

        navigationItem.rightBarButtonItem = closeButton
    }

}

// MARK: - Actions

private extension MainViewController {

    @objc
    func didTapCloseButton() {
        output?.didTapCloseButton()
    }

}
