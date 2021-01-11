//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation
import Photos
import UserNotifications
import AVKit
import CoreLocation
import Device

final class MainModulePresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var closeModuleBlock: (() -> Void)?
    var showCacheClearingOptionsBlock: (([CacheCleanerAction]) -> Void)?
    var showBugReportBlock: (() -> Void)?
    var showSelectServerBlock: (() -> Void)?
    var showLogsViewerBlock: (() -> Void)?
    var showKeyValueStorageSelector: (([KeyValueStorageDataProvider]) -> Void)?

    weak var view: MainViewInput?

    // MARK: - Private properties

    private let adapter = BaseTableManager()
    private var infoModel: InfoTableCell.Model?

}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput { }

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func configureAdapter(tableView: UITableView) {
        adapter.bindTableView(tableView)
        fillAdapter()
    }

    func didTapCloseButton() {
        closeModuleBlock?()
    }

}

// MARK: - Private methods

private extension MainModulePresenter {

    func fillAdapter() {
        var items = [TableUnitItem]()

        if let actions: [CacheCleanerAction] = DebugScreenConfiguration.shared.cacheCleanerActionsProvider?.actions(),
           !actions.isEmpty {
            items.append(createCacheClearerUnit(actions: actions))
        }

        if DebugScreenConfiguration.shared.selectServerActionsProvider != nil {
            items.append(createSelectServerUnit())
        }

        items.append(createBugReportUnit())
        items.append(createViewLogsUnit())

        if let storages: [KeyValueStorageDataProvider] = DebugScreenConfiguration.shared.keyValueStoragesProvider?.storages(),
           !storages.isEmpty {
            items.append(createKeyValueStoragesViewerUnit(storages: storages))
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            featureToggles.forEach {
                items.append(createFeatureToggleUnit(action: $0))
            }
        }

        items.append(createInfoUnit())

        adapter.setSections([items])
    }

    func createCacheClearerUnit(actions: [CacheCleanerAction]) -> TableUnitItem {
        let model = TextTableCell.Model(title: "Clear application data")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showCacheClearingOptionsBlock?(actions)
        }

        return unit
    }

    func createSelectServerUnit() -> TableUnitItem {
        let model = TextTableCell.Model(title: "Select server")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showSelectServerBlock?()
        }

        return unit
    }

    func createBugReportUnit() -> TableUnitItem {
        let model = TextTableCell.Model(title: "Report a bug")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showBugReportBlock?()
        }

        return unit
    }

    func createViewLogsUnit() -> TableUnitItem {
        let model = TextTableCell.Model(title: "Inspect logs")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showLogsViewerBlock?()
        }

        return unit
    }

    func createKeyValueStoragesViewerUnit(storages: [KeyValueStorageDataProvider]) -> TableUnitItem {
        let model = TextTableCell.Model(title: "Key-value storages")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showKeyValueStorageSelector?(storages)
        }

        return unit
    }

    func createFeatureToggleUnit(action: FeatureToggleModel) -> TableUnitItem {
        let model = SwitcherTableCell.Model(title: action.title, isOn: action.isEnabled) { (isEnabled: Bool) in
            DebugScreenConfiguration.shared.featureToggleActionsProvider?.handleAction(action)
        }

        action.didChangeEnabled = { [weak model] (isEnabled: Bool) in
            model?.isOn.value = isEnabled
        }

        let unit = TableCellUnit<SwitcherTableCell>.create(model)

        return unit
    }

    func createInfoUnit() -> TableUnitItem {
        let geolocationPermission: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            geolocationPermission = CLLocationManager().authorizationStatus
        } else {
            geolocationPermission = CLLocationManager.authorizationStatus()
        }

        let deviceName: String = UIDevice.version().description
        let iOSVersion: String = UIDevice.current.systemVersion

        let model = InfoTableCell.Model(deviceInfo: "\(deviceName), \(UIDevice.current.systemName) \(iOSVersion)",
                                        appInfo: appInfoString(),
                                        photoLibraryPermission: PHPhotoLibrary.authorizationStatus().toString(),
                                        geolocationPermission: geolocationPermission.toString(),
                                        cameraPermission: AVCaptureDevice.authorizationStatus(for: .video).toString())

        UNUserNotificationCenter.current().getNotificationSettings { (settings: UNNotificationSettings) in
            model.notificationsPermission.value = settings.authorizationStatus.toString()
        }

        return TableCellUnit<InfoTableCell>.create(model)
    }

    func appInfoString() -> String {
        let appName: String = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "UNDEFINED"
        let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "UNDEFINED"

        return "\(appName), v. \(appVersion)"
    }

}

// MARK: - PHAuthorizationStatus

fileprivate extension PHAuthorizationStatus {
    func toString() -> String {
        switch self {
        case .notDetermined:
            return "not determined"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        case .authorized:
            return "authorized"
        case .limited:
            return "limited"
        @unknown default:
            return "unknown"
        }
    }
}

// MARK: - AVAuthorizationStatus

fileprivate extension AVAuthorizationStatus {
    func toString() -> String {
        switch self {
        case .notDetermined:
            return "not determined"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        case .authorized:
            return "authorized"
        @unknown default:
            return "unknown"
        }
    }
}

// MARK: - CLAuthorizationStatus

fileprivate extension CLAuthorizationStatus {
    func toString() -> String {
        switch self {
        case .notDetermined:
            return "not determined"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        case .authorizedAlways:
            return "authorized always"
        case .authorizedWhenInUse:
            return "authorized when in use"
        @unknown default:
            return "unknown"
        }
    }
}

// MARK: - UNAuthorizationStatus

fileprivate extension UNAuthorizationStatus {
    func toString() -> String {
        switch self {
        case .notDetermined:
            return "not determined"
        case .denied:
            return "denied"
        case .authorized:
            return "authorized"
        case .provisional:
            return "provisional"
        case .ephemeral:
            return "ephermal"
        @unknown default:
            return "unknown"
        }
    }
}
