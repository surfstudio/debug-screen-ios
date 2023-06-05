//
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

enum DeepLinkOption {
    case alert(model: DeepLinkOptionModel)
    case customScreen(model: DeepLinkOptionModel)
    case fileViewer(model: DeepLinkOptionModel)
}

struct DeepLinkOptionModel {

    // MARK: - Properties

    let value: Any
    let isRootModule: Bool

    // MARK: - Initialization

    init(value: Any, isRootModule: Bool) {
        self.value = value
        self.isRootModule = isRootModule
    }

}
