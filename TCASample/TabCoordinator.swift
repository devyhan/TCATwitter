//
//  TabCoordinator.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/22.
//

import ComposableArchitecture
import TCACoordinators

struct TabCoordinator: ReducerProtocol {
  struct State: Equatable {
    @BindableState var seletedTab: Int
    
    // tab navigation
    var home: HomeCoordinator.State
    var search: SearchCoordinator.State
    var notice: NoticeCoordinator.State
    var message: MessageCoordinator.State
    
    static let initialState = State(
      seletedTab: .zero,
      home: .initialState,
      search: .initialState,
      notice: .initialState,
      message: .initialState
    )
  }
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    case home(HomeCoordinator.Action)
    case search(SearchCoordinator.Action)
    case notice(NoticeCoordinator.Action)
    case message(MessageCoordinator.Action)
  }
  
  var body: some ReducerProtocol<State, Action> {
    BindingReducer()
    Reduce(self.reduce)
//    Reduce { state, action in
//      switch action {
//      case .binding(\.$seletedTab):
//        print("tab: \(state.$seletedTab.wrappedValue)")
//        return .none
//      default:
//        return .none
//      }
//    }
    Scope(state: \.home, action: /Action.home) {
      HomeCoordinator()
    }
    Scope(state: \.search, action: /Action.search) {
      SearchCoordinator()
    }
    Scope(state: \.notice, action: /Action.notice) {
      NoticeCoordinator()
    }
    Scope(state: \.message, action: /Action.message) {
      MessageCoordinator()
    }
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .binding(\.$seletedTab):
      print("tab: \(state.$seletedTab.wrappedValue)")
      return .none
    default:
      return .none
    }
  }
}

