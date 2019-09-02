//
//  Buttonize.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

enum ButtonModifierType {
  case primary, secondary, destructive
  
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

struct Buttonize: ViewModifier {
  private var type: ButtonModifierType
  private var callback: () -> Void
  
  init(type: ButtonModifierType, callback: @escaping () -> Void) {
    self.type = type
    self.callback = callback
  }
  
  public func body(content: Content) -> some View {
    GeometryReader { geometry in
      Group {
        Button(action: {
          self.callback()
        }) {
          Group {
            content
          }
          .frame(width: geometry.size.width, height: 46, alignment: .center)
          .background(self.type.color)
          .cornerRadius(9)
        }
      }
    }
  }
}
