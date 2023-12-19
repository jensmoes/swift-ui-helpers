//
//  View+Geometry.swift
//
//
//  Created by Jens Troest on 10/18/23.
//

import SwiftUI

/// An extension that faciliates the capture of view geometry
public extension View {
    
    /// Maps a View's background frame to a value
    /// - Parameter frame: The target receiving the value of the views frame
    /// - Parameter space: The coordinate space to use. Defaults to `global`
    ///
    /// Use this to receive updates on a views frame information
    ///
    /// - SeeAlso: ``SwiftUIHelpers/SwiftUI/View/geometry(size:)``
    public func geometry(frame: Binding<CGRect>, in space: CoordinateSpace = .global) -> some View {
        self.modifier(FrameModifier(frame: frame, space: space))
    }

    /// Bind a given value to the size of the view it is attached to
    /// - Parameter size: Binding holding the result
    ///
    /// - SeeAlso: ``SwiftUIHelpers/SwiftUI/View/geometry(frame:in:)``
    public func geometry(size: Binding<CGSize>) -> some View {
        self.modifier(SizeModifier(size: size))
    }

    /// Binds a given value to the height of the view it is attached to
    /// - Parameter value: Binding holding the result
    public func height(value: Binding<CGFloat>) -> some View {
        self.modifier(HeightModifier(height: value))
    }

    /// Bind a given value to the width of the view it is attached to
    /// - Parameter value: Binding holding the result
    public func width(value: Binding<CGFloat>) -> some View {
        self.modifier(WidthModifier(width: value))
    }
}

// MARK: Preference Keys
private struct CGRectPreferenceKey: PreferenceKey {
  static var defaultValue = CGRect.zero
  static func reduce(value: inout Value, nextValue: () -> Value) { }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue = CGSize.zero
  static func reduce(value: inout Value, nextValue: () -> Value) { }
}

//MARK: ViewModifiers

/// A view modifier for capturing frame information
///
/// Used by ``SwiftUIHelpers/SwiftUI/View/geometry(frame:in:)``
struct FrameModifier: ViewModifier {
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

/// A view modifier for capturing the views size
///
/// Used by ``SwiftUIHelpers/SwiftUI/View/geometry(size:)``
struct SizeModifier: ViewModifier {
    var size: Binding<CGSize>
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { newSize in
            self.size.wrappedValue = newSize
        }
    }
}

/// A view modifier for capturing the views height
///
/// Used by ``SwiftUIHelpers/SwiftUI/View/height(value:)``
struct HeightModifier: ViewModifier {
    var height: Binding<CGFloat>
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { newSize in
            self.height.wrappedValue = newSize.height
        }
    }
}

/// A view modifier for capturing the views width
///
/// Used by ``SwiftUIHelpers/SwiftUI/View/width(value:)``
struct WidthModifier: ViewModifier {
    var width: Binding<CGFloat>
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { newSize in
            self.width.wrappedValue = newSize.width
        }
    }
}
