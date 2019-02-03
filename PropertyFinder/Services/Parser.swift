//
//  Parser.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import Foundation

struct Parser {

  func parseProperties(dictionary: [[String: Any]]) -> [Property] {
    return dictionary.map({ parseProperty(dictionary: $0) }).compactMap({ $0 })
  }

  // MARK: - Private

  private func parseProperty(dictionary: [String: Any]) -> Property? {
    guard let bedrooms = dictionary["bedrooms"] as? String,
      let bathrooms = dictionary["bathrooms"] as? String,
      let price = dictionary["price_value"] as? String,
      let priceLabel = dictionary["price_label"] as? String,
      let thumbnail = dictionary["thumbnail_big"] as? String,
      let image = parseImage(url: thumbnail)
      else {
        return nil
    }
    return Property.init(bedrooms: bedrooms, bathrooms: bathrooms, price: price, priceLabel: priceLabel, image: image)
  }

  private func parseImage(url: String) -> Image? {
    guard let url = URL(string: url) else { return nil }
    return Image(url: url)
  }

}
