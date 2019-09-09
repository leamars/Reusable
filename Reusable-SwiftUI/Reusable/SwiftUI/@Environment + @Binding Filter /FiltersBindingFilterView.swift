//
//  FiltersBindingFilterView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 09/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct FiltersBindingFilterView: View {
  
  @EnvironmentObject var state: FiltersState
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
        TitleCheckmarkBindingFilterView(filter: filter)
      }
    }
  }
}

struct TitleCheckmarkBindingFilterView: View {
  @State var filter: Filter
  
  var body: some View {
    HStack {
      TitleText(color: filter.isOn ? .appGreen : .white, text: filter.type.name)
      Spacer()
      CheckmarkBindingFilterView(filter: $filter)
    }
      .frame(minHeight: 46)
  }
}

struct CheckmarkBindingFilterView: View {
  @Binding var filter: Filter
  
  var body: some View {
        
  Button(action: {
    self.filter.isOn.toggle()
    }) {
      if filter.isOn {
        OnView()
      } else {
        OffView()
      }
    }
  }
}

