//
//  SwitcherTableCell.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

import UIKit

class SwitcherTableCell: UITableViewCell, CellProtocol {

    // MARK: - Model

    final class Model: CellViewModelProtocol {
        static let cellType: UIView.Type = SwitcherTableCell.self
        let title: String?
        let isOn = SingleObservable<Bool>(false)
        let didChangeValueBlock: ((Bool) -> Void)?

        init(title: String?, isOn: Bool, didChangeValue: ((Bool) -> Void)?) {
            self.title = title
            self.isOn.value = isOn
            self.didChangeValueBlock = didChangeValue
        }
    }

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var switchControl: UISwitch!

    private var model: Model?

    func setModel(_ model: Model) {
        selectionStyle = .none
        titleLabel.text = model.title

        model.isOn.addObserver(self) { [weak self] (isOn: Bool) in
            self?.switchControl.isOn = isOn
        }

        self.model = model
    }

    // MARK: - Actions

    @IBAction private func didChangeSwitchControl(_ sender: Any) {
        model?.didChangeValueBlock?(switchControl.isOn)
    }

}
