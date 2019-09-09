//
//  Layout.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

enum Layout {
  struct Padding {
    let overall: CGFloat = 12
    let textTrailing: CGFloat = 2
  }

  static let padding = Padding()
  static let cornerRadius: CGFloat = 9
  static let imageSize: CGFloat = 15
}
