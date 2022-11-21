//
//  HomeView.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/21.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
  let store: StoreOf<Home>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      Text("home")
      Button(action: {viewStore.send(.pop)}) {
        Text("pop")
      }
      
      Button(action: {viewStore.send(.pushToSelf)}) {
        Text("push")
      }
    }
  }
}

struct InnerView: View {
  let store: StoreOf<Inner>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      Text("Inner")
      Button(action: {viewStore.send(.pop)}) {
        Text("popToRoot")
      }
      
      Button(action: {viewStore.send(.pushToSelf)}) {
        Text("push")
      }
    }
  }
}

struct Inner: ReducerProtocol {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    case pop
    case pushToSelf
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
