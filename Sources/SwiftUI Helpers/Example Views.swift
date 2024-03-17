// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

struct Geometry: View {
    
    /// Geometry example capturing the views frame into a state variable
    @State var frameRect: CGRect
    var body: some View {
        Text("Hello")
            .geometry(frame: $frameRect)
    }
}
