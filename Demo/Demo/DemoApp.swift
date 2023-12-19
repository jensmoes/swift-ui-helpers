//
//
//  DemoApp.swift
//  Demo
//
//  Created by jensmoes on 12/19/23.
//


import SwiftUI

@main
struct DemoApp: App {
    @StateObject private var model = Data()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
