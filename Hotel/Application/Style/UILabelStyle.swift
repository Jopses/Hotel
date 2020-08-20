import UIKit

extension StyleWrapper where Element == UILabel {
    static var base: StyleWrapper {
        return .wrap { label, theme in
            label.numberOfLines = 0
            label.textColor = theme.colorPalette.onBackground
            label.textAlignment = .left
        }
    }

    static var hotelTitle: StyleWrapper {
        return .wrap { label, theme in
            label.apply(.base)
            label.font = theme.typography.header5
        }
    }

    static var hotelSubTitle: StyleWrapper {
        return .wrap { label, theme in
            label.apply(.base)
            label.font = theme.typography.subtitle1
        }
    }

    static var hotelDescr: StyleWrapper {
        return .wrap { label, theme in
            label.apply(.base)
            label.font = theme.typography.subtitle2
        }
    }
}
