//
//  UIViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

extension UIViewController {

    // Метод для создания UIViewController из XIB
    static func instantiate<ViewController: UIViewController>(ofType: ViewController.Type) -> ViewController {
        return .init(nibName: ofType.className, bundle: Bundle.getBundle(for: ofType))
    }

}
