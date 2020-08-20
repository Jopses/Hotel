import Moya

protocol DetailsInteractorOutput: AnyObject {
    func showLoadingAnimation(isLoading: Bool)
    func sendResult(_ details: HotelResponse)
}

protocol DetailsInteractorInput {
    func getDetails()
}

class DetailsInteractor {
    weak var output: DetailsInteractorOutput?
    private let errorHandler: ErrorHandler
    private let apiProvider: MoyaProvider<HotelApi>
    private let hotelId: Int

    init(errorHandler: ErrorHandler, apiProvider: MoyaProvider<HotelApi>, hotelId: Int) {
        self.errorHandler = errorHandler
        self.apiProvider = apiProvider
        self.hotelId = hotelId
    }

    // MARK: - Private Methods

    private func requestDetails() {
        let requestTarget = HotelApi.getHotelById(hotelId)
        apiProvider.request(requestTarget) { [weak self] result in
            guard let self = self else { return }
            self.output?.showLoadingAnimation(isLoading: false)
            guard case let .success(response) = result else { return }
            do {
                let details = try response.map(HotelResponse.self)
                self.output?.sendResult(details)
            } catch {
                self.errorHandler.handle(error: error)
            }
        }
        output?.showLoadingAnimation(isLoading: true)
    }
}

extension DetailsInteractor: DetailsInteractorInput {
    func getDetails() {
        requestDetails()
    }
}
