//
//  PropertyListViewController.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit

final class PropertyListViewController: UIViewController {

  private var output: PropertyListViewOutput?

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = Style.Size.padding
    layout.minimumInteritemSpacing = Style.Size.padding
    let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    view.allowsSelection = false
    return view
  }()

  private let refreshControl = UIRefreshControl()

  init(output: PropertyListViewOutput?) {
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
    view.addSubview(collectionView)
    collectionView.backgroundColor = view.backgroundColor
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    refreshControl.addTarget(self, action: #selector(reloadDataAction), for: .valueChanged)
    collectionView.addSubview(refreshControl)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCells(for: collectionView)
    collectionView.dataSource = self
    collectionView.delegate = self
    
    let rightButtonItem = UIBarButtonItem(
      title: "Sort",
      style: .plain,
      target: self,
      action: #selector(navigateToSortAction)
    )
    navigationItem.rightBarButtonItem = rightButtonItem
    
    output?.viewDidLoad()
  }

  // MARK: - Private

  private func registerCells(for collectionView: UICollectionView) {
    for type: UICollectionViewCell.Type in [PropertyListItemCollectionViewCell.self, LoadingListItemCollectionViewCell.self] {
      collectionView.register(type, forCellWithReuseIdentifier: String(describing: type))
    }
  }

  // MARK: - Actions

  @objc private func reloadDataAction() {
    output?.reloadPropertyList()
  }
  
  @objc private func navigateToSortAction() {
    output?.showSort()
  }

}

extension PropertyListViewController: PropertyListViewInput {
  func navigationController() -> UINavigationController? {
    return self.navigationController
  }
  

  func didRefreshPropertyList() {
    refreshControl.endRefreshing()
    collectionView.reloadData()
  }

  func appendProperty(at indexes: [IndexPath]) {
    refreshControl.endRefreshing()

    collectionView.performBatchUpdates(
      {
        self.collectionView.insertItems(at: indexes)
      },
      completion: { _ in })
  }

}

extension PropertyListViewController: UICollectionViewDataSource, UICollectionViewDelegate {

  private enum PropertyListSection: Int {
    case property
    case loading
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let output = output else { return 0 }
    switch PropertyListSection(rawValue: section)! {
    case .property:
      return output.propertyCount()
    case .loading:
      return 1
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let output = output else { return UICollectionViewCell() }
    switch PropertyListSection.init(rawValue: indexPath.section)! {
    case .property:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PropertyListItemCollectionViewCell.self), for: indexPath) as! PropertyListItemCollectionViewCell
      cell.set(property: output.property(at: indexPath.row))
      return cell
    case .loading:
      return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LoadingListItemCollectionViewCell.self), for: indexPath)
    }
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard let output = output else { return }
    if indexPath.section == PropertyListSection.loading.rawValue {
      output.loadMoreProperty()
    }
  }
  
}

extension PropertyListViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height: CGFloat!
    switch PropertyListSection(rawValue: indexPath.section)! {
    case .property:
      height = 200
    case .loading:
      height = 40
    }
    return CGSize.init(width: collectionView.bounds.width, height: height)
  }

}
