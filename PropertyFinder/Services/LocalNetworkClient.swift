//
//  LocalNetworkClient.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import Foundation

final class LocalNetworkClient {

}

extension LocalNetworkClient: NetworkClientInterface {

  func getPropertyList(page: Int, sort: PropertySortType, success: @escaping ([String: Any])->(), error: @escaping ()->()) {
    let urlPath = Bundle.main.url(forResource: "search", withExtension: "json")
    let data = try! Data.init(contentsOf: urlPath!)
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    success(json)
  }

}
