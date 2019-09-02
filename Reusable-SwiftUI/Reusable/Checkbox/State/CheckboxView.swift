//
//  CheckboxView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

var outerSide: CGFloat = 30
var innerSide: CGFloat = 24
var outerRadius: CGFloat = 9
var imageHeight: CGFloat = 25
var imageWidth: CGFloat = 23
var radiusRatio: CGFloat {
  return outerRadius / outerSide
}

struct CheckmarkView: View {
  @State var isOn: Bool = false
  var body: some View {
    
    Button(action: {
      self.isOn.toggle()
    }) {
      if isOn {
        onView()
      } else {
        offView()
      }
    }
  }
  
  private func onView() -> some View {
    ZStack(alignment: .center) {
      Rectangle()
        .frame(maxWidth: outerSide, maxHeight: outerSide)
        .foregroundColor(.appGreen)
      
      Image("checkmark")
        .resizable()
        .frame(maxWidth: 15, maxHeight: 17)
        .foregroundColor(.white)
    }
    .cornerRadius(radiusRatio * innerSide)
  }
  
  private func offView() -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: outerRadius)
      .frame(maxWidth: outerSide, maxHeight: outerSide)
      .foregroundColor(Color.coolGrey)
      
      RoundedRectangle(cornerRadius: radiusRatio * innerSide)
      .frame(maxWidth: innerSide, maxHeight: innerSide)
      .foregroundColor(.white)
    }
  }
}
