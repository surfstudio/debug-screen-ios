//
//  BaseNavigationController.swift
//  DebugScreen
//
//  Created by chausov on 10.07.2023.
//

import UIKit

final class BaseNavigationController: UINavigationController {

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        self.delegate = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        let style = topViewController?.preferredStatusBarStyle ?? .default
        return style
    }

}

// MARK: - Private Methods

private extension BaseNavigationController {

    func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        let backImage = Resources.Assets.Icons.back.image
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

        navigationBar.standardAppearance = appearance
        navigationBar.tintColor = Colors.Buttons.Primary.normalBackground
    }

}

// MARK: - UINavigationControllerDelegate

extension BaseNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController, animated: Bool) {
        // settings for screen name in back button long-tap list
        let title = navigationController.topViewController?.navigationItem.title
            ?? navigationController.topViewController?.navigationItem.backButtonTitle
        navigationController.topViewController?.navigationItem.backButtonTitle = title

        // removing "back" word from back button
        if #available(iOS 14.0, *) {
            navigationController.topViewController?.navigationItem.backButtonDisplayMode = .minimal
        } else {
            let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController.topViewController?.navigationItem.backBarButtonItem = item
        }
    }

}
