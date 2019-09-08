//
//  EnvironmentFiltersView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct EnvironmentFiltersView: View {
  
  @EnvironmentObject var filters: Filters
  
  var body: some View {
        
    return VStack {
      
      Toggle(isOn: $filters.isOn) {
        Text("Hello")
      }
      .onTapGesture {
        print("Hello")
      }
      
//      filtersList()
//        .padding([.leading, .trailing, .top], 20)
      
      applyOrCloseButton()
        .padding([.leading, .trailing], 20)
        .padding([.top], 40)
    }
  }
  
  private func applyOrCloseButton() -> MainButtonView {
    //let title = filters.appliedFilters != filtersMC.currentFilters ? "Apply" : "Close"
    return MainButtonView(title: "Close", type: .primary) {
      print("Apply Pressed!")
    }
  }
  
//  private func filtersList() -> some View {
//
//    return VStack(alignment: .leading, spacing: 12) {
//
//      ForEach(filters.filters, id: \.self) { filter in
//        TitleCheckmarkBindingView(isOn: self.$filters.isOn, name: filter.type.name)
//      }
//    }
//  }
}

struct CheckboxFilter: View  {
  @Binding var isOn: Bool
  
  var body: some View {
    
    Button(action: {
      self.isOn.toggle()
    }) {
      if isOn {
        onView()
      } else {
        offView()
      }
    }
  }
  
  private func onView() -> some View {
    ZStack(alignment: .center) {
      Rectangle()
        .frame(maxWidth: outerSide, maxHeight: outerSide)
        .foregroundColor(.appGreen)
      
      Image("checkmark")
        .resizable()
        .frame(maxWidth: imageWidth, maxHeight: imageHeight)
        .foregroundColor(.white)
    }
    .cornerRadius(radiusRatio * innerSide)
  }
  
  private func offView() -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: outerRadius)
      .frame(maxWidth: outerSide, maxHeight: outerSide)
      .foregroundColor(Color.coolGrey)
      
      RoundedRectangle(cornerRadius: radiusRatio * innerSide)
      .frame(maxWidth: innerSide, maxHeight: innerSide)
      .foregroundColor(.white)
    }
  }
}
