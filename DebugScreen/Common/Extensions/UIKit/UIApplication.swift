//
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

extension UIApplication {

    // MARK: - Static Properties

    static var rootView: UIViewController? {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?
            .rootViewController
    }

    static var firstKeyWindow: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
    }

    // MARK: - Static Methods

    static func topViewController(
        _ controller: UIViewController? = rootView
    ) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }
        return controller
    }

    static func appVersion() -> String? {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return appVersion
    }

}
