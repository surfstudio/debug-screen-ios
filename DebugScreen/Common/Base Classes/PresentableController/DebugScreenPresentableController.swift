//
//  DebugScreenPresentableController.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 05.06.2023.
//

import UIKit

/// Base class for custom screen, that can be presented from DebugScreen
/// Your class need to be inherited from `DebugScreenPresentableController` to been presented
open class DebugScreenPresentableController: UIViewController {

    // MARK: - Properties

    var output: DebugScreenPresentableViewOutput?

}

// MARK: - DebugScreenPresentableViewInput

extension DebugScreenPresentableController: DebugScreenPresentableViewInput {}
