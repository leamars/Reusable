//
//  FiltersCallbacksView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 09/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct FiltersCallbacksView: View {
  
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
      ForEach(state.editable, id:\.self) { filter in
        TitleCallbackCheckbox(isOn: filter.isOn, name: filter.name) { isOn in
          guard let index = self.state.editable.firstIndex(of: filter) else { return }
          self.state.editable[index].isOn = isOn
        }
      }
    }
  }
}

struct TitleCallbackCheckbox: View {
  //  @EnvironmentObject var filter: FilterC
  var isOn: Bool
  var name: String
  var onChange: (Bool) -> Void
  
  var body: some View {
    HStack {
      TitleText(color: isOn ? .appGreen : .white, text: name)
      Spacer()
      CheckmarkCallbackView(isOn: isOn, onChange: onChange)
    }
    .frame(minHeight: 46)
  }
}

struct CheckmarkCallbackView: View {
  var isOn: Bool
  var onChange: (Bool) -> Void
  
  var body: some View {
    
    Button(action: {
      self.onChange(!self.isOn)
    }) {
      if isOn {
        OnView()
      } else {
        OffView()
      }
    }
  }
}
