import UIKit

protocol HotelsRouterInput {
    func pushDetailHotel(hotelId: Int)
}

class HotelsRouter: HotelsRouterInput {
    // MARK: - Properties

    weak var view: ScreenTransitionable?

    // MARK: - HotelsRouterInput

    func pushDetailHotel(hotelId: Int) {
        let screen = DetailsScreenAssembly().assemble(hotelId: hotelId)
        view?.presentScreen(screen, animated: true, completion: nil)
    }
}
