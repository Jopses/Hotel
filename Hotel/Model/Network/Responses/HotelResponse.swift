import UIKit
struct HotelResponse: Decodable {
    let id: Int
    let name: String
    let address: String
    let stars: CGFloat
    let distance: CGFloat
    let image: String?
    let suitesAvailability: String
    let lat: CGFloat?
    let lon: CGFloat?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case stars
        case distance
        case image
        case suitesAvailability = "suites_availability"
        case lat
        case lon
    }
}
