//
//  Router.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit.UIViewController

final class Router {

  func setupRootViewController(on viewController: UIViewController?) {
    guard let navigationController = viewController as? UINavigationController else {
      assert(viewController is UINavigationController, "Should be UINavigationController")
      return;
    }
    let assembly = PropertyListAssembly()
    navigationController.viewControllers = [assembly.view]
  }

}
