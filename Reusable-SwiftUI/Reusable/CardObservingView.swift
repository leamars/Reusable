//
//  CardObservingView.swift
//  Reusable
//
//  Created by Lea on 19/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

struct CardObservingView: View {
  
  var title: String
  var subtitle: String
  @ObservedObject var screensaver: Screensaver
  
  var body: some View {
    HStack {
      MainButtonView(title: "View More", type: .primary(withArrow: true)) {
        // Is this callback a state change?
        print("Hello!")
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
struct CardObservingView_Previews: PreviewProvider {
  static var previews: some View {
    let screensaver = Screensaver()
    return CardObservingView(title: "Hello, World!", subtitle: "This is Lea", screensaver: screensaver)
  }
}
#endif
