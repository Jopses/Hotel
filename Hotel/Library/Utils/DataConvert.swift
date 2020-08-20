import UIKit

class DataConvert {
    static func stringToArrayToInt(string: String, delimiter: String = ":") -> Int {
        let array = string.components(separatedBy: delimiter)
        return array.count
    }
}
