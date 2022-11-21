//
//  TCASampleApp.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCASampleApp: App {
  let store = Store(initialState: Coordinator.State(routes: [.root(.splash(.init()), embedInNavigationView: true)]), reducer: Coordinator())
  
  var body: some Scene {
    WindowGroup {
      CoordinatorView(store: store)
    }
  }
}
