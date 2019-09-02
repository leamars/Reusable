//
//  FiltersMC.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import Foundation

class FiltersMC {
  
  private(set) var currentFilters: [Filter] = [] {
    didSet {
      if oldValue != currentFilters {
        print("Hello!")
      }
    }
  }
  
  private(set) var filters: Filters {
    didSet {
      currentFilters = filters.appliedFilters
    }
  }
  
  init() {
    self.filters = Filters()
  }
  
  func updateFilters(newFilters: Filters) {
    self.filters = newFilters
  }
}
