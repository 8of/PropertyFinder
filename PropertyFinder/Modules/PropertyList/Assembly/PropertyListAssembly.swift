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

  init() {
    let interactor = PropertyListInteractor()
    let viewModelFabric = PropertyViewModelFabric()
    let presenter = PropertyListPresenter(interactor: interactor, viewModelFabric: viewModelFabric, router: PropertyListRouter(), sortModuleOutput: interactor)
    view = PropertyListViewController(output: presenter)
    presenter.userInterface = view
    interactor.output = presenter
  }

  func setupAsRoot(on navigationController: UINavigationController) {
    navigationController.viewControllers = [view]
  }

}
