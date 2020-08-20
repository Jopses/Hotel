import Moya
import UIKit

class DetailsScreenAssembly {
    func assemble(output: DetailsScreenOutput? = nil, hotelId: Int) -> DetailsViewController {
        let router = DetailsRouter()
        let errorHandler = ErrorHandler()
        let apiProvider = MoyaProvider<HotelApi>(plugins: [NetworkLoggerPlugin()])
        let interactor = DetailsInteractor(errorHandler: errorHandler, apiProvider: apiProvider, hotelId: hotelId)
        let presenter = DetailsPresenter(router: router, interactor: interactor)
        let view = DetailsViewController(output: presenter)
        interactor.output = presenter
        presenter.view = view
        presenter.output = output
        router.view = view
        errorHandler.messagesView = view

        return view
    }
}
