//
//  ContentView.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    cardObserving()
    //tableView()
    //increaseDecreaseView()
    //lotsOfButtons()
  }
  
  func lotsOfButtons() -> AnyView {
    let buttons = VStack(spacing: 20) {
      
      MainButtonView(title: "Sign In", type: .primary(withArrow: true)) {
        print("Sign In")
      }
      
      MainButtonView(title: "Done", type: .secondary(withArrow: true)) {
        print("Done")
      }
      
      MainButtonView(title: "Cancel", type: .destructive(withArrow: true)) {
        print("Cancel")
      }
      
      MainButtonView(title: "Sign In", type: .primary(withArrow: false)) {
        print("Sign In")
      }
      
      MainButtonView(title: "Done", type: .secondary(withArrow: false)) {
        print("Done")
      }
      
      MainButtonView(title: "Cancel", type: .destructive(withArrow: false)) {
        print("Cancel")
      }
    }
    .padding([.leading, .trailing], 20)
    
    return AnyView(buttons)
  }
  
  func increaseDecreaseView() -> AnyView {
    return AnyView(CounterView())
  }
  
  func tableView() -> AnyView {
    let nums = (1...20)
    let pairs = nums.map { ScreensaverData(id: $0, num: $0, screensaver: Screensaver()) }
    let tableView = List {
      ForEach(pairs, id: \.id) { pair in
        CellView(title: "\(pair.num)", subtitle: "My name is \(pair.num)!", screensaver: pair.screensaver)
      }
    }
    return AnyView(tableView)
  }
  
  func cardObserving() -> AnyView {
    let card = CardObservingView(title: "Lea", subtitle: "Marolt Sonnenschein", screensaver: Screensaver())
    return AnyView(card)
  }
  
  func cardCallback() -> AnyView {
    var addText: Bool = false
    
    let viewModel = ViewModel(title: "Lea", subtitle: "Is amazing", callback: {
      addText = true
    }, screensaver: Screensaver())
    
    let card = CardCallbackView(viewModel: viewModel)
    
    let view = VStack {
      card
      if addText {
        Text("I WAS RIGHT!)")
      }
    }
    return AnyView(view)
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

