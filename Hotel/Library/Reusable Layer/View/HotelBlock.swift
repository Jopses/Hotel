import UIKit

class HotelBlock: UIView {
    // Properties
    private let titleLabel = UILabel()
    private let addressLabel = UILabel()
    private let starsLabel = UILabel()
    private let distanceLabel = UILabel()
    private let suitesLabel = UILabel()

    private let hotelData: HotelResponse
    var viewModel: HotelBlockModel?

    // MARK: - Lifecycle

    init(data: HotelResponse) {
        hotelData = data
        super.init(frame: .zero)
        prepareView()
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Prepare view

    private func prepareView() {
        setView()
        setTitleLabel()
        setAddressLabel()
        setStarsLabel()
        setDistanceLabel()
        setSuitesLabel()
    }

    private func setView() {
        (self as UIView).apply(.hotelBlock)
        tag = hotelData.id
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapdAction(_:)))
        tapGesture.numberOfTapsRequired = 1
        addGestureRecognizer(tapGesture)
    }

    private func setTitleLabel() {
        titleLabel.apply(.hotelTitle)
        titleLabel.text = hotelData.name
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Grid.s.offset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Grid.s.offset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Grid.s.offset)
        ])
    }

    private func setAddressLabel() {
        addressLabel.apply(.hotelSubTitle)
        addressLabel.text = hotelData.address
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    private func setStarsLabel() {
        starsLabel.apply(.hotelDescr)
        starsLabel.text = "\(R.string.localizable.stars()): \(Int(hotelData.stars))"
        addSubview(starsLabel)
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starsLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
            starsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    private func setDistanceLabel() {
        distanceLabel.apply(.hotelDescr)
        distanceLabel.text = "\(R.string.localizable.distance()): \(Int(hotelData.distance))"
        addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distanceLabel.topAnchor.constraint(equalTo: starsLabel.bottomAnchor),
            distanceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            distanceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    private func setSuitesLabel() {
        suitesLabel.apply(.hotelDescr)
        let suites = DataConvert.stringToArrayToInt(string: hotelData.suitesAvailability)
        suitesLabel.text = "\(R.string.localizable.suites_availability()): \(suites)"
        addSubview(suitesLabel)
        suitesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            suitesLabel.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor),
            suitesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            suitesLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            suitesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Grid.s.offset)
        ])
    }

    // MARK: - Actions

    @objc
    private func tapdAction(_ gesture: UITapGestureRecognizer) {
        guard let index = gesture.view?.tag else { return }
        viewModel?.selected(index)
    }
}
