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
  let store = Store(initialState: .initialState, reducer: TabCoordinator())
  
  var body: some Scene {
    WindowGroup {
      TabCoordinatorView(store: store)
    }
  }
}

struct TabCoordinatorView: View {
  let store: StoreOf<TabCoordinator>
  
  var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      TabView(selection: viewStore.binding(\.$seletedTab)) {
        HomeCoordinatorView(
          store: store.scope(
            state: \TabCoordinator.State.home,
            action: TabCoordinator.Action.home
          )
        )
        .tabItem {
          tabImage(
            named: viewStore.seletedTab == 0 ? "home.fill" : "home"
          )
        }
        .tag(0)
        
        SearchCoordinatorView(
          store: store.scope(
            state: \TabCoordinator.State.search,
            action: TabCoordinator.Action.search
          )
        )
        .tabItem {
          tabImage(
            named: viewStore.seletedTab == 1 ? "search.fill" : "search"
          )
        }
        .tag(1)
        
        NoticeCoordinatorView(
          store: store.scope(
            state: \TabCoordinator.State.notice,
            action: TabCoordinator.Action.notice
          )
        )
        .tabItem {
          tabImage(
            named: viewStore.seletedTab == 2 ? "notice.fill" : "notice"
          )
        }
        .tag(2)
        
        MessageCoordinatorView(
          store: store.scope(
            state: \TabCoordinator.State.message,
            action: TabCoordinator.Action.message
          )
        )
        .tabItem {
          tabImage(
            named: viewStore.seletedTab == 3 ? "message.fill" : "message"
          )
        }
        .tag(3)
      }
    }
  }
  
  func tabImage(named: String) -> some View {
    Image(named)
  }
}
