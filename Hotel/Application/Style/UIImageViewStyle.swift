import UIKit

extension StyleWrapper where Element == HotelImageView {
    static var holelImage: StyleWrapper {
        return .wrap { imageView, _ in
            imageView.contentMode = .scaleAspectFit
        }
    }
}
