//
//  SectionScreenViewController.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import UIKit

final class SectionScreenViewController: UIViewController {

    // MARK: - @IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: SectionScreenViewOutput?

    // MARK: - Private Properties

    private var adapter: MainAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - SectionScreenViewInput

extension SectionScreenViewController: SectionScreenViewInput {

    func setupInitialState(with title: String, sections: [TableSection]) {
        configureAppearance(with: title)
        adapter?.fill(with: sections)
    }

}

// MARK: - Appearance

private extension SectionScreenViewController {

    func configureAppearance(with title: String) {
        view.backgroundColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor
        configureNavigationBar(with: title)
        configureTableView()
        configureAdapter()
    }

    func configureNavigationBar(with title: String) {
        navigationItem.title = title
    }

    func configureTableView() {
        tableView.backgroundColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0, left: 0, bottom: 32, right: 0)
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
        adapter?.onOpenSectionScreen = { [weak self] model in
            self?.output?.didTapSectionScreen(model: model)
        }
    }

}
