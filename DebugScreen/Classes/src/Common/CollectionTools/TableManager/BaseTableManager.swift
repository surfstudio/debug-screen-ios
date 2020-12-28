//
//  BaseTableManager.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit


class BaseTableManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    private weak var tableView: UITableView?
    private var sections: [[TableUnitItem]] = []

    func setTableView(_ tableView: UITableView) {
        self.sections.removeAll()

        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }

    func setSections(_ sections: [[TableUnitItem]]) {
        self.sections = sections

        for section: [TableUnitItem] in sections {
            for item: TableUnitItem in section {
                self.registerCellModel(item)
            }
        }

        self.tableView?.reloadData()
    }

    func didChangeCellHeight() {
        UIView.animate(withDuration: 0.22) {
            self.tableView?.beginUpdates()
            self.tableView?.endUpdates()
        }
    }

    private func registerCellModel(_ item: TableUnitItem) {
        let model: CellViewModelProtocol = item.cellModel()
        let reuseIdentifier: String = type(of: model).reuseIdentifier
        let bundle: Bundle = type(of: model).bundle
        let nib: UINib = UINib(nibName: "\(type(of: model).cellType)", bundle: bundle)

        self.tableView?.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

    private func dequeueReusableCell(unit: TableUnitItem, indexPath: IndexPath) -> UITableViewCell {
        guard let tableView: UITableView = self.tableView else {
            assertionFailure("It seems your UITableView is dead")
            return UITableViewCell()
        }

        let indetifier: String = unit.reuseIdentifier
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: indetifier, for: indexPath)

        unit.bindToCell(cell)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(unit: sections[indexPath.section][indexPath.row], indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let items = self.sections[indexPath.section][indexPath.row].cellModel() as? CellViewModelHeightable else {
            return UITableView.automaticDimension
        }
        return items.heightForTableView(tableView)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let items = self.sections[indexPath.section][indexPath.row].cellModel() as? CellViewModelHeightable else {
            return UITableView.automaticDimension
        }
        return items.heightForTableView(tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (self.sections[indexPath.section][indexPath.row].cellModel() as? CellViewModelSelectable)?.didSelect?()

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
