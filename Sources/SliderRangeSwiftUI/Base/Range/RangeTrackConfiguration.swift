import SwiftUI

@available(iOS 13.0, *)
public typealias RangeTrackConfig = RangeTrackConfiguration

@available(iOS 13.0, *)
public struct RangeTrackConfiguration {
    public static let defaultConfiguration = RangeTrackConfiguration()
    
    public let lowerLeadingOffset: CGFloat
    public let lowerTrailingOffset: CGFloat
    public let upperLeadingOffset: CGFloat
    public let upperTrailingOffset: CGFloat
    
    public init(lowerLeadingOffset: CGFloat = 0, lowerTrailingOffset: CGFloat = 0, upperLeadingOffset: CGFloat = 0, upperTrailingOffset: CGFloat = 0) {
        self.lowerLeadingOffset = lowerLeadingOffset
        self.lowerTrailingOffset = lowerTrailingOffset
        self.upperLeadingOffset = upperLeadingOffset
        self.upperTrailingOffset = upperTrailingOffset
    }
}

@available(iOS 13.0, *)
public extension RangeTrackConfiguration {
    init(lowerOffset: CGFloat = 0, upperOffset: CGFloat = 0) {
        self.lowerLeadingOffset = lowerOffset / 2
        self.lowerTrailingOffset = lowerOffset / 2 + upperOffset
        self.upperLeadingOffset = lowerOffset + upperOffset / 2
        self.upperTrailingOffset = upperOffset / 2
    }
}

@available(iOS 13.0, *)
public extension RangeTrackConfiguration {
    init(offsets: CGFloat = 0) {
        self.lowerLeadingOffset = offsets / 2
        self.lowerTrailingOffset = offsets / 2 + offsets
        self.upperLeadingOffset = offsets + offsets / 2
        self.upperTrailingOffset = offsets / 2
    }
}
