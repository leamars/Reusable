//
//  EnvironmentFiltersView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

struct EnvironmentFiltersView: View {

  var filters = Filters()
    
    var body: some View {
      VStack {
        
        filtersList()
          .padding([.leading, .trailing, .top], 20)
        
        applyOrCloseButton()
          .padding([.leading, .trailing], 20)
      }
    }
    
  private func applyOrCloseButton() -> some View {
  
    Text("Clear All")
      .font(.uiButtonLabel)
      .foregroundColor(.white)
      .modifier(Buttonize(type: .primary, callback: {
        print("Apply Us!")
      }))
  }
    
    private func filtersList() -> some View {
      VStack(alignment: .leading, spacing: 12) {
        
        ForEach(filters.filters, id: \.self) { filter in
          TitleCheckmarkView(name: filter.type.name)
        }
      }
    }
}
