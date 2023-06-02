//
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

enum DeepLinkOption {
    case alert(model: DeepLinkOptionModel)
    case fileViewer(model: DeepLinkOptionModel)
}

struct DeepLinkOptionModel {

    // MARK: - Properties

    let value: String
    let isRootModule: Bool

    // MARK: - Initialization

    init(value: String, isRootModule: Bool) {
        self.value = value
        self.isRootModule = isRootModule
    }

}
