//
//  TextViewTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

class TextViewTableCell: UITableViewCell, CellProtocol {

    // MARK: - Private properties

    @IBOutlet private weak var textView: UITextView!

    private var model: Model?

    final class Model: CellViewModelProtocol {
        static let cellType: UIView.Type = TextViewTableCell.self
        let text = SingleObservable<String?>(nil)
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        textView.delegate = self
        textView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 12.0

        selectionStyle = .none
    }

    // MARK: - CellProtocol

    func setModel(_ model: Model) {
        self.model = model
    }

}

// MARK: - UITextViewDelegate

extension TextViewTableCell: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        model?.text.value = textView.text
    }

}
