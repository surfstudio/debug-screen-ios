//
//  FileViewerViewController.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 19.05.2023.
//

import UIKit
import QuickLook

final class FileViewerViewController: QLPreviewController {

    // MARK: - Properties

    var output: FileViewerViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - FileViewerViewInput

extension FileViewerViewController: FileViewerViewInput {

    func setupInitialState() {
        configureAppearance()
    }

}

// MARK: - Appearance

private extension FileViewerViewController {

    func configureAppearance() {
        configureNavigationBar()
        dataSource = output
    }

    func configureNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = nil
    }

}
