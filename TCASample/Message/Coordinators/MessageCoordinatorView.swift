//
//  MessageCoordinatorView.swift
//  TCASample
//
//  Created by 조요한 on 2022/11/22.
//

import ComposableArchitecture
import SwiftUI
import TCACoordinators

struct MessageCoordinatorView: View {
  let store: StoreOf<MessageCoordinator>
  var body: some View {
    Text("message")
  }
}

