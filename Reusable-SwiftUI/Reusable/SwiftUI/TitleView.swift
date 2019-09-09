//
//  TitleCheckmarkView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct TitleText: View {
  var color: Color
  var text: String
  
  var body: some View {
    Text(text)
    .foregroundColor(color)
    .font(.uiBodyCustom)
    .padding([.trailing], Layout.padding.textTrailing)
  }
}
