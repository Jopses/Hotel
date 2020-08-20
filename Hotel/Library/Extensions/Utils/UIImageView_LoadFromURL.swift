import SDWebImage

extension UIImageView {
    func loadFromUrl(_ url: URL?, placeholder: UIImage? = nil) {
        guard let url = url else {
            image = placeholder
            return
        }
        sd_setImage(with: url, placeholderImage: placeholder, options: [.refreshCached, .fromLoaderOnly])
    }
}
