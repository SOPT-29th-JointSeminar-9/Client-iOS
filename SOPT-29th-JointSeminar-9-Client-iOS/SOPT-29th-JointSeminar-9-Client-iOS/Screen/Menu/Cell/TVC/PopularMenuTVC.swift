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
  var popularData: [MusicHugDetailData] = []
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    requestPopularData()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  //MARK: - Func
  
  func setupDelegate() {
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
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
    cell.setData(rank: indexPath.row, data: popularData[indexPath.row+62])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
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

//MARK: - Network

extension PopularMenuTVC {
  func requestPopularData() {
    MusicHugAPI.shared.getDataNewAPI() { [self] networkResult in
      switch networkResult {
      case .success(let res):
        if let data = res as? [MusicHugDetailData] {
          self.popularData = data
          setupDelegate()
          registerXib()
          print("success")
          collectionView.reloadData()
        }
      case .requestErr(let msg):
        if let message = msg as? String {
          print(message)
        }
      case .pathErr:
        print("pathErr")
      case .serverErr:
        print("serverErr")
      case .networkFail:
        print("networkFail")
      }
    }
  }
}
