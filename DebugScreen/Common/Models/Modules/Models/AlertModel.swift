//
//  AlertModel.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 12.06.2023.
//

/// Alert module model
struct AlertModel {

    // MARK: - Properties

    let title: String?
    let message: String

    // MARK: - Initialization

    init(title: String? = nil, message: String) {
        self.title = title
        self.message = message
    }

}
