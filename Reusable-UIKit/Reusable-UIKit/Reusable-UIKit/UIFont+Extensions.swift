//
//  UIFont+Extensions.swift
//  Reusable-UIKit
//
//  Created by Lea on 19/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import UIKit

extension UIFont {
  static var uiLargeTitle: UIFont {
    return UIFont(name: "Bitter-Bold", size: 34.0)!
  }
  static var uiTitle1: UIFont {
    return UIFont(name: "Bitter-Bold", size: 28.0)!
  }
  static var uiTitle2: UIFont {
    return UIFont(name: "Bitter-Bold", size: 22.0)!
  }
  static var uiTitle3: UIFont {
    return UIFont(name: "Bitter-Bold", size: 20.0)!
  }
  static var uiTitle4: UIFont {
    return UIFont(name: "Bitter-Bold", size: 17.0)!
  }
  static var uiHeadline: UIFont {
    return UIFont(name: "Bitter-Regular", size: 17.0)!
  }
  static var uiBodyAppleDefault: UIFont {
    return UIFont.systemFont(ofSize: 17.0, weight: .regular)
  }
  static var uiButtonLabel: UIFont {
    return UIFont.systemFont(ofSize: 15.0, weight: .bold)
  }
  static var uiBodyCustom: UIFont {
    return UIFont.systemFont(ofSize: 15.0, weight: .regular)
  }
  static var uiLabel: UIFont {
    return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
  }
  static var uiButtonLabelSmall: UIFont {
    return UIFont.systemFont(ofSize: 13.0, weight: .semibold)
  }
  static var uiFootnote: UIFont {
    return UIFont.systemFont(ofSize: 13.0, weight: .regular)
  }
  static var uiCaption: UIFont {
    return UIFont.systemFont(ofSize: 12.0, weight: .regular)
  }
  static var uiUppercase: UIFont {
    return UIFont.systemFont(ofSize: 11.0, weight: .medium)
  }
}

