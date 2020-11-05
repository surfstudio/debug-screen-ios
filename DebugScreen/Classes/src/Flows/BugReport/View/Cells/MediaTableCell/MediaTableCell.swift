//
//  MediaTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 05.11.2020.
//

import UIKit
import ReactiveDataDisplayManager

class MediaTableCell: UITableViewCell {

    struct Model {
        let previewImage: UIImage?
        let title: String
    }

    // MARK: - Private properties

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var actionLabel: UILabel!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        previewImageView.isHidden = true
    }

}

// MARK: - Configurable

extension MediaTableCell: Configurable {

    func configure(with model: Model) {
        previewImageView.image = model.previewImage
        previewImageView.isHidden = (model.previewImage == nil)

        actionLabel.text = model.title
    }

}
