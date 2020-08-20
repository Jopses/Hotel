import Toast_Swift
import UIKit

protocol UserMessagesView: AnyObject {
    func showAlert(withTitle title: String?, message: String?)
    func showErrorAlert(withMessage message: String?)
    func showToast(withMessage message: String?)
    func showToast(withTitle title: String?, message: String?)
}

extension UserMessagesView where Self: UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    func showErrorAlert(withMessage message: String?) {
        showAlert(withTitle: R.string.localizable.error(), message: message)
    }

    func showToast(withMessage message: String?) {
        var toastStyle = ToastStyle()
        toastStyle.messageAlignment = .center
        view.makeToast(message, position: .center, style: toastStyle)
    }

    func showToast(withTitle title: String?, message: String?) {
        var toastStyle = ToastStyle()
        toastStyle.messageAlignment = .center
        view.makeToast(message, position: .center, title: title)
    }
}
