//
//  TitleCheckmarkView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 01/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct CheckmarkBindingView: View {
  @Binding var isOn: Bool
  @Binding var model: Checkmarkable
  
  var body: some View {
        
    return Button(action: {
      self.isOn.toggle()
    }) {
      if model.isOn { OnView() }
      else { OffView() }
    }
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

struct TitleCheckbox: View {
  @Binding var isOn: Bool
  var name: String
  
  var body: some View {
    HStack {
      TitleText(color: isOn ? .appGreen : .white, text: name)
      Spacer()
      //CheckmarkBindingView(isOn: $isOn)
    }
      .frame(minHeight: 46)
  }
}

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

struct TitleCheckmarkView: View {
  @State var isOn: Bool = false
  var name: String
  
  var body: some View {
    HStack {
      TitleText(color: isOn ? .appGreen : .white, text: name)
      Spacer()
      CheckboxBindingView(isOn: $isOn)
    }
      .frame(minHeight: 46)
  }
}

struct TitleCheckmarkable: View {
  @State var model: Checkmarkable
  @State var isOn: Bool
  
  var body: some View {
    HStack {
      TitleText(color: !model.isOn ? .appGreen : .white, text: model.name)
      Spacer()
      checkmark()
    }
      .frame(minHeight: 46)
  }
  
  func checkmark() -> some View {
    CheckmarkBindingView(isOn: $isOn, model: $model)
  }
}

struct CheckboxFilterView: View {
  @EnvironmentObject var state: ClassFiltersState
  
  var index: Int {
    // But then when you change this, it's not gonna find the right index anymore!!!!!
    // So we need to get even more specific and concrete, with it, or filter on the name, rather than the entire filter, which is sad
    // because that's literally one of the reasons why I made the Filter a struct in the first place :( sad.
    //return state.editable.firstIndex(of: filter)!
    
    let filtered = state.editable.filter { $0.type == filter.type }.first!
    return state.editable.firstIndex(of: filtered)!
  }
  
  @Binding var filter: ClassFilter
  
  var body: some View {
        
    return Button(action: {
      // Ideally, instead of mutating the state, I could just mutate an individual filter and that would communicate its change back
      // This seems very wrong, because this tiny insignificant checkmark should definitely not be affecting that large state explicitly.
      //self.state.editable[self.index].isOn.toggle()
      self.filter.isOn.toggle()
      //self.state.editable[self.index].isOn.toggle()
    }) {
      if filter.isOn {
        OnView()
      } else {
        OffView()
      }
    }
  }
}

struct TitleCheckmarkFilterView: View {
  @State var filter: ClassFilter
  
  var body: some View {
    HStack {
      TitleText(color: filter.isOn ? .appGreen : .white, text: filter.type.name)
      Spacer()
      CheckboxFilterView(filter: $filter)
    }
      .frame(minHeight: 46)
  }
}

struct TitleCheckmarkFilterView2: View {
//  @EnvironmentObject var filter: FilterC
  @State var filter: FilterC
  
  var body: some View {
    HStack {
      TitleText(color: !filter.isOn ? .appGreen : .white, text: filter.type.name)
      Spacer()
    }
      .frame(minHeight: 46)
  }
}
