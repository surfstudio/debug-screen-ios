//
//  InfoTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.12.2020.
//

import UIKit

class InfoTableCell: UITableViewCell, CellProtocol {

    // MARK: - Model

    struct Model: CellViewModelProtocol {
        static let cellType: UIView.Type = InfoTableCell.self
        let deviceInfo: String?
        let appInfo: String?
        let notificationsPermission = SingleObservable<String?>(nil)
        let photoLibraryPermission: String?
        let geolocationPermission: String?
        let cameraPermission: String?
    }

    // MARK: - Private Properties

    @IBOutlet private weak var deviceLabel: UILabel!
    @IBOutlet private weak var appInfoLabel: UILabel!
    @IBOutlet private weak var libraryPermissionLabel: UILabel!
    @IBOutlet private weak var geolocationPermissionLabel: UILabel!
    @IBOutlet private weak var cameraPermissionLabel: UILabel!
    @IBOutlet private weak var notificationsPermissionLabel: UILabel!

    // MARK: - CellProtocol

    func setModel(_ model: Model) {
        deviceLabel.text = model.deviceInfo
        appInfoLabel.text = model.appInfo
        libraryPermissionLabel.text = model.photoLibraryPermission
        geolocationPermissionLabel.text = model.geolocationPermission
        cameraPermissionLabel.text = model.cameraPermission
        notificationsPermissionLabel.text = nil

        model.notificationsPermission.addObserver(self) { [weak self] (text: String?) in
            self?.notificationsPermissionLabel.text = text
        }

        /*model.photoLibraryPermission.addObserver(self) { [weak self] (text: String?) in
            self?.libraryPermissionLabel.text = text
        }

        model.geolocationPermission.addObserver(self) { [weak self] (text: String?) in
            self?.geolocationPermissionLabel.text = text
        }

        model.cameraPermission.addObserver(self) { [weak self] (text: String?) in
            self?.cameraPermissionLabel.text = text
        }*/
    }

}
