//
//  PropertySortAssembly.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit.UIViewController

protocol PropertySortModuleOutput: PropertySortViewOutput {
}

final class PropertySortAssembly {
  
  let view: PropertySortViewController
  private weak var presenter: PropertySortPresenter?

  init(moduleOutput: PropertySortModuleOutput?) {
    let presenter = PropertySortPresenter(moduleOutput: moduleOutput)
    self.presenter = presenter
    view = PropertySortViewController(output: moduleOutput)
  }

}
