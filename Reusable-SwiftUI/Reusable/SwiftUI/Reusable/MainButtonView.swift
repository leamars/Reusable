//
//  MainButtonView.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

enum MainButtonType {
  case primary
  case secondary
  case destructive
  
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
    self.type = MainButtonType.primary
    self.callback = callback
  }
  
  var body: some View {
    Button(action: {
      self.callback()
    }) {
      HStack {
        Spacer()
        
        Text(title)
          .font(.uiButtonLabel)
          .background(Color.clear)
          .foregroundColor(.white)
        
        Spacer()
      }
      .frame(height: 46)
      .background(type.color)
      .cornerRadius(9)
    }
  }
}







