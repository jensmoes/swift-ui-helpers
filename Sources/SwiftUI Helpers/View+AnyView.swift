//
//  View+AnyView.swift
//
//
//  Created by Jens Troest on 3/13/24.
//

import SwiftUI

extension View {
    /// Returns a `View` as ``AnyView``
    public func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
