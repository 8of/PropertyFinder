//
//  PropertySortViewController.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit

final class PropertySortViewController: UIViewController {
  
  private weak var output: PropertySortViewOutput?
  
  private let priceDescendingButton: UIButton = {
    let button = UIButton(type: .system)
    button.autoSetDimension(.height, toSize: 44)
    // In production use NSLocalizedString
    button.setTitle("Price descending", for: .normal)
    return button
  }()
  
  private let priceAscendingButton: UIButton = {
    let button = UIButton(type: .system)
    button.autoSetDimension(.height, toSize: 44)
    // In production use NSLocalizedString
    button.setTitle("Price ascending", for: .normal)
    return button
  }()
  
  private let bedsDescendingButton: UIButton = {
    let button = UIButton(type: .system)
    button.autoSetDimension(.height, toSize: 44)
    // In production use NSLocalizedString
    button.setTitle("Bedrooms descending", for: .normal)
    return button
  }()
  
  private let bedsAscendingButton: UIButton = {
    let button = UIButton(type: .system)
    button.autoSetDimension(.height, toSize: 44)
    // In production use NSLocalizedString
    button.setTitle("Bedrooms ascending", for: .normal)
    return button
  }()
  
  init(output: PropertySortViewOutput?) {
    super.init(nibName: nil, bundle: nil)
    self.output = output
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = UIColor.white
    
    priceDescendingButton.addTarget(self, action: #selector(setPriceDescendingAction), for: .touchUpInside)
    priceAscendingButton.addTarget(self, action: #selector(setPriceAscendingAction), for: .touchUpInside)
    bedsDescendingButton.addTarget(self, action: #selector(setBedsDescendingAction), for: .touchUpInside)
    bedsAscendingButton.addTarget(self, action: #selector(setBedsAscendingAction), for: .touchUpInside)
    
    let arrangedSubviews: [UIView] = [
      priceDescendingButton,
      priceAscendingButton,
      bedsDescendingButton,
      bedsAscendingButton
    ]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    stackView.axis = .vertical
    
    view.addSubview(stackView)
    stackView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
  }
  
  // MARK: - Actions
  
  @objc private func setPriceDescendingAction() {
    output?.changeSort(to: .priceDescending)
  }
  
  @objc private func setPriceAscendingAction() {
    output?.changeSort(to: .priceAscending)
  }
  
  @objc private func setBedsDescendingAction() {
    output?.changeSort(to: .bedsDescending)
  }
  
  @objc private func setBedsAscendingAction() {
    output?.changeSort(to: .bedsAscending)
  }

}
