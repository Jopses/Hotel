import UIKit

protocol DetailsRouterInput {
    func closedScreen()
}

class DetailsRouter: DetailsRouterInput {
    // MARK: - Properties

    weak var view: ScreenTransitionable?

    // MARK: - DetailsRouterInput

    func closedScreen() {
        view?.dismissView(animated: true, completion: nil)
    }
}
