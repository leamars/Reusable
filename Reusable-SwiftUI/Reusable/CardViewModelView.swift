//
//  CardView.swift
//  Reusable
//
//  Created by Lea on 19/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI
import Combine

struct ViewModel {
  var title: String
  var subtitle: String
  var callback: () -> Void
  var screensaver: Screensaver
}

struct CardViewModelView: View {
  
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
      MainButtonView(title: "Click", type: .primary(withArrow: true)) {
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

#if DEBUG
struct CardViewModelView_Previews: PreviewProvider {
  static var previews: some View {
    let screensaver = Screensaver()
    let viewModel = ViewModel(title: "I am Lea", subtitle: "Marolt Sonnenschein", callback: {
      print("Hear me roar!!!")
    }, screensaver: screensaver)
    return CardViewModelView(viewModel: viewModel)
  }
}
#endif
