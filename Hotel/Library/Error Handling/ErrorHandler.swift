import Foundation

class ErrorHandler {
    weak var messagesView: UserMessagesView?

    func handle(error: Error) {
        Logger.debugLog("Error: \(error)")
        let message = error.localizedDescription
        messagesView?.showToast(withMessage: message)
    }

    func handleMessage(message: String) {
        messagesView?.showToast(withMessage: message)
    }
}
