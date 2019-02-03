//
//  PropertyListService.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import Foundation

final class PropertyListService {

  private let networkClient: NetworkClientInterface!
  private let parser = Parser()

  init(networkClient: NetworkClientInterface) {
    self.networkClient = networkClient
  }

  private init() {
    networkClient = nil
  }

  func getPropertyList(page: Int, sort: PropertySortType, success: @escaping ([Property])->(), error: @escaping ()->()) {
    networkClient.getPropertyList(
      page: page,
      sort: sort,
      success: {
        [weak self]
        dictionary in
        guard let `self` = self, let res = dictionary["res"] as? [[String: Any]] else {
          error()
          return
        }
        let list = self.parser.parseProperties(dictionary: res)
        success(list)
      }, error: error
    )
  }

}
