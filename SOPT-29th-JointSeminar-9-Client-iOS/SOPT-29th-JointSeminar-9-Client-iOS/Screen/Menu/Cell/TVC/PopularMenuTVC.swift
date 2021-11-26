//
//  PopularMenuTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit

class PopularMenuTVC: UITableViewCell {
  
  //MARK: - UI Component
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    registerXib()
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  //MARK: - Func
  
  func registerXib() {
    let xibName = UINib(nibName: Identifiers.popularCVC, bundle: nil)
    collectionView.register(xibName, forCellWithReuseIdentifier: Identifiers.popularCVC)
  }
}

//MARK: - Extension : UICollectionViewDataSource

extension PopularMenuTVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.popularCVC, for: indexPath) as? PopularCVC else {
      return UICollectionViewCell()
    }
    cell.setData(rank: indexPath.row, data: popularContentList[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return popularContentList.count
  }
}

//MARK: - Extension : UICollectionViewDelegateFlowLayout

extension PopularMenuTVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 225, height: 310)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
