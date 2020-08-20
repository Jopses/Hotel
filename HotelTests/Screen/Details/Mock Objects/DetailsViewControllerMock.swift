@testable import Hotel

class DetailsViewControllerMock: DetailsViewInput {
    func showLoadingAnimation(isLoading: Bool) {}
    func createDetails(_ details: HotelResponse) {}
}
