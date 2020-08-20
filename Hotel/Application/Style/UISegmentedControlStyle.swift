import UIKit

extension StyleWrapper where Element == UISegmentedControl {
    static var filter: StyleWrapper {
        return .wrap { segment, theme in
            segment.backgroundColor = theme.colorPalette.background
            segment.tintColor = theme.colorPalette.onBackground
        }
    }
}
