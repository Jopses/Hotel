import UIKit
protocol DetailsViewInput: AnyObject {
    func showLoadingAnimation(isLoading: Bool)
    func createDetails(_ details: HotelResponse)
}

protocol DetailsViewOutput {
    func viewDidLoad()
    func closedScreen()
}

class DetailsViewController: ScrollViewController, ScreenTransitionable, UserMessagesView {
    // MARK: - Properties

    let output: DetailsViewOutput
    private let closedButton = UIButton()
    private let hotelImage = HotelImageView(image: nil)
    private let hideBorderHotelImage = UIView()

    // MARK: - Lifecycle

    init(output: DetailsViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        output.viewDidLoad()
    }

    // MARK: - Prepare View

    private func prepareView() {
        view.apply(.base)
        setClosedButton()
    }

    private func setClosedButton() {
        closedButton.apply(.closed)
        closedButton.setTitle(R.string.localizable.done(), for: .normal)
        closedButton.addTarget(self, action: #selector(closedAction), for: .touchUpInside)
        closedButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(closedButton)
        NSLayoutConstraint.activate([
            closedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Grid.s.offset),
            closedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Grid.s.offset),
            closedButton.heightAnchor.constraint(equalToConstant: Grid.ml.offset),
            closedButton.widthAnchor.constraint(equalToConstant: Grid.xl.offset)
        ])
    }

    private func setHotelImage(_ imageString: String?) {
        hotelImage.apply(.holelImage)
        hotelImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hotelImage)
        NSLayoutConstraint.activate([
            hotelImage.topAnchor.constraint(equalTo: closedButton.bottomAnchor, constant: Grid.s.offset),
            hotelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Grid.s.offset),
            hotelImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Grid.s.offset)
        ])
        if let image = imageString, image != "" {
            hotelImage.activityIndicator.startAnimating()
            hotelImage.loadFromUrl(URL(string: "\(AppDefaults.imageUrl)/\(image)"), placeholder: nil)
            NSLayoutConstraint.activate([
                hotelImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - Grid.m.offset),
                hotelImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - Grid.m.offset)
            ])
        }
    }

    private func setDetailBlock(_ details: HotelResponse) {
        let hotel = HotelBlock(data: details)
        hotel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hotel)
        NSLayoutConstraint.activate([
            hotel.topAnchor.constraint(equalTo: hotelImage.bottomAnchor, constant: Grid.s.offset),
            hotel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Grid.s.offset),
            hotel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Grid.s.offset),
            hotel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Grid.s.offset)
        ])
    }

    // MARK: - Actions

    @objc
    private func closedAction() {
        output.closedScreen()
    }
}

// MARK: - DetailsViewInput

extension DetailsViewController: DetailsViewInput {
    func createDetails(_ details: HotelResponse) {
        setHotelImage(details.image)
        setDetailBlock(details)
    }

    func showLoadingAnimation(isLoading: Bool) {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
