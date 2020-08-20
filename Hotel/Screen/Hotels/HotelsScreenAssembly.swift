import Moya
import UIKit

class HotelsScreenAssembly {
    func assemble(output: HotelsScreenOutput? = nil) -> HotelsViewController {
        let router = HotelsRouter()
        let errorHandler = ErrorHandler()
        let apiProvider = MoyaProvider<HotelApi>(plugins: [NetworkLoggerPlugin()])
        let interactor = HotelsInteractor(errorHandler: errorHandler, apiProvider: apiProvider)
        let presenter = HotelsPresenter(router: router, interactor: interactor)
        let view = HotelsViewController(output: presenter)
        interactor.output = presenter
        presenter.view = view
        presenter.output = output
        router.view = view
        errorHandler.messagesView = view

        return view
    }
}
