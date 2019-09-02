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

enum FilterType: String, Codable {
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
}

class Filters: ObservableObject {
  // MARK: - Properties
  private(set) var objectWillChange = PassthroughSubject<Void, Never>()
  
  private (set) var filters: [Filter] {
    didSet {
      objectWillChange.send(())
    }
  }
  
  var appliedFilters: [Filter] {
    return filters.filter { $0.isOn }
  }
  
  init()  {
    let savedFilters = UserDefaults.standard.filters
    if !savedFilters.isEmpty {
      self.filters = savedFilters
    } else {
      self.filters = FilterType.sorted.map { Filter(type: $0, isOn: false) }
    }
  }
  
  func removeAll() {
    self.filters = FilterType.sorted.map { Filter(type: $0, isOn: false) }
  }
  
  func update(filter: Filter) {
    guard let index = filters.firstIndex(of: filter) else { return }
    filters[index].isOn.toggle()
    UserDefaults.standard.updateFilters(with: filters)
  }
}
