//
//  UIWindow.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import UIKit

extension UIWindow {

    /// Overrided vibration method
    /// - Parameters:
    ///   - motion: motion shake ended
    ///   - event: motionShake
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            DebugScreenPresenterService.shared.handleMotionEnded()
        }
    }

}
