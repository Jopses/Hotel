import UIKit

class HotelImageView: UIImageView {
    // MARK: - Properties

    private var addBorder: Bool = false
    override var image: UIImage? {
        didSet {
            if image != nil, !addBorder {
                addBorder = true
                image = image?.imageByAddingBorder(width: 1, color: DefaultColorPalette.secondary)
                activityIndicator.stopAnimating()
            }
        }
    }

    let activityIndicator = UIActivityIndicatorView(style: .gray)

    // MARK: - Lifecycle

    override init(image: UIImage?) {
        super.init(image: image)
        setActivityIndicator()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Prepare View

    private func setActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
