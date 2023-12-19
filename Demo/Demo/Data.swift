//
//
//  Data.swift
//  Demo
//
//  Created by jensmoes on 12/19/23.
//


import Foundation

class Data: ObservableObject {

    func incrementCounter() {
        counter = counter + 1
    }
    /// A counter used to effect state changes in various examples
    @Published var counter: Int = 0
    
    
}
