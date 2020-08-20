import XCTest
import Moya
@testable import Hotel

class DetailsPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: DetailsPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = DetailsRouterMock()
        let view = DetailsViewControllerMock()
        let output = DetailsScreenOutputMock()
        let errorHandler = ErrorHandler()
        let apiProvider = MoyaProvider<HotelApi>()
        let interactor = DetailsInteractor(errorHandler: errorHandler, apiProvider: apiProvider, hotelId: 0)
        presenter = DetailsPresenter(router: router, interactor: interactor)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
