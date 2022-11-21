//
//  SplashView.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture
import SwiftUI

struct SplashView: View {
  private let store: StoreOf<Splash>

  init(store: StoreOf<Splash>) {
    self.store = store
  }
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Button(action: {viewStore.send(.openApp)}) {
          Text("NextView")
        }
      }
    }
  }
}
