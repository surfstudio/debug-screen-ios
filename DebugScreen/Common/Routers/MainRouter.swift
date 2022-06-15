//
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

/// Provides methods and properties for all navigation operations.
/// Instantiate, and use the object of this class in coordinators.
final class MainRouter: Router {

    private var window: UIWindow? {
        return UIApplication.firstKeyWindow
    }

    private var navigationController: UINavigationController? {
        let keyWindow = UIApplication.firstKeyWindow

        if let tabBar = keyWindow?.rootViewController as? UITabBarController {
            return tabBar.selectedViewController as? UINavigationController
        }

        return keyWindow?.rootViewController as? UINavigationController
    }

    private var tabBarController: UITabBarController? {
        let keyWindow = UIApplication.firstKeyWindow
        return keyWindow?.rootViewController as? UITabBarController
    }

    private var topViewController: UIViewController? {
        return UIApplication.topViewController()
    }

    func present(_ module: Presentable?) {
        self.present(module, animated: true, completion: nil)
    }

    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        if let controller = module?.toPresent() {
            self.topViewController?.present(controller, animated: animated, completion: completion)
        }
    }

    func push(_ module: Presentable?) {
        self.push(module, animated: true)
    }

    func push(_ module: Presentable?, animated: Bool) {
        if let controller = module?.toPresent() {
            self.topViewController?.navigationController?.pushViewController(controller, animated: animated)
        }
    }

    func popModule() {
        self.popModule(animated: true)
    }

    func popModule(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }

    func popPreviousView() {
        let navigationController = self.topViewController?.navigationController
        guard
            var controllers = navigationController?.viewControllers,
            controllers.count >= 3 else {
                return
        }
        controllers.remove(at: controllers.count - 2)
        navigationController?.viewControllers = controllers
    }

    func dismissModule() {
        self.dismissModule(animated: true, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        topViewController?.dismiss(animated: animated, completion: completion)
    }

    func setNavigationControllerRootModule(_ module: Presentable?, animated: Bool = false, hideBar: Bool = false) {
        if let controller = module?.toPresent() {
            navigationController?.isNavigationBarHidden = hideBar
            navigationController?.setViewControllers([controller], animated: false)
        }
    }

    func setRootModule(_ module: Presentable?) {
        window?.rootViewController = module?.toPresent()
    }

    func setTab(_ index: Int) {
        tabBarController?.selectedIndex = index
    }
}
