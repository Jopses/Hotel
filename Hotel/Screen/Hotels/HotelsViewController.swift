import UIKit
protocol HotelsViewInput: AnyObject {
    func showLoadingAnimation(isLoading: Bool)
    func setFilter()
    func createViewBlocks(hotelsData: [HotelResponse], viewModel: HotelBlockModel?)
}

protocol HotelsViewOutput {
    func viewDidLoad()
    func changeFilter(_ index: Int)
}

class HotelsViewController: ScrollStackViewController, ScreenTransitionable, UserMessagesView {
    // MARK: - Properties

    let output: HotelsViewOutput
    private let segment = UISegmentedControl()

    override var scrollViewTopOffset: CGFloat {
        return Grid.xxl.offset
    }

    // MARK: - Lifecycle

    init(output: HotelsViewOutput) {
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
    }

    private func setSegment() {
        segment.apply(.filter)
        segment.insertSegment(withTitle: R.string.localizable.distance(), at: 0, animated: false)
        segment.insertSegment(withTitle: R.string.localizable.suites_availability(), at: 1, animated: false)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(sendAction(_:)), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segment)
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Grid.s.offset),
            segment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Grid.s.offset),
            segment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Grid.s.offset),
            segment.heightAnchor.constraint(equalToConstant: Grid.m.offset)
        ])
    }

    // MARK: - Actions

    @objc
    private func sendAction(_ sender: UISegmentedControl) {
        output.changeFilter(sender.selectedSegmentIndex)
    }
}

// MARK: - HotelsViewInput

extension HotelsViewController: HotelsViewInput {
    func createViewBlocks(hotelsData: [HotelResponse], viewModel: HotelBlockModel?) {
        stackView.removeAllArrangedSubviews()
        hotelsData.forEach {
            let hotel = HotelBlock(data: $0)
            hotel.viewModel = viewModel
            stackView.addArrangedSubview(hotel)
        }
    }

    func setFilter() {
        setSegment()
    }

    func showLoadingAnimation(isLoading: Bool) {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
