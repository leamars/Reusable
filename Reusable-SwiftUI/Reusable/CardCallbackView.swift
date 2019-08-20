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

struct CardCallbackView: View {
  
  var title: String
  var subtitle: String
  @ObservedObject var screensaver: Screensaver
  var callback: (_ success: Bool) -> Void
  
  init(title: String, subtitle: String, scrensaver: Screensaver, callback: @escaping (_ success: Bool) -> Void) {
    self.title = title
    self.subtitle = subtitle
    self.screensaver = scrensaver
    self.callback = callback
  }
  
  var body: some View {
    HStack {
      MainButtonView(title: "Click!", type: .primary(withArrow: false)) {
        self.callback(self.screensaver.selectedColor == Color.appGreen)
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
    return CardCallbackView(title: "Hello, World!", subtitle: "This is Lea", scrensaver: screensaver) { success in
      print("I was rght - \(success)")
    }
  }
}
#endif
