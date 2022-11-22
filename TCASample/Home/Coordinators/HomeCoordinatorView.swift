//
//  HomeCoordinatorView.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/22.
//

import ComposableArchitecture
import SwiftUI

struct HomeCoordinatorView: View {
//  let store: StoreOf<HomeCoordinator>
  let store: Store<HomeCoordinator.State, HomeCoordinator.Action>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      
        TextField("TxtField", text: viewStore.binding(\.$displayName))
          .border(Color.red)
      
    }
  }
}
