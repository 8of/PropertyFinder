//
//  PropertyListAssembly.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit.UIViewController

final class PropertyListAssembly {

  let view: PropertyListViewController
  private weak var presenter: PropertyListViewOutput?
  private weak var interactor: AnyObject?

  init() {
    let interactor = PropertyListInteractor()
    let viewModelFabric = PropertyViewModelFabric()
    self.interactor = interactor
    let presenter = PropertyListPresenter(interactor: interactor, viewModelFabric: viewModelFabric, router: PropertyListRouter(), sortModuleOutput: interactor)
    self.presenter = presenter
    view = PropertyListViewController(output: presenter)
    presenter.userInterface = view
    interactor.output = presenter
  }

  func setupAsRoot(on navigationController: UINavigationController) {
    navigationController.viewControllers = [view]
  }

}
