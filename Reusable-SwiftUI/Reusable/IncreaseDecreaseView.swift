//
//  IncreaseDecreaseView.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct IncreaseDecreaseView: View {
  
  @Binding var counter: Int
  
    var body: some View {
      HStack {
        Button(action: {
          self.counter += 1
        }) {
          Text("+")
        }
        
        Spacer()
        
        Button(action: {
          self.counter -= 1
        }) {
          Text("-")
        }
      }
    }
}

#if DEBUG
struct IncreaseDecreaseView_Previews: PreviewProvider {
    static var previews: some View {
      let counter = CounterView()
      let increaseDecrease = IncreaseDecreaseView(counter: counter.$counter)
      return increaseDecrease
    }
}
#endif
