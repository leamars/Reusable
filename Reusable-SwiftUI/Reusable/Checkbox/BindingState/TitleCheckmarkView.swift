//
//  TitleCheckmarkView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct TitleCheckmarkView: View {
  @State var isOn: Bool = false
  var name: String
  
  var body: some View {
    HStack {
      
      text()
      Spacer()
      CheckboxBindingView(isOn: $isOn)
    }
      .frame(minHeight: 46)
  }
  
  private func text() -> some View  {
    if !isOn {
      return Text(name)
      .foregroundColor(.appBlack)
      .font(.uiBodyCustom)
      .padding([.trailing], Layout.padding.textTrailing)
    } else {
      return Text(name)
      .foregroundColor(.appGreen)
      .font(.uiButtonLabel)
      .padding([.trailing], Layout.padding.textTrailing)
    }
  }
}
