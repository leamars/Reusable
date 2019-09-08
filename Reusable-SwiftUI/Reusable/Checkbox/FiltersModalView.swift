//
//  FiltersModalView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

//struct FiltersModalView: View {
//
//  @Binding var isPresented: Bool
//  var filters = Filters()
//  
//  var body: some View {
//    VStack {
//      
//      HStack(alignment: .center) {
//        
//        Rectangle()
//          .frame(width: 27, height: 27, alignment: .center)
//          .foregroundColor(.clear)
//          .padding([.leading], 18)
//        
//        Spacer()
//        
//        Text("Filters")
//          .font(.uiBodyAppleDefault)
//          .foregroundColor(.appBlack)
//        
//        Spacer()
//        
//        Button(action: {
//          self.isPresented = false
//        }) {
//          Image("close")
//            .frame(width: 27, height: 27, alignment: .center)
//            .padding(.trailing, 18)
//            .foregroundColor(.battleshipGrey)
//        }
//      }
//      .padding(.top, 20)
//      
//      filtersList()
//      .padding([.leading, .trailing, .top], 20)
//      
//      HStack {
//        
//        Text("Clear All")
//          .font(.uiButtonLabel)
//          .foregroundColor(.white)
//          .modifier(Buttonize(type: .secondary, callback: {
//            self.isPresented = false
////            self.filters.removeAll()
//          }))
//          .padding([.trailing], 10)
//
//        applyOrCloseButton()
//      }
//      .padding([.leading, .trailing], 18)
//    }
//    .background(Color.paleGrey)
//  }
//  
//  private func applyOrCloseButton() -> MainButtonView {
//    
////    let equalSets = Set(contentsMC.currentParameters) == Set(filters.appliedParameters)
////    let title = equalSets ? "Close" : "Apply"
//    
//    return MainButtonView(title: "Apply", type: .primary) {
//      self.isPresented = false
//    }
//  }
//  
//  private func filtersList() -> some View {
//
//    let scrollView = ScrollView(.vertical, showsIndicators: false) {
//      VStack(alignment: .leading, spacing: 12) {
//        
//        ForEach(filters.filters, id: \.self) { filter in
//          TitleCheckmarkView(name: filter.type.name)
//        }
//      }
//    }
//    return scrollView
//  }
//}


