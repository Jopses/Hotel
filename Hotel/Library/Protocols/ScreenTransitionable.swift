import UIKit

protocol ScreenTransitionable: AnyObject {
    func showScreen(_ screen: UIViewController)
    func dismissView(animated: Bool, completion: (() -> Void)?)
    func presentScreen(_ screen: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func push(screen: UIViewController, animated: Bool)
}

extension ScreenTransitionable where Self: UIViewController {
    func showScreen(_ screen: UIViewController) {
        show(screen, sender: nil)
    }

    func dismissView(animated: Bool, completion: (() -> Void)?) {
        presentingViewController?.dismiss(animated: animated, completion: completion)
    }

    func presentScreen(_ screen: UIViewController, animated: Bool, completion: (() -> Void)?) {
        present(screen, animated: animated, completion: completion)
    }

    func pop(animated: Bool) {
        let navController = self as? UINavigationController ?? navigationController
        navController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        let navController = self as? UINavigationController ?? navigationController
        navController?.popToRootViewController(animated: animated)
    }

    func push(screen: UIViewController, animated: Bool) {
        let navController = self as? UINavigationController ?? navigationController
        navController?.pushViewController(screen, animated: animated)
    }
}
