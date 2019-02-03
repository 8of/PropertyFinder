//
//  NetworkClientInterface.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

protocol NetworkClientInterface: class {
  func getPropertyList(page: Int, sort: PropertySortType, success: @escaping ([String: Any])->(), error: @escaping ()->())
}
