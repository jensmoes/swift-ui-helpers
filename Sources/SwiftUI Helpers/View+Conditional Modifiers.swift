//
//
//  View+Conditional Modifiers.swift
//
//
//  Created by jensmoes on 12/19/23.
//


import SwiftUI

extension View {

    /// A modifier allowing to specify a condition for applying a view modifier.
    ///
    /// Usage example:
    ///
    /// ```swift
    /// Text("Hello World")
    ///     .if( x > 2 ) {
    ///         $0.foregroundColor(.blue)
    ///     }  else: {
    ///         $0.foregroundColor(.red)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///    - condition: Provde a closure that returns `true` or `false` or an expression such as `x > 2`
    ///    - then: The closure to execute if the `conditon` is fulfilled
    ///    - else: Optional alternative closure for when `condition` evaluates `false`
    @ViewBuilder public func `if`<Content: View>(_ condition: @autoclosure () -> Bool, _ then: @escaping (Self) -> Content, else: ((Self) -> Content)? = nil) -> some View {
        if condition() {
            then(self)
        } else if `else` != nil {
            `else`!(self)
        }
        else {
            self
        }
    }

}

