//
//  ContentView.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var guessedRight: Bool = false
  
  var body: some View {
//    VStack {
//      cardObserving()
//      if guessedRight {
//        Text("Guessed righ!")
//      }
//    }
    //tableView()
//    increaseDecreaseView()
    //lotsOfButtons()
//    VStack {
//      TitleCheckmarkView(name: "iOS & Swift")
//      TitleCheckmarkView(name: "Android")
//      TitleCheckmarkView(name: "Server Side Swift")
//      TitleCheckmarkView(name: "Unity")
//    }
//      .padding([.leading, .trailing],  40)
    //FiltersView()
    
//     1. CheckmarkView()
    
//     2. let filters = FilterType.sorted
//
//    return
//      VStack(alignment: .leading, spacing: 12) {
//        ForEach(filters, id: \.self) { filter in
//          TitleCheckmarkView(name: filter.name)
//        }
//      }
//      .padding([.leading, .trailing],  40)
    
    EnvironmentFiltersView()
//    FiltersView()
  }
  
  func increaseDecreaseView() -> CounterView {
    return CounterView()
  }
  
  func tableView() -> some View {
    let nums = (1...20)
    let pairs = nums.map { ScreensaverData(id: $0, num: $0, screensaver: Screensaver()) }
    let tableView = List {
      ForEach(pairs, id: \.id) { pair in
        CellView(title: "\(pair.num)", subtitle: "My name is \(pair.num)!", screensaver: pair.screensaver)
      }
    }
    return tableView
  }
  
  func cardObserving() -> CardCallbackView {
    let card = CardCallbackView(title: "Lea", subtitle: "Marolt Sonnenschein", scrensaver: Screensaver()) { success in
      self.guessedRight = success
    }
    
    return card
  }
  
  func cardCallback() -> some View {
    var addText: Bool = false
    
    let viewModel = ViewModel(title: "Lea", subtitle: "Is amazing", callback: {
      addText = true
    }, screensaver: Screensaver())
    
    let card = CardViewModelView(viewModel: viewModel)
    
    let view = VStack {
      card
      if addText {
        Text("I WAS RIGHT!)")
      }
    }
    return view
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

