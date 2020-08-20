import UIKit

extension StyleWrapper where Element == UIScrollView {
    /// Primary Scroll View
    static var primary: StyleWrapper {
        return .wrap { scrollView, _ in
            scrollView.showsVerticalScrollIndicator = false
            scrollView.alwaysBounceVertical = true
        }
    }
}
