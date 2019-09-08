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

protocol Checkmarkable {
  var isOn: Bool { get }
  var name: String { get }
  func onChange()
}

extension Checkmarkable {
  func onChange() {
    print("Default implementation...")
  }
}

class ClassFilter: NSObject, ObservableObject, NSCopying {
  
  static func == (lhs: ClassFilter, rhs: ClassFilter) -> Bool {
    return lhs.isOn == rhs.isOn
  }
  
  override func isEqual(_ object: Any?) -> Bool {
    guard let filter = object as? ClassFilter else { return false }
    return filter.isOn == self.isOn
  }
  
  var type: FilterType
  var isOn: Bool
  
  init(type: FilterType, isOn: Bool) {
    self.type = type
    self.isOn = isOn
  }
  
  static func toClassFilters(filters: [Filter]) -> [ClassFilter] {
    return filters.map { ClassFilter(type: $0.type, isOn: $0.isOn) }
  }
  
  func copy(with zone: NSZone? = nil) -> Any {
    let copy = ClassFilter(type: type, isOn: isOn)
    return copy
  }
}

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

class ClassFiltersState: ObservableObject {
  
  @Published var applied: [ClassFilter] = []
  @Published var all: [ClassFilter] = []
  @Published var editable: [ClassFilter]
  
  var areFiltersSame: Bool {
    return all.elementsEqual(editable)
  }
  
  init()  {
    let savedFilters = UserDefaults.standard.filters
    var allFilters: [ClassFilter] =  []
    if !savedFilters.isEmpty {
      allFilters = ClassFilter.toClassFilters(filters: savedFilters)
    } else {
      allFilters = FilterType.sorted.map { ClassFilter(type: $0, isOn: false) }
    }
    self.all = allFilters.map { ClassFilter(type: $0.type, isOn: $0.isOn) }
    self.editable = allFilters.map { ClassFilter(type: $0.type, isOn: $0.isOn) }
  }
  
  func updateAllFilters() {
    all = editable.map { ClassFilter(type: $0.type, isOn: $0.isOn) }
    update()
    applied = all.filter { $0.isOn }
  }
  
  func updateEditable() {
    editable = all.map { ClassFilter(type: $0.type, isOn: $0.isOn) }
    applied = all.filter { $0.isOn }
  }
  
  func clearAll() {
    self.all = FilterType.sorted.map { ClassFilter(type: $0, isOn: false) }
    UserDefaults.standard.updateFilters(with: Filter.toFilters(classFilters: all))
  }

  func update() {
    UserDefaults.standard.updateFilters(with: Filter.toFilters(classFilters: all))
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

class FilterC {
  var type: FilterType
  var isOn: Bool
  
  init(type: FilterType, isOn: Bool) {
    self.type = type
    self.isOn = isOn
  }
  
  func enjoy() {
    var filter = Filter(type: .iOS, isOn: true)
    filter.isOn = false
  }
}

class CheckmarkableFilter: Checkmarkable {
  
  var isOn: Bool
  
  var type: FilterType
  
  var name: String {
    return type.name
  }
  
  func onChange() {
    print("I changed!")
  }
  
  func toCheckmarkable(filters: [Filter]) -> [CheckmarkableFilter] {
    return filters.map { CheckmarkableFilter(isOn: $0.isOn, type: $0.type) }
  }
  
  init(isOn: Bool, type: FilterType) {
    self.isOn = isOn
    self.type = type
  }
}

//class CheckmarkableFiltersState: ObservableObject {
//
//  @Published var applied: [CheckmarkableFilter] = []
//
//  @Published var all: [CheckmarkableFilter] = [] {
//    didSet {
//      applied = all.filter { $0.isOn.wrappedValue }
//    }
//  }
//  @Published var editable: [CheckmarkableFilter]
//
//  var areFiltersSame: Bool {
//    return all.elementsEqual(editable)
//  }
//
//  init()  {
//    let savedFilters = UserDefaults.standard.filters
//    var allFilters: [Filter] =  []
//    if !savedFilters.isEmpty {
//      allFilters = savedFilters
//    } else {
//      allFilters = FilterType.sorted.map { CheckmarkableFilter(isOn: false, type: $0) }
//    }
//    self.all = allFilters
//    self.editable = allFilters
//  }
//
//  func updateAllFilters() {
//    all = editable
//    update()
//  }
//
//  func updateEditable() {
//    editable = all
//  }
//
//  func clearAll() {
//    self.all = FilterType.sorted.map { Filter(type: $0, isOn: false) }
//    UserDefaults.standard.updateFilters(with: all)
//  }
//
//  func update() {
//    UserDefaults.standard.updateFilters(with: all)
//  }
//}

struct Filter: Hashable, Codable, Checkmarkable {
  var type: FilterType
  var isOn: Bool
  var name: String {
    return type.name
  }
  
  static func toFilters(classFilters: [ClassFilter]) -> [Filter] {
    return classFilters.map { Filter(type: $0.type, isOn: $0.isOn) }
  }
}

class Rando {
  var lea: String?
}

class Filters: ObservableObject {
  // MARK: - Properties
  
  var all: [Filter]
  
  var applied: [Filter] = []
  
  @State var random: [Filter] = []
  
  @State var arr: [FilterType] = FilterType.sorted
  @State var on1: Bool = false
  @State var off1: Bool = true
  @State var off2: Bool = false
  
  var on2: Bool = true
  var on3: Bool = true
  
  var lea: String = "Lea"
  @Published var rando: Rando = Rando()
  
  var states: [Bool] {
    return [on1, off1, off2]
  }
  
  var isOn: Bool = true {
    didSet {
      print("I was just set to \(isOn)!")
    }
  }
    
  init()  {
    let savedFilters = UserDefaults.standard.filters
    var allFilters: [Filter] = []
    if !savedFilters.isEmpty {
      allFilters = savedFilters
    } else {
      allFilters = FilterType.sorted.map { Filter(type: $0, isOn: false) }
    }
    
    self.all = allFilters
    let firstFilter = allFilters.first!
  }
  
  func removeAll() {
    self.all = FilterType.sorted.map { Filter(type: $0, isOn: false) }
    UserDefaults.standard.updateFilters(with: all)
  }
  
  func update(filter: Filter) {
    guard let index = all.firstIndex(of: filter) else { return }
    all[index].isOn.toggle()
    UserDefaults.standard.updateFilters(with: all)
  }
}
