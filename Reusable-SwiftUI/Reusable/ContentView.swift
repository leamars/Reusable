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
    // 1: @State, to manage own view
    //CheckboxView()
    
    // 2: @State <> @Binding, to communicate between views
    //TitleCheckboxView(isOn: true, name: "I 💛 Swift!")
    //  .padding([.leading, .trailing], 40)
    
    // 3: @EnvironmentObject + @Binding
    //LibraryView(type: .binding).environmentObject(FiltersState())
    
    // 4: @EnvironmentObject + @Binding + passing Index
    LibraryView(type: .index).environmentObject(FiltersState())
    
    // 5: @EnvironmentObject + callbacks
    //return LibraryView().environmentObject(FiltersState())
  }
}

