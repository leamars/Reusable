//
//  MultipleBindingStatesView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 03/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct MultipleBindingStatesView: View {
  
  var filters = Filters()
  let classFilters = FilterType.allCases.map { ClassFilter(type: $0, isOn: false) }
  @State var areOn = [false, false, false, false]
  @State var isOn = false
  
  var body: some View {
    VStack {
      Heading()
      
      filtersList()
        .padding([.trailing, .leading, .top], 20)
      
      applyOrCloseButton()
        .padding([.top], 40)
    }
    .padding([.leading, .trailing], 20)
    .onAppear {
//      self.areOn = self.filters.filters.map{ $0.isOn }
    }
  }
  
  private func applyOrCloseButton() -> MainButtonView {
    return MainButtonView(title: "Close", type: .primary) {
      print("Apply Pressed!")
    }
  }
  
  private func filtersList() -> some View {
    
    return VStack(alignment: .leading, spacing: 12) {
      
      ForEach(classFilters, id: \.type) { filter in
        TitleCheckmarkView(isOn: self.isOn, name: filter.type.name)
      }
    }
  }
}
