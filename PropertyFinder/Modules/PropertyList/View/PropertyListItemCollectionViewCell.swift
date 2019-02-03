//
//  PropertyListItemCollectionViewCell.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit
import PureLayout
import AlamofireImage

final class PropertyListItemCollectionViewCell: UICollectionViewCell {

  let padding: CGFloat = Style.Size.padding

  private let coverImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .scaleToFill
    view.isOpaque = true
    view.backgroundColor = UIColor.white
    return view
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont.boldSystemFont(ofSize: 16)
    return label
  }()

  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Style.Color.grey
    contentView.backgroundColor = backgroundColor
    coverImageView.backgroundColor = backgroundColor

    contentView.addSubview(coverImageView)
    titleLabel.backgroundColor = backgroundColor
    contentView.addSubview(titleLabel)
    descriptionLabel.backgroundColor = backgroundColor
    contentView.addSubview(descriptionLabel)

    coverImageView.autoPinEdge(toSuperviewEdge: .leading)
    coverImageView.autoPinEdge(toSuperviewEdge: .top)
    coverImageView.autoPinEdge(toSuperviewEdge: .trailing)

    titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: padding)
    titleLabel.autoPinEdge(.top, to: .bottom, of: coverImageView, withOffset: padding)
    titleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: padding)

    descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: padding)
    descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel)
    descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: padding)
    descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: padding)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    coverImageView.image = nil
  }

  func set(property: PropertyViewModel) {
    coverImageView.af_setImage(withURL: property.image)
    titleLabel.text = property.title
    descriptionLabel.text = property.description
  }
    
}
