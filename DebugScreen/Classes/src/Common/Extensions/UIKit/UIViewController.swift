//
//  UIViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import UIKit

extension UIViewController {

    static func instantiate<ViewController: UIViewController>(ofType: ViewController.Type) -> ViewController {
        return .init(nibName: ofType.className, bundle: Bundle(for: ofType))
    }

}
