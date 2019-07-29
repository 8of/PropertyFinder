//
//  PropertyListPresenter.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import Foundation

final class PropertyListPresenter {

  weak var userInterface: PropertyListViewInput?

  private let interactor: PropertyListInteractorInput
  private let sortModuleOutput: PropertySortModuleOutput
  private let viewModelFabric: PropertyViewModelFabric
  private let router: PropertyListRouter

  init(interactor: PropertyListInteractorInput, viewModelFabric: PropertyViewModelFabric, router: PropertyListRouter, sortModuleOutput: PropertySortModuleOutput) {
    self.interactor = interactor
    self.viewModelFabric = viewModelFabric
    self.router = router
    self.sortModuleOutput = sortModuleOutput
  }

}

extension PropertyListPresenter: PropertyListViewOutput {

  func reloadPropertyList() {
    interactor.reloadPropertyList()
  }

  func loadMoreProperty() {
    interactor.getMoreProperty()
  }

  func viewDidLoad() {
    interactor.reloadPropertyList()
  }

  func propertyCount() -> Int {
    return interactor.propertyCount()
  }

  func property(at index: Int) -> PropertyViewModel {
    return viewModelFabric.propertyViewModel(from: interactor.property(at: index))
  }
  
  func showSort() {
    self.router.present(navigationController: userInterface?.navigationController(), sortModuleOutput: self.sortModuleOutput)
  }

}

extension PropertyListPresenter: PropertyListInteractorOutput {

  func got(propertyCount: Int, refresh: Bool) {
    if refresh {
      userInterface?.didRefreshPropertyList()
    } else {
      let startIndex = interactor.propertyCount() - propertyCount
      let endIndex = interactor.propertyCount()
      let indexes = (startIndex ..< endIndex).map({IndexPath.init(row: $0, section: propertySection())})
      userInterface?.appendProperty(at: indexes)
    }
  }

  private func propertySection() -> Int {
    return 0;
  }

}
