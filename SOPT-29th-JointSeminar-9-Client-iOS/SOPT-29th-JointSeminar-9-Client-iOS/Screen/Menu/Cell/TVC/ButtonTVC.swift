//
//  ButtonTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit

class ButtonTVC: UITableViewCell {
    
    @IBOutlet weak var createButton: UIButton!
   
    @IBAction func touchUpToCrateVC(_ sender: Any) {
     
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}