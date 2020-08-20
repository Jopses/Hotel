@testable import Hotel

class HotelsViewControllerMock: HotelsViewInput {
    func showLoadingAnimation(isLoading: Bool) {}
    func setFilter() {}
    func createViewBlocks(hotelsData: [HotelResponse], viewModel: HotelBlockModel?) {}
}
