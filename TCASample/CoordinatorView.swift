//
//  CoordinatorView.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture
import TCACoordinators
import SwiftUI

struct CoordinatorView: View {
  let store: StoreOf<Coordinator>
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) {
        CaseLet(
          state: /Screen.State.splash,
          action: Screen.Action.splash,
          then: SplashView.init
        )
        CaseLet(
          state: /Screen.State.home,
          action: Screen.Action.home,
          then: HomeView.init
        )
        CaseLet(
          state: /Screen.State.inner,
          action: Screen.Action.inner,
          then: InnerView.init
        )
      }
    }
  }
}
