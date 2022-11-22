//
//  HomeCoordinator.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/22.
//

import ComposableArchitecture

struct HomeCoordinator: ReducerProtocol {
  struct State: Equatable {
    @BindableState var displayName: String = ""
    
    static let initialState = State()
  }
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
  }
  
  var body: some ReducerProtocol<State, Action> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
      default:
        return .none
      }
    }
//    Reduce(self.reduce)
  }
//  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
//    switch action {
//    default:
//      return .none
//    }
//  }
}
