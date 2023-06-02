//
//  View+synchronize.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 30/05/23.
//

import Foundation
import SwiftUI
import UIKit
extension View {
  func synchronize<Value>(
    _ first: Binding<Value>,
    _ second: FocusState<Value>.Binding
  ) -> some View {
    self
      .onChange(of: first.wrappedValue) { second.wrappedValue = $0 }
      .onChange(of: second.wrappedValue) { first.wrappedValue = $0 }
  }
    
    func hasScrollEnabled(_ value: Bool) -> some View {
            self.onAppear {
                UITableView.appearance().isScrollEnabled = value
            }
        }

}
