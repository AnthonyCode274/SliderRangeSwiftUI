import SwiftUI

@available(iOS 13.0.0, *)
public typealias HRangeTrack = HorizontalRangeTrack

@available(iOS 13.0, *)
public struct HorizontalRangeTrack<V, ValueView: View, MaskView: View>: View where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint  {
    let range: ClosedRange<CGFloat>
    let bounds: ClosedRange<CGFloat>
    let view: AnyView
    let mask: AnyView
    let configuration: RangeTrackConfiguration
    
    public var body: some View {
        GeometryReader { geometry in
            self.view
                .mask(
                    ZStack {
                        self.mask
                             .frame(
                                 width: rangeDistance(
                                    overallLength: geometry.size.width,
                                    range: self.range,
                                    bounds: self.bounds,
                                    lowerStartOffset: self.configuration.lowerLeadingOffset,
                                    lowerEndOffset: self.configuration.lowerTrailingOffset,
                                    upperStartOffset: self.configuration.upperLeadingOffset,
                                    upperEndOffset: self.configuration.upperTrailingOffset
                                 )
                             )
                             .offset(
                                 x: distanceFrom(
                                    value: self.range.lowerBound,
                                    availableDistance: geometry.size.width,
                                    bounds: self.bounds,
                                    leadingOffset: self.configuration.lowerLeadingOffset,
                                    trailingOffset: self.configuration.lowerTrailingOffset
                                 )
                             )
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                )
        }
    }
}
@available(iOS 13.0, *)
extension HorizontalRangeTrack {
    public init(range: ClosedRange<V>, in bounds: ClosedRange<V> = 0.0...1.0, view: ValueView, mask: MaskView, configuration: RangeTrackConfiguration = .defaultConfiguration) {
        self.range = CGFloat(range.lowerBound)...CGFloat(range.upperBound)
        self.bounds = CGFloat(bounds.lowerBound)...CGFloat(bounds.upperBound)
        self.view = AnyView(view)
        self.mask = AnyView(mask)
        self.configuration = configuration
    }
}
@available(iOS 13.0, *)
extension HorizontalRangeTrack where ValueView == DefaultHorizontalValueView {
    public init(range: ClosedRange<V>, in bounds: ClosedRange<V> = 0.0...1.0, mask: MaskView, configuration: RangeTrackConfiguration = .defaultConfiguration) {
        self.init(range: range, in: bounds, view: DefaultHorizontalValueView(), mask: mask, configuration: configuration)
    }
}
@available(iOS 13.0, *)
extension HorizontalRangeTrack where MaskView == Capsule {
    public init(range: ClosedRange<V>, in bounds: ClosedRange<V> = 0.0...1.0, view: ValueView, configuration: RangeTrackConfiguration = .defaultConfiguration) {
        self.init(range: range, in: bounds, view: view, mask: Capsule(), configuration: configuration)
    }
}
@available(iOS 13.0, *)
extension HorizontalRangeTrack where ValueView == DefaultHorizontalValueView, MaskView == Capsule {
    public init(range: ClosedRange<V>, in bounds: ClosedRange<V> = 0.0...1.0, configuration: RangeTrackConfiguration = .defaultConfiguration) {
        self.init(range: range, in: bounds, view: DefaultHorizontalValueView(), mask: Capsule(), configuration: configuration)
    }
}
