//
//  SelectorCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

final class SelectorCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let numberOfComponents = 1
        static let rowHeightForComponent: CGFloat = 34
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var pickerView: UIPickerView!

    // MARK: - Properties

    var onSelectItem: ((SelectionListItem) -> Void)?

    // MARK: - Private Properties

    private var values: [SelectionListItem] = []
    private var directAction: ((SelectionListItem) -> Void)?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: SelectionList) {
        directAction = model.onSelectAction
        values = model.items

        pickerView.reloadAllComponents()
        scroll(to: model.selectedItem)
    }

}

// MARK: - UIPickerViewDataSource

extension SelectorCell: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.numberOfComponents
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }

}

// MARK: - UIPickerViewDelegate

extension SelectorCell: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return Constants.rowHeightForComponent
    }

    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let label = configureItemLabel(with: view)
        label.text = values[row].name

        return label
    }

    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        let index = pickerView.selectedRow(inComponent: 0)
        guard let value = values[safe: index] else {
            return
        }

        directAction?(value)
        onSelectItem?(value)
    }

}

// MARK: - Appearance

private extension SelectorCell {

    func configureAppearance() {
        selectionStyle = .none
        configurePickerView()
    }

    func configurePickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }

}

// MARK: - Private Methods

private extension SelectorCell {

    func configureItemLabel(with view: UIView?) -> UILabel {
        let label = (view as? UILabel) ?? UILabel()
        label.font = .systemFont(ofSize: 21, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center

        return label
    }

    func scroll(to item: SelectionListItem?) {
        guard
            let selectedItem = item,
            let index = values.firstIndex(where: { $0.name == selectedItem.name })
        else {
            return
        }

        pickerView.selectRow(index, inComponent: 0, animated: false)
    }

}
