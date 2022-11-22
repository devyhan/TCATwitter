//
//  NoticeCoordinator.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/22.
//

import ComposableArchitecture

struct NoticeCoordinator: ReducerProtocol {
  struct State: Equatable {
    static let initialState = State()
  }
  enum Action {}
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
