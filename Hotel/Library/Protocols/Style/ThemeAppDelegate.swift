import UIKit

public protocol ThemeAppDelegate: UIApplicationDelegate {
    /**
     Implement this property to set custom theme.
     */
    var theme: Theme.Type { get }
}
