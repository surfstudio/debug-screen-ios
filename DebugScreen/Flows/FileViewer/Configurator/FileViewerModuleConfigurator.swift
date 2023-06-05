//
//  FileViewerModuleConfigurator.swift
//  
//
//  Created by Ilya Klimenyuk on 18.05.2023.
//

import UIKit

typealias FileViewerModuleComponents = (
    view: UIViewController,
    output: FileViewerModuleOutput
)

final class FileViewerModuleConfigurator {

    // MARK: - Initialization

    init() {}

    // MARK: - Methods

    func configure(with filePath: String) -> FileViewerModuleComponents {
        let view = UIViewController.instantiate(ofType: FileViewerViewController.self)
        let presenter = FileViewerPresenter(filePath: filePath)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
