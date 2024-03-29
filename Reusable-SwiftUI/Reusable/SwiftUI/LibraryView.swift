//
//  LibraryView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 05/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

private enum AppliedLayout {
  struct Padding {
    let overall: CGFloat = 12
    let textTrailing: CGFloat = 2
  }
  
  static let padding = Padding()
  static let cornerRadius: CGFloat = 9
  static let imageSize: CGFloat = 15
  static let filterSpacing: CGFloat = 6
  static let filtersPaddingTop: CGFloat = 12
}

struct AppliedFilterView: View {
  
  @EnvironmentObject var state: FiltersState
  var filter: Filter
  
  var body: some View {
    Button(action: {
      let index = self.state.all.firstIndex(of: self.filter)!
      self.state.all[index].isOn = false
      self.state.updateEditable()
    }) {
      HStack {
        Text(filter.type.name)
          .foregroundColor(.white)
          .font(.uiButtonLabelSmall)
          .padding([.trailing], AppliedLayout.padding.textTrailing)
        Image("closeWhite")
          .resizable()
          .frame(width: AppliedLayout.imageSize, height: AppliedLayout.imageSize)
          .foregroundColor(Color.white)
      }
        .padding(.all, AppliedLayout.padding.overall)
        .background(Color.copper)
        .cornerRadius(AppliedLayout.cornerRadius)
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 2)
    }
  }
}

enum FiltersViewType {
  case binding
  case index
  case callbacks
}

struct LibraryView: View {
  
  @EnvironmentObject var state: FiltersState
  @State var isPresented: Bool = false
  
  var type: FiltersViewType
  
  var body: some View {
    
    VStack {
      appliedFiltersView()
      
      MainButtonView(title: "Filter") {
        self.isPresented.toggle()
      }
        .sheet(isPresented: self.$isPresented) {
          self.filtersView()
        }
    }
    .padding([.leading, .trailing], 20)
  }
  
  private func filtersView() -> some View {
    
    let filtersView: AnyView
    
    switch type {
    case .binding:
      filtersView = AnyView(FiltersBindingEnumeratedView(isPresented: self.$isPresented).environmentObject(self.state))
    case .index:
      filtersView = AnyView(FiltersBindingIndexFilterView(isPresented: self.$isPresented).environmentObject(self.state))
    case .callbacks:
      filtersView = AnyView(FiltersCallbacksView(isPresented: self.$isPresented).environmentObject(self.state))
    }
    
    return BackgroundFillView(backgroundColor: .appBlack) {
      filtersView
    }
  }
  
  private func appliedFiltersView() -> some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: AppliedLayout.filterSpacing) {
        
        ForEach(state.applied, id:\.type) { filter in
          AppliedFilterView(filter: filter)
        }
      }
    }
    .padding([.top], AppliedLayout.filtersPaddingTop)
  }
}

struct BackgroundFillView<Content: View>: View {
    let backgroundColor: Color
    let content: () -> Content

    var body: some View {
        ZStack {
            self.backgroundColor.edgesIgnoringSafeArea(.all)
            self.content()
        }
    }
}
