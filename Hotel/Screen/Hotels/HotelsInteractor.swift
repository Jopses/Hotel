import Moya

protocol HotelsInteractorOutput: AnyObject {
    func showLoadingAnimation(isLoading: Bool)
    func sendResult(_ hotels: [HotelResponse])
}

protocol HotelsInteractorInput {
    func getHotels()
}

class HotelsInteractor {
    weak var output: HotelsInteractorOutput?
    private let errorHandler: ErrorHandler
    private let apiProvider: MoyaProvider<HotelApi>

    init(errorHandler: ErrorHandler, apiProvider: MoyaProvider<HotelApi>) {
        self.errorHandler = errorHandler
        self.apiProvider = apiProvider
    }

    // MARK: - Private Methods

    private func requestHotels() {
        let requestTarget = HotelApi.getHotels(path: "0777")
        apiProvider.request(requestTarget) { [weak self] result in
            guard let self = self else { return }
            self.output?.showLoadingAnimation(isLoading: false)
            guard case let .success(response) = result else { return }
            do {
                let hotelsResponse = try response.map([HotelResponse].self)
                self.output?.sendResult(hotelsResponse)
            } catch {
                self.errorHandler.handle(error: error)
            }
        }
        output?.showLoadingAnimation(isLoading: true)
    }
}

extension HotelsInteractor: HotelsInteractorInput {
    func getHotels() {
        requestHotels()
    }
}
