//
//  PropertyListViewInterface.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit

protocol PropertyListViewInput: class {
  func didRefreshPropertyList()
  func appendProperty(at indexes: [IndexPath])
  func navigationController() -> UINavigationController?
}

protocol PropertyListViewOutput: class {
  func viewDidLoad()
  func reloadPropertyList()
  func loadMoreProperty()
  func propertyCount() -> Int
  func property(at index: Int) -> PropertyViewModel
  func showSort()
}
