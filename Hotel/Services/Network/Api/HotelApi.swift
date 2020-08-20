import Moya
import UIKit

enum HotelApi {
    case getHotels(path: String)
    case getHotelById(_ id: Int)
}

// MARK: - Moya setup

extension HotelApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: AppDefaults.apiUrl) else {
            fatalError("Failed to provide api base url")
        }
        return url
    }

    var path: String {
        switch self {
        case let .getHotels(path):
            return "/\(path).json"
        case let .getHotelById(id):
            return "/\(id).json"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var sampleData: Data {
        return Data()
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return nil
    }
}
