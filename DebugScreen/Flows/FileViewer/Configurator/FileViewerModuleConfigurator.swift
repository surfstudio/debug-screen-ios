//
//  FileViewerModuleConfigurator.swift
//  
//
//  Created by Ilya Klimenyuk on 18.05.2023.
//

import UIKit

public typealias FileViewerModuleComponents = (
    view: UIViewController,
    output: FileViewerModuleOutput
)

public final class FileViewerModuleConfigurator {

    // MARK: - Initialization

    public init() {}

    // MARK: - Public Methods

    public func configure(with filePath: String) -> FileViewerModuleComponents {
        let view = UIViewController.instantiate(ofType: FileViewerViewController.self)
        let presenter = FileViewerPresenter(filePath: filePath)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
