//
//  TextViewTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit
import ReactiveDataDisplayManager

class TextViewTableCell: UITableViewCell {

    // MARK: - Private properties

    @IBOutlet private weak var textView: UITextView!

    private var model: Model?

    struct Model {
        let didChangeTextBlock: ((String?) -> Void)
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

}

// MARK: - Configurable

extension TextViewTableCell: Configurable {

    func configure(with model: Model) {
        self.model = model
    }

}

// MARK: - UITextViewDelegate

extension TextViewTableCell: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        model?.didChangeTextBlock(textView.text)
    }

}
