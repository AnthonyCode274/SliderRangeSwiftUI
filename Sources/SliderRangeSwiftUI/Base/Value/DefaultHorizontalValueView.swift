import SwiftUI

@available(iOS 13.0, *)
public struct DefaultHorizontalValueView: View {
    public var body: some View {
        Capsule()
            .foregroundColor(.red)
            .frame(height: 0)
    }
}
