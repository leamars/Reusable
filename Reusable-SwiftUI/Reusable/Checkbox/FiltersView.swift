//
//  FiltersView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct FiltersView: View {

  var filters = Filters()
  
  var body: some View {
    VStack {
      
      filtersList()
        .padding([.leading, .trailing, .top], 20)
      
      applyOrCloseButton()
        .padding([.leading, .trailing], 20)
        .padding([.top],  40)
    }
  }
  
  private func applyOrCloseButton() -> MainButtonView {
    
//    let equalSets = Set(contentsMC.currentParameters) == Set(filters.appliedParameters)
//    let title = equalSets ? "Close" : "Apply"
    
    return MainButtonView(title: "Apply", type: .primary) {
//      self.isPresented = false
    }
  }
  
  private func filtersList() -> some View {
    VStack(alignment: .leading, spacing: 12) {
      
      ForEach(filters.filters, id: \.self) { filter in
        TitleCheckmarkView(name: filter.type.name)
      }
    }
  }
}
