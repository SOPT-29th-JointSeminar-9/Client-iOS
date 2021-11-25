//
//  NewTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/25.
//

import UIKit

class NewTVC: UITableViewCell {
  
  // MARK: - UIComponent
  
  @IBOutlet weak var numberOfListenerLabel: UILabel!
  @IBOutlet weak var titleAndArtistLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var numberOfFanLabel: UILabel!
  @IBOutlet weak var albumImage: UIImageView!
  @IBOutlet weak var listenerLabel: UILabel!
  @IBOutlet weak var nameDJLabel: UILabel!
  @IBOutlet weak var fanLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setCell()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  // MARK: - Custom Func Method
  
  func setCell() {
    numberOfListenerLabel.font = UIFont.AppleSDGothicB(size: 9)
    titleAndArtistLabel.font = UIFont.AppleSDGothicB(size: 11)
    descriptionLabel.font = UIFont.AppleSDGothicB(size: 14)
    numberOfFanLabel.font = UIFont.AppleSDGothicB(size: 9)
    listenerLabel.font = UIFont.AppleSDGothicB(size: 9)
    nameDJLabel.font = UIFont.AppleSDGothicB(size: 9)
    fanLabel.font = UIFont.AppleSDGothicB(size: 9)
    
    numberOfListenerLabel.textColor = .main
    titleAndArtistLabel.textColor = .gray4
    numberOfFanLabel.textColor = .main
    listenerLabel.textColor = .gray3
    nameDJLabel.textColor = .gray3
    fanLabel.textColor = .gray3
  }
  
  func setData(data: ContentData) {
    descriptionLabel.text = data.description
    titleAndArtistLabel.text = "\(data.title) - \(data.artist)"
    nameDJLabel.text = data.DJname
    numberOfFanLabel.text = data.fans
    numberOfListenerLabel.text = data.listeners
  }
}
