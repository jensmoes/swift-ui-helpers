// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

struct Example: View {
    
    @State var frameRect: CGRect
    var body: some View {
        Text("Hello")
            .geometry(frame: $frameRect)
    }
}
