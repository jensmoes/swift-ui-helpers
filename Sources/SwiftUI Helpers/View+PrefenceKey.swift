//
//  View+PrefenceKey.swift
//
//
//  Created by Jens Troest on 10/18/23.
//

import SwiftUI

extension View {
    
    /// Maps a View's background frame to a value
    /// - Parameter frame: The target receiving the value of the views frame
    /// - Parameter space: The coordinate space to use. Defaults to `global`
    ///
    /// Use this to receive updates on a views frame information
    public func geometry(frame: Binding<CGRect>, in space: CoordinateSpace = .global) -> some View {
        self.modifier(FrameModifier(frame: frame, space: space))
    }

}

private struct CGRectPreferenceKey: PreferenceKey {
  static var defaultValue = CGRect.zero
  static func reduce(value: inout Value, nextValue: () -> Value) { }
}

/// Used by SwiftUI/View/geometry
private struct FrameModifier: ViewModifier {
    /// The target
    var frame: Binding<CGRect>
    /// The optional coordinate space
    var space: CoordinateSpace
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.preference(key: CGRectPreferenceKey.self, value: geometry.frame(in: space))
            }
        )
        .onPreferenceChange(CGRectPreferenceKey.self) { newSize in
            self.frame.wrappedValue = newSize
        }
    }
}
