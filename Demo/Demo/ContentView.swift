//
//
//  ContentView.swift
//  Demo
//
//  Created by jensmoes on 12/19/23.
//


import SwiftUI
import SwiftUIHelpers

struct ContentView: View {
    
    @State var frame: CGRect = .zero
    @State var width: CGFloat = 0
    @State var size: CGSize = .zero
    @EnvironmentObject var data: Data
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)

            /// `geometry` example
            Text("Hello, world!")
                .geometry(frame: $frame)
                .onChange(of: frame) { newValue in
                    print("The frame of \"Hello, world!\" is \(newValue)")
                }
            
            /// Conditional `if-else` example
            Circle()
                .if(data.counter % 2 == 0) { circle in
                    circle.foregroundColor(.green)
                } else: { circle in
                    circle.foregroundColor(.red)
                }
                .frame(width: 50, height: 50)
                .width(value: $width)
                .onChange(of: width) { newValue in
                    print("The Circle width is \(width)")
                }

            Button("Toggle Color") {
                data.incrementCounter()
            }
            .keyboardShortcut(.defaultAction)
        }
        .padding()
        .geometry(size: $size)
        .onChange(of: size) { newValue in
            print("The VStack size is \(size)")
        }
    }
}

#Preview {
    ContentView()
}
