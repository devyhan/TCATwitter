//
//  Screen.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture

struct Screen: ReducerProtocol {
  enum State: Equatable {
    case splash(Splash.State)
    case home(Home.State)
    case inner(Inner.State)
  }
  
  enum Action: Equatable {
    case splash(Splash.Action)
    case home(Home.Action)
    case inner(Inner.Action)
  }
  
  var body: some ReducerProtocol<State, Action> {
    Scope(
      state: /State.splash,
      action: /Action.splash
    ) {
      Splash()
    }
    Scope(
      state: /State.home,
      action: /Action.home
    ) {
      Home()
    }
    Scope(
      state: /State.inner,
      action: /Action.inner
    ) {
      Inner()
    }
  }
}
