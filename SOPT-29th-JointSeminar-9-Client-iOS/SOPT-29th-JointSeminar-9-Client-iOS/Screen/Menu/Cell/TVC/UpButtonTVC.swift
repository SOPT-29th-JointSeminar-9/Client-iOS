//
//  UpButtonTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/25.
//

import UIKit

class UpButtonTVC: UITableViewCell {
  
  //MARK: - UI Component
  
  @IBOutlet weak var label: UILabel!
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setLabel()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  //MARK: - Func
  
  func setLabel() {
    label.font = UIFont.AppleSDGothicM(size: 12)
    label.textColor = .gray3
    label.text = "맨위로"
  }
}
