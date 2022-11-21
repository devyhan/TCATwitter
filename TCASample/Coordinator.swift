//
//  Coordinator.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture
import SwiftUI
import TCACoordinators

struct Coordinator: ReducerProtocol {
  struct State: Equatable, IndexedRouterState {
    var routes: [Route<Screen.State>] 
  }
  
  enum Action: Equatable, IndexedRouterAction {
    case routeAction(Int, action: Screen.Action)
    case updateRoutes([Route<Screen.State>])
  }
  
  var body: some ReducerProtocol<State, Action> {
    Reduce(self.reduce)
      .forEachRoute {
        Screen()
      }
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .routeAction(let value, .splash(.openApp)):
      print(value)
      state.routes.push(.home(.init()))
      return .none
    case .routeAction(_, action: .home(.pop)):
      state.routes.pop()
      return .none
    case .routeAction(let value, action: .home(.pushToSelf)):
      print(value)
      state.routes.push(.inner(.init()))
      return .none
    case .routeAction(let value, action: .inner(.pop)):
      print(value)
      state.routes.popToRoot()
      return .none
    default:
      return .none
    }
  }
}
