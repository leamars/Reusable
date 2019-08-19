//
//  Font+Extensions.swift
//  Reusable
//
//  Created by Lea on 18/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import SwiftUI

extension Font {
  static var uiBodyAppleDefault: Font {
    return Font.body
  }
  static var uiButtonLabel: Font {
    return Font.system(size: 15.0).bold()
  }
  static var uiBodyCustom: Font {
    return Font.system(size: 15.0)
  }
  static var uiLabel: Font {
    return Font.system(size: 14.0).weight(.semibold)
  }
  static var uiButtonLabelSmall: Font {
    return Font.system(size: 13.0).weight(.semibold)
  }
  static var uiFootnote: Font {
    return Font.footnote
  }
  static var uiCaption: Font {
    return Font.system(size: 12.0)
  }
  static var uiUppercase: Font {
    return Font.system(size: 11.0).weight(.bold)
  }
}

