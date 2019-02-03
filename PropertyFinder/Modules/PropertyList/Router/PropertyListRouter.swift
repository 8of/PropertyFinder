//
//  PropertyListRouter.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit

final class PropertyListRouter {
  
  func present(navigationController: UINavigationController?, sortModuleOutput: PropertySortModuleOutput) {
    let sortAssembly = PropertySortAssembly(moduleOutput: sortModuleOutput)
    navigationController?.show(sortAssembly.view, sender: nil)
  }

}
