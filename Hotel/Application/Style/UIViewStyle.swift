import UIKit

extension StyleWrapper where Element == UIView {
    static var base: StyleWrapper {
        return .wrap { view, theme in
            view.backgroundColor = theme.colorPalette.secondary
        }
    }

    static var hotelBlock: StyleWrapper {
        return .wrap { view, theme in
            view.layer.cornerRadius = Grid.xs.offset
            view.backgroundColor = theme.colorPalette.background
        }
    }
}
