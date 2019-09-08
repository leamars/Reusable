//
//  FiltersView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import Combine
import SwiftUI

struct FiltersView: View {
  
  @EnvironmentObject var state: ClassFiltersState
  @Binding var isPresented: Bool
      
  var body: some View {
        
    return VStack {
      Heading()
      
      filtersList()
        .padding([.top], 20)
      
      applyOrCloseButton()
        .padding([.top], 40)
    }
      .padding([.leading, .trailing], 20)
      .background(Color.appBlack)
  }
  
  private func applyOrCloseButton() -> MainButtonView {
    let title = state.areFiltersSame ? "Close" : "Apply"
    return MainButtonView(title: title, type: .primary) {
      self.state.updateAllFilters()
      self.isPresented = false
    }
  }
  
  private func filtersList() -> some View {
    return VStack(alignment: .leading, spacing: 12) {
      ForEach(state.editable, id:\.type) { filter in
        TitleCheckmarkFilterView(filter: filter)
      }
    }
  }
}
