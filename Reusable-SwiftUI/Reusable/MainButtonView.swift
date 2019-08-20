//
//  MainButtonView.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

enum MainButtonType {
  case primary(withArrow: Bool)
  case secondary(withArrow: Bool)
  case destructive(withArrow: Bool)
  
  var color: Color {
    switch self {
    case .primary:
      return .appGreen
    case .secondary:
      return .appBlack
    case .destructive:
      return .copper
    }
  }
  
  // TODO: Hopefully Luke gives us a white Image, so we don't have to switch here at all
  var arrowImage: UIImage {
    switch self {
    case .primary, .secondary:
      return #imageLiteral(resourceName: "green")
    case .destructive:
      return #imageLiteral(resourceName: "red")
    }
  }
  
  var hasArrow: Bool {
    switch self {
    case .primary(let hasArrow),
         .destructive(let hasArrow),
         .secondary(let hasArrow):
      return hasArrow
    }
  }
}
struct MainButtonView: View {
  
  private var title: String
  private var type: MainButtonType
  private var callback: () -> Void
  
  init(title: String, type: MainButtonType, callback: @escaping () -> Void) {
    self.title = title
    self.type = type
    self.callback = callback
  }
  
  init(title: String, callback: @escaping () -> Void) {
    self.title = title
    self.type = MainButtonType.primary(withArrow: false)
    self.callback = callback
  }
  
  var body: some View {
    Button(action: {
      self.callback()
    }) {
      
      HStack {
        
        if type.hasArrow {
          Rectangle()
            .frame(width: 24, height: 24, alignment: .center)
            .foregroundColor(.clear)
        }
        
        Spacer()
        
        Text(title)
          .font(.uiButtonLabel)
          .background(Color.clear)
          .foregroundColor(.white)
        
        Spacer()
        
        if type.hasArrow {
          ZStack {
            Rectangle()
              .frame(width: 24, height: 24, alignment: .center)
              .cornerRadius(9)
              .background(Color.clear)
              .foregroundColor(.white)
            Image(uiImage: type.arrowImage)
              .resizable()
              .foregroundColor(type.color)
              .frame(width: 24, height: 24, alignment: .center)
          }
          .padding([.trailing, .top, .bottom], 10)
        }
      }
      .frame(height: 46)
      .background(type.color)
      .cornerRadius(9)
    }
  }
}
#if DEBUG
struct PrimaryButtonView_Previews: PreviewProvider {
  static var previews: some View {
    MainButtonView(title: "Got It!", type: .primary(withArrow: true)) {
      print("Tapped!")
    }
  }
}
#endif







