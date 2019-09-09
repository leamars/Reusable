//
//  UserDefaults+Extensions.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import Foundation

enum UserDefaultsType: String {
  case filters
}

extension UserDefaults {
  
  var filters: [Filter] {
    guard let filterDataArray = UserDefaults.standard.object(forKey: UserDefaultsType.filters.rawValue) as? [Data] else {
      return []
    }
    
    let decoder  = JSONDecoder()
    let decodedFilterArray = filterDataArray.compactMap { try? decoder.decode(Filter.self, from: $0) }
    return decodedFilterArray
  }
  
  func updateFilters(with newFilters: [Filter]) {
    let encoder  = JSONEncoder()
    
    var encodedFilterArray: [Data] = []
    for filter in newFilters {
      let encodedFilter = try? encoder.encode(filter)
      encodedFilterArray.append(encodedFilter!)
    }
    
    set(encodedFilterArray, forKey: UserDefaultsType.filters.rawValue)
  }
}
