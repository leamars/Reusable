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

struct FilterRow: View {
  
  @EnvironmentObject var filters: FiltersState
  var index: Int
  @State var isOn: Bool
  
  var body: some View {
    TitleCheckbox(isOn: $isOn, name: filters.all[index].type.name)
  }
}

struct ObservableFiltersView: View {
  
  //@EnvironmentObject var state: ClassFiltersState
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
    //let title = filters.editable.elementsEqual(filters.all) ? "Close" : "Apply"
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
      
      
      
//      ForEach(0..<filters.editable.count) { index in
//        FilterRow(index: index, isOn: self.filters.editable[index].isOn).environmentObject(self.filters)
//      }
      
//      ForEach(0..<state.editable.count) { index in
//        TitleCheckmarkFilterView(index: index).environmentObject(self.state)
//      }
      
//      ForEach(state.editable, id:\.type) { filter in
//        TitleCheckmarkFilterView(filter: filter)
//      }

//      ForEach(state.editable, id: \.type) { checkmarkable in
//        TitleCheckmarkable(model: checkmarkable, isOn: checkmarkable.isOn)
//      }
      
      
//      ForEach(0..<state.editable.count) { index in
//        TitleCallbackCheckbox(isOn: self.filters.editable[index].isOn,
//                              name: self.filters.editable[index].type.name, onChange: { isOn in
//
//                        self.filters.editable[index].isOn = isOn
//        })
//      }
      
      
//      ForEach(0..<state.editable.count) { index in
//        TitleCheckbox(isOn: self.$state.editable[index].isOn,
//                      name: self.state.editable[index].type.name)
//      }
      
//      ForEach(filters.all, id:\.self) { filter in
//        TitleCheckbox(isOn: filter.isOn, name: filter.name)
//      }
    }
  }
}
