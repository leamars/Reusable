//
//  AppliedFilterView.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 03/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

//enum AppliedFilterType {
//  case `default`
//  case destructive
//  
//  var color: Color {
//    switch self {
//    case .default:
//      return .brightGrey
//    case .destructive:
//      return .copper
//    }
//  }
//}
//
//private enum Layout {
//  struct Padding {
//    let overall: CGFloat = 12
//    let textTrailing: CGFloat = 2
//  }
//  
//  static let padding = Padding()
//  static let cornerRadius: CGFloat = 9
//  static let imageSize: CGFloat = 15
//}
//
//// TODO: Should make this more reuse-friendly
//struct AppliedFilterView: View {
//  
//  @EnvironmentObject var filters: Filters
//  private var filter: Filter?
//  private var type: AppliedFilterType
//  private var name: String?
//  private var filtersUpdateCallback: () -> Void
//  
//  init(filter: Filter? = nil, type: AppliedFilterType, name: String? = nil, filtersDidUpdate: @escaping () -> Void) {
//    self.filter = filter
//    self.type = type
//    self.name = name
//    self.filtersUpdateCallback = filtersDidUpdate
//  }
//  
//  var body: some View {
//    Button(action: {
//      // If there's no filter passed through, it's a destructive one that should clear all, so we init a new Filters object
//      if let filter = self.filter {
//        filter.isOn.toggle()
//        self.filters.filters.update(with: filter)
//        self.filters.commitUpdates()
//      } else {
//        self.filters.removeAll()
//      }
//      self.filtersUpdateCallback()
//    }) {
//      HStack {
//        Text(filter?.filterName ?? name ?? "None")
//          .foregroundColor(.white)
//          .font(.uiButtonLabelSmall)
//          .padding([.trailing], Layout.padding.textTrailing)
//        Image("closeWhite")
//          .resizable()
//          .frame(width: Layout.imageSize, height: Layout.imageSize)
//          .foregroundColor(.white)
//      }
//      .padding(.all, Layout.padding.overall)
//        .background(type.color)
//        .cornerRadius(Layout.cornerRadius)
//        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 2)
//    }
//  }
//}
