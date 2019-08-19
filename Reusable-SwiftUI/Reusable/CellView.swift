//
//  CellView.swift
//  Reusable
//
//  Created by Lea on 19/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI
import Combine

struct CellView: View {
  
  var title: String
  var subtitle: String
  @ObservedObject var screensaver: Screensaver
  
  var body: some View {
    HStack {
      Rectangle()
        .frame(width: 100, height: 100, alignment: .center)
        .background(screensaver.selectedColor)
        .foregroundColor(screensaver.selectedColor)
        .cornerRadius(9)
      
      Spacer()
      
      VStack {
        Text(title)
        Text(subtitle)
      }
    }
  }
}

#if DEBUG
struct CellView_Previews: PreviewProvider {
  static var previews: some View {
    let screensaver = Screensaver()
    return CellView(title: "Hello, World!", subtitle: "This is Lea", screensaver: screensaver)
  }
}
#endif

