import UIKit

class ScrollStackViewController: UIViewController {
    // MARK: - Properties

    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()
    let activityIndicator = UIActivityIndicatorView(style: .gray)

    var scrollViewTopOffset: CGFloat {
        return 0.0
    }

    var scrollViewBottomOffset: CGFloat {
        return 0.0
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContentView()
        setStackView()
        setActivityIndicator()
    }

    // MARK: - Prepare View

    private func setScrollView() {
        scrollView.apply(.primary)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        let safe = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: safe.topAnchor, constant: scrollViewTopOffset),
            scrollView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -scrollViewBottomOffset)
        ])
    }

    private func setContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setStackView() {
        stackView.apply(.primary)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Grid.s.offset),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Grid.s.offset),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func setActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
