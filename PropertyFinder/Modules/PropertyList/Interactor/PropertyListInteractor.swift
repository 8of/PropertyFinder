//
//  PropertyListInteractor.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import Foundation

final class PropertyListInteractor {

  var sort: PropertySortType = .bedsDescending
  var output: PropertyListInteractorOutput?
  private var propertyListService = PropertyListService(networkClient: LocalNetworkClient()) // Use NetworkClient() for network
  private var loading = false
  private var emptyItemsBeforeAppending = false
  private var currentPage = 0
  private var items: [Property] = []

}

extension PropertyListInteractor: PropertyListInteractorInput {

  func reloadPropertyList() {
    currentPage = 0
    emptyItemsBeforeAppending = true
    getMoreProperty()
  }

  func getMoreProperty() {
    if loading {
      return
    }
    loading = true
    propertyListService.getPropertyList(
      page: currentPage,
      sort: sort,
      success: {
        [weak self]
        propertyList in
        guard let `self` = self else { return }
        if self.emptyItemsBeforeAppending {
          self.items = []
        }
        self.emptyItemsBeforeAppending = false
        self.items.append(contentsOf: propertyList)
        self.loading = false
        self.output?.got(propertyCount: propertyList.count, refresh: self.currentPage == 0)
        self.currentPage += 1
      }, error: {
        [weak self] in
        self?.loading = false
      }
    )
  }

  func propertyCount() -> Int {
    return items.count
  }

  func property(at index: Int) -> Property {
    return items[index]
  }

}

extension PropertyListInteractor: PropertySortModuleOutput {

  func changeSort(to: PropertySortType) {
    sort = to
    reloadPropertyList()
  }
  
}
