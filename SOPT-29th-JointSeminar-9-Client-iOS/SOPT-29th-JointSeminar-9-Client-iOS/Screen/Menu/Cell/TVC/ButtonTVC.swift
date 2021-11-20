//
//  ButtonTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit

class ButtonTVC: UITableViewCell {
    
    @IBOutlet weak var createButton: UIButton!
    
    var buttonTapped:((ButtonTVC?) -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func createBtnDidTap(_ sender: UIButton) {
        if let btnAction = self.buttonTapped {
            btnAction(self)
        }
    }
}
