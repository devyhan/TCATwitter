//
//  Splash.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture

struct Splash: ReducerProtocol {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    case openApp
  }
  
  var body: some ReducerProtocol<State, Action> {
    Reduce(self.reduce)
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    default:
      return .none
    }
  }
}
