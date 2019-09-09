//
//  TitleCheckmarkView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 09/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct TitleCheckboxView: View {
  @State var isOn: Bool = false
  var name: String
  
  var body: some View {
    HStack {
      TitleText(color: isOn ? .appGreen : .white, text: name)
      Spacer()
      CheckboxBindingView(isOn: $isOn)
    }
      .frame(minHeight: 46)
  }
}

struct CheckboxBindingView: View {
  @Binding var isOn: Bool
  
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
