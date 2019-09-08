//
//  CheckboxBinding.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct CheckboxBindingView: View {
  @Binding var isOn: Bool
  
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
        .frame(maxWidth: imageWidth, maxHeight: imageHeight)
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

