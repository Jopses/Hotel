import XCTest
@testable import Hotel

class HotelsScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: HotelsViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        viewController = HotelsScreenAssembly().assemble()
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is HotelsPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not HotelsPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? HotelsPresenter else {
            XCTFail("Cannot assign viewController.output as HotelsPresenter")
            return
        }

        let isViewController = presenter.view is HotelsViewController
        XCTAssertTrue(isViewController, "presenter.view is not HotelsViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? HotelsPresenter else {
            XCTFail("Cannot assign viewController.output as HotelsPresenter")
            return
        }

        let isRouter = presenter.router is HotelsRouter
        XCTAssertTrue(isRouter, "presenter.router is not HotelsRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? HotelsPresenter else {
            XCTFail("Cannot assign viewController.output as HotelsPresenter")
            return
        }
        guard let router = presenter.router as? HotelsRouter else {
            XCTFail("Cannot assign presenter.router as HotelsRouter")
            return
        }

        let isViewController = router.view is HotelsViewController
        XCTAssertTrue(isViewController, "router.view is not HotelsViewController")
    }
}
