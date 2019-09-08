//
//  CheckboxView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

var resize: CGFloat = 1.5
var outerSide: CGFloat = 30*resize
var innerSide: CGFloat = 24*resize
var outerRadius: CGFloat = 9*resize
var imageHeight: CGFloat = 25*resize
var imageWidth: CGFloat = 23*resize
var radiusRatio: CGFloat {
  return outerRadius / outerSide
}

struct OffView: View {
  var body: some View {
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

struct OnView: View {
  var body: some View {
    ZStack(alignment: .center) {
      Rectangle()
        .frame(maxWidth: outerSide, maxHeight: outerSide)
        .foregroundColor(.appGreen)
      
      Image("checkmark")
        .resizable()
        .frame(maxWidth: imageWidth, maxHeight: imageHeight)
        .foregroundColor(.white)
    }
    .cornerRadius(radiusRatio * innerSide)
  }
}

struct CheckmarkView: View {
  @State var isOn: Bool = false
  
  var body: some View {
    
    Button(action: {
      self.isOn.toggle()
    }) {
      if isOn {
        OnView()
      } else {
        OffView()
      }
    }
  }
}
