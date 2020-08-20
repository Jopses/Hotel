public protocol Theme {
    static var colorPalette: ColorPalette.Type { get }
    static var typography: Typography.Type { get }
}
