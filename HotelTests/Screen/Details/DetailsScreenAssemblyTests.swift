import XCTest
@testable import Hotel

class DetailsScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: DetailsViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        viewController = DetailsScreenAssembly().assemble(hotelId: 0)
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is DetailsPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not DetailsPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? DetailsPresenter else {
            XCTFail("Cannot assign viewController.output as DetailsPresenter")
            return
        }

        let isViewController = presenter.view is DetailsViewController
        XCTAssertTrue(isViewController, "presenter.view is not DetailsViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? DetailsPresenter else {
            XCTFail("Cannot assign viewController.output as DetailsPresenter")
            return
        }

        let isRouter = presenter.router is DetailsRouter
        XCTAssertTrue(isRouter, "presenter.router is not DetailsRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? DetailsPresenter else {
            XCTFail("Cannot assign viewController.output as DetailsPresenter")
            return
        }
        guard let router = presenter.router as? DetailsRouter else {
            XCTFail("Cannot assign presenter.router as DetailsRouter")
            return
        }

        let isViewController = router.view is DetailsViewController
        XCTAssertTrue(isViewController, "router.view is not DetailsViewController")
    }
}
