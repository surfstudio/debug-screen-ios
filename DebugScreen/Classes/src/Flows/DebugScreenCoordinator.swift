//
//  DebugScreenCoordinator.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation
import UIKit

final class DebugScreenCoordinator: BaseCoordinator {

    // MARK: - Private properties

    private let router = MainRouter()
    private let navigationController = UINavigationController()

    private weak var bugReportInput: BugReportModuleInput?
    private let pickerDelegate = ImagePickerDelegate()

    // MARK: - Public properties

    var completionHandler: (() -> Void)?

    // MARK: - Public methods

    override func start() {
        var components: MainModuleComponents = MainModuleConfigurator().configure()
        navigationController.setViewControllers([components.view], animated: false)
        navigationController.modalPresentationStyle = .overFullScreen

        components.output.closeModuleBlock = { [weak self] in
            self?.navigationController.dismiss(animated: true, completion: self?.completionHandler)
        }

        components.output.showCacheClearingOptionsBlock = { [weak self] (actions: [CacheCleanerAction]) in
            self?.showCacheCleaningActions(actions: actions)
        }

        components.output.showBugReportBlock = { [weak self] in
            self?.showBugReport()
        }

        components.output.showSelectServerBlock = { [weak self] in
            self?.showSelectServer()
        }

        router.present(navigationController)
    }
}

// MARK: - Private methods

private extension DebugScreenCoordinator {

    func showCacheCleaningActions(actions: [CacheCleanerAction]) {
        let actionsSheet = UIAlertController(title: nil, message: "Clear cache", preferredStyle: .actionSheet)

        for action in actions {
            actionsSheet.addAction(UIAlertAction(title: action.title, style: .destructive, handler: { (_: UIAlertAction) in
                action.block()
            }))
        }

        actionsSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.navigationController.present(actionsSheet, animated: true, completion: nil)
    }

    func showBugReport() {
        var components: BugReportModuleComponents = BugReportModuleConfigurator().configure()

        bugReportInput = components.input

        components.output.pickImageBlock = { [weak self] in
            self?.showImagePicker()
        }

        components.output.shareReportBlock = { [weak self] (text: String, logPath: String?, image: UIImage?) in
            self?.presentActivityController(items: [text], completionHandler: {
                var items: [Any] = [image as Any]

                if let logPath = logPath {
                    items.append(URL(fileURLWithPath: logPath))
                }

                if !items.isEmpty {
                    self?.presentActivityController(items: items.compactMap({ $0 }), completionHandler: nil)
                }
            })
        }

        self.navigationController.pushViewController(components.view, animated: true)
    }

    func showImagePicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.mediaTypes = ["public.image"]
        picker.delegate = pickerDelegate

        pickerDelegate.didPickImageBlock = { [weak self, weak picker] (image: UIImage) in
            self?.bugReportInput?.didPickImage(image)

            picker?.dismiss(animated: true, completion: nil)
        }

        navigationController.present(picker, animated: true, completion: nil)
    }

    func presentActivityController(items: [Any], completionHandler: (() -> Void)?) {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        controller.completionWithItemsHandler = { (_: UIActivity.ActivityType?, _: Bool, _: [Any]?, error: Error?) in
            completionHandler?()
        }

        self.navigationController.present(controller, animated: true, completion: nil)
    }

    func showSelectServer() {
        guard let provider: SelectServerActionsProvider = DebugScreenConfiguration.shared.selectServerActionsProvider else {
            assertionFailure("Impossible!")
            return
        }

        let components: SelectServerModuleComponents = SelectServerModuleConfigurator().configure(provider: provider)

        self.navigationController.pushViewController(components.view, animated: true)
    }
}


class ImagePickerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var didPickImageBlock: ((UIImage) -> Void)?

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }

        didPickImageBlock?(image)
    }
}
