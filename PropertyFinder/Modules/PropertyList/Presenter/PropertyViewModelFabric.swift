//
//  PropertyViewModelFabric.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit

final class PropertyViewModelFabric {

  func propertyViewModel(from property: Property) -> PropertyViewModel {
    let title = "\(property.price) \(property.priceLabel)"
    // NSLOcalizedString + StringsDict in real project
    let bathroomsDescription = property.bathrooms == "1" ? "1 Bathroom" : "\(property.bathrooms) Bathrooms"
    let bedroomsDescription = property.bathrooms == "1" ? "1 Bedroom" : "\(property.bathrooms) Bedrooms"
    let description = "\(bathroomsDescription) \(bedroomsDescription)"
    return PropertyViewModel.init(title: title, description:  description, image: property.image.url)
  }

}
