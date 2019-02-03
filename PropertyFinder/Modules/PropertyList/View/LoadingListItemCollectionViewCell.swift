//
//  LoadingListItemCollectionViewCell.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit

final class LoadingListItemCollectionViewCell: UICollectionViewCell {

  let activity: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .gray)
    view.hidesWhenStopped = false
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    activity.startAnimating()
    contentView.addSubview(activity)
    activity.autoCenterInSuperview()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    activity.startAnimating()
  }
    
}
