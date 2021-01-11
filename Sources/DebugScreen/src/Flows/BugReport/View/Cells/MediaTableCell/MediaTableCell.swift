//
//  MediaTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 05.11.2020.
//

import UIKit

class MediaTableCell: UITableViewCell, CellProtocol {

    final class Model: CellViewModelProtocol, CellViewModelSelectable {
        var didSelect: (() -> Void)?
        static let cellType: UIView.Type = MediaTableCell.self
        let previewImage = SingleObservable<UIImage?>(nil)
    }

    // MARK: - Private properties

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var actionLabel: UILabel!

    // MARK: - CellProtocol

    func setModel(_ model: Model) {
        model.previewImage.addObserver(self) { [weak self] (image: UIImage?) in
            self?.previewImageView.image = image
            self?.previewImageView.isHidden = (image == nil)

            self?.actionLabel.text = (image == nil) ? "Add image" : "Delete image"
        }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        previewImageView.isHidden = true
    }

}
