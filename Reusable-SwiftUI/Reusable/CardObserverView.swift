//
//  CardObserverView.swift
//  Reusable
//
//  Created by Lea on 20/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct CardObserverView: View {
  
  private var title: String
  private var subtitle: String
  @ObservedObject var screensaver: Screensaver
  private var callback: () -> Void
  
  init(viewModel: ViewModel) {
    self.title = viewModel.title
    self.subtitle = viewModel.subtitle
    self.callback = viewModel.callback
    self.screensaver = viewModel.screensaver
  }
  
  var body: some View {
    HStack {
      MainButtonView(title: "Click", type: .primary) {
        // Is this callback a state change?
        self.callback()
      }
      
      Spacer()
      
      VStack {
        Text(title)
        Text(subtitle)
      }
    }
    .background(screensaver.selectedColor)
  }
}
