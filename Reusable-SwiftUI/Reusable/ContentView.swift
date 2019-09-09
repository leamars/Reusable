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
    return LibraryView().environmentObject(FiltersState())
  }
}

