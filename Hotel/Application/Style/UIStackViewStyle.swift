import UIKit

extension StyleWrapper where Element == UIStackView {
    /// Primary stack view
    static var primary: StyleWrapper {
        return .wrap { stackView, _ in
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = Grid.sm.offset
            stackView.axis = .vertical
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = UIEdgeInsets(
                top: Grid.xs.offset,
                left: Grid.zero.offset,
                bottom: Grid.sm.offset,
                right: Grid.zero.offset
            )
        }
    }
}
