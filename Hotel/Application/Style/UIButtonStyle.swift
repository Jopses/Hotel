import UIKit

extension StyleWrapper where Element == UIButton {
    static var closed: StyleWrapper {
        return .wrap { button, theme in
            button.clipsToBounds = true
            button.layer.cornerRadius = Grid.xs.offset
            button.backgroundColor = theme.colorPalette.background
            button.setTitleColor(theme.colorPalette.onBackground, for: .normal)
            button.titleLabel?.font = theme.typography.button
        }
    }
}
