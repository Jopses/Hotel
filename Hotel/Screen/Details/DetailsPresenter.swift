import Moya

protocol DetailsScreenOutput: AnyObject {}

protocol DetailsScreenInput: AnyObject {}

class DetailsPresenter {
    // MARK: - Properties

    weak var view: DetailsViewInput?
    let router: DetailsRouterInput
    private let interactor: DetailsInteractorInput
    weak var output: DetailsScreenOutput?

    // MARK: - Lifecycle

    init(router: DetailsRouterInput, interactor: DetailsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - DetailsViewOutput

extension DetailsPresenter: DetailsViewOutput {
    func viewDidLoad() {
        interactor.getDetails()
    }

    func closedScreen() {
        router.closedScreen()
    }
}

// MARK: - DetailsInteractorOutput

extension DetailsPresenter: DetailsInteractorOutput {
    func showLoadingAnimation(isLoading: Bool) {
        view?.showLoadingAnimation(isLoading: isLoading)
    }

    func sendResult(_ details: HotelResponse) {
        view?.createDetails(details)
    }
}

// MARK: - DetailsScreenInput

extension DetailsPresenter: DetailsScreenInput {}
