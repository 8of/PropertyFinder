//
//  PropertyListInteractorInterface.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import Foundation

protocol PropertyListInteractorInput: class {
  func reloadPropertyList()
  func getMoreProperty()
  func propertyCount() -> Int
  func property(at index: Int) -> Property
}

protocol PropertyListInteractorOutput: class {
  func got(propertyCount: Int, refresh: Bool)
}
