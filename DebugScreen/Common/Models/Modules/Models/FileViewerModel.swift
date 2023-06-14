//
//  FileViewerModel.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 12.06.2023.
//

/// Model for file viewer screen
struct FileViewerModel {

    // MARK: - Properties

    let filePath: String

    // MARK: - Initialization

    init(filePath: String) {
        self.filePath = filePath
    }

}
