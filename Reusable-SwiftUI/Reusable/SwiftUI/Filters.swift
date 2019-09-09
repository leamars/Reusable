//
//  Filters.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum FilterType: String, Codable, CaseIterable {
  case iOS = "iOS & Swift"
  case android = "Android"
  case serverSide = "Server Side Swift"
  case unity = "Unity"
  
  var name: String {
    return rawValue
  }
    
  static var sorted: [FilterType] {
    return [.iOS, .android, .serverSide, .unity]
  }
}

struct Filter: Hashable, Codable {
  var type: FilterType
  var isOn: Bool
  var name: String {
    return type.name
  }
}

class FiltersState: ObservableObject {
  
  @Published var applied: [Filter] = []
  
  @Published var all: [Filter] = [] {
    didSet {
      applied = all.filter { $0.isOn }
    }
  }
  @Published var editable: [Filter]
  
  var areFiltersSame: Bool {
    return all.elementsEqual(editable)
  }
  
  init()  {
    let savedFilters = UserDefaults.standard.filters
    var allFilters: [Filter] =  []
    if !savedFilters.isEmpty {
      allFilters = savedFilters
    } else {
      allFilters = FilterType.sorted.map { Filter(type: $0, isOn: false) }
    }
    self.all = allFilters
    self.editable = allFilters
  }
  
  func updateAllFilters() {
    all = editable
    update()
  }
  
  func updateEditable() {
    editable = all
  }
  
  func clearAll() {
    self.all = FilterType.sorted.map { Filter(type: $0, isOn: false) }
    UserDefaults.standard.updateFilters(with: all)
  }

  func update() {
    UserDefaults.standard.updateFilters(with: all)
  }
}
