//
//  Screensaver.swift
//  Reusable
//
//  Created by Lea on 19/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import Combine
import SwiftUI
import UIKit

struct ScreensaverData: Identifiable {
  var id: Int
  let num: Int
  let screensaver: Screensaver
}

class Screensaver: NSObject, ObservableObject {
  private(set) var objectWillChange = PassthroughSubject<Void, Never>()
  
  static let colors: [Color] = [.appGreen, .paleBlue, .pumpkinOrange, .copper, .blueGrey]
  var counter: Int
  var selectedColor: Color {
    didSet {
      objectWillChange.send()
    }
  }
  
  var timer = Timer()
  
  init(color: Color) {
    self.counter = 0
    self.selectedColor = color
    super.init()
  }
  
  override init() {
    self.counter = 0
    self.selectedColor = Screensaver.colors[self.counter]
    super.init()
    createTimer()
  }
  
  private func createTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setNewColor), userInfo: nil, repeats: true)
    //timer!.fire()
  }
  
  @objc private func setNewColor() {
    counter += 1
    counter = counter % Screensaver.colors.count
    selectedColor = Screensaver.colors[counter]
  }
}
