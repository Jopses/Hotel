import XCTest
import Moya
@testable import Hotel

class HotelsPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: HotelsPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = HotelsRouterMock()
        let view = HotelsViewControllerMock()
        let output = HotelsScreenOutputMock()
        let errorHandler = ErrorHandler()
        let apiProvider = MoyaProvider<HotelApi>()
        let interactor = HotelsInteractor(errorHandler: errorHandler, apiProvider: apiProvider)
        presenter = HotelsPresenter(router: router, interactor: interactor)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
