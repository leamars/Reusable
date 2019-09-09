//
//  ObservableFiltersView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI
import Combine

struct Heading: View {
  var body: some View {
    HStack {
      Text("Platforms")
        .foregroundColor(.white)
        .font(.uiLabel)
      
      Spacer()

    }
      .frame(height: 50)
      .padding([.leading], 20)
      .background(Color.battleshipGrey)
      .cornerRadius(9)
      .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 2)
  }
}
