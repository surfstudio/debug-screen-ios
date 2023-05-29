//
//  UIWindow.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import UIKit

extension UIWindow {

    /// Overrides UIWindow's motion method
    ///
    /// This overriding allows to show debug screen by shake motion
    /// - Parameters:
    ///   - motion: ended motion
    ///   - event: ended event
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard
            motion == .motionShake,
            DebugScreenConfiguration.shared.isEnabledOnShake
        else {
            return
        }

        DebugScreenPresenterService.shared.showDebugScreen()
    }

}
