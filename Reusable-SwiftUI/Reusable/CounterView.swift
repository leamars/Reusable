//
//  CounterView.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct CounterView: View {
  
  @State var counter: Int = 0
  
  var body: some View {
    VStack {
      Text("My count is: \(counter)")
      IncreaseDecreaseView(counter: $counter)
    }
  }
}

#if DEBUG
struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView()
  }
}
#endif

