//
//  FiltersViewBinding.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 09/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct FiltersBindingEnumeratedView: View {
  
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
    
    // Works, but if the array ever changes, we're going to get a crash
    return VStack(alignment: .leading, spacing: 12) {
      ForEach(0..<state.editable.count) { index in
        TitleBindingCheckbox(isOn: self.$state.editable[index].isOn,
                             name: self.state.editable[index].name)
      }
    }
  }
}

struct TitleBindingCheckbox: View {
  @Binding var isOn: Bool
  var name: String
  
  var body: some View {
    HStack {
      TitleText(color: isOn ? .appGreen : .white, text: name)
      Spacer()
      CheckmarkBindingView(isOn: $isOn)
    }
      .frame(minHeight: 46)
  }
}

struct CheckmarkBindingView: View {
  @Binding var isOn: Bool
  
  var body: some View {
        
    return Button(action: {
      self.isOn.toggle()
    }) {
      if isOn {
        OnView()
      }
      else {
        OffView()
      }
    }
  }
}
