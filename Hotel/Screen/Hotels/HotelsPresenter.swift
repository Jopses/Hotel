import Moya
protocol HotelsScreenOutput: AnyObject {}

protocol HotelsScreenInput: AnyObject {}

class HotelsPresenter {
    // MARK: - Properties

    weak var view: HotelsViewInput?
    let router: HotelsRouterInput
    private let interactor: HotelsInteractorInput
    weak var output: HotelsScreenOutput?
    private var hotelModel: HotelBlockModel?
    private var hotelsResponse: [HotelResponse] = []

    // MARK: - Lifecycle

    init(router: HotelsRouterInput, interactor: HotelsInteractorInput) {
        self.router = router
        self.interactor = interactor
        updateModel()
    }

    // MARK: - Private Methods

    private func updateModel() {
        hotelModel = HotelBlockModel(selected: { [weak self] index in
            guard let self = self else { return }
            self.router.pushDetailHotel(hotelId: index)
        })
    }

    private func sortHotels(segment: Int) {
        switch segment {
        case 0:
            hotelsResponse.sort { $0.distance < $1.distance }
        case 1:
            hotelsResponse.sort {
                DataConvert.stringToArrayToInt(string: $0.suitesAvailability) <
                    DataConvert.stringToArrayToInt(string: $1.suitesAvailability)
            }
        default:
            break
        }
    }
}

// MARK: - HotelsViewOutput

extension HotelsPresenter: HotelsViewOutput {
    func viewDidLoad() {
        interactor.getHotels()
    }

    func changeFilter(_ index: Int) {
        sortHotels(segment: index)
        view?.createViewBlocks(hotelsData: hotelsResponse, viewModel: hotelModel)
    }
}

// MARK: - HotelsInteractorOutput

extension HotelsPresenter: HotelsInteractorOutput {
    func showLoadingAnimation(isLoading: Bool) {
        view?.showLoadingAnimation(isLoading: isLoading)
    }

    func sendResult(_ hotels: [HotelResponse]) {
        hotelsResponse = hotels
        sortHotels(segment: 0)
        view?.setFilter()
        view?.createViewBlocks(hotelsData: hotelsResponse, viewModel: hotelModel)
    }
}

// MARK: - HotelsScreenInput

extension HotelsPresenter: HotelsScreenInput {}
