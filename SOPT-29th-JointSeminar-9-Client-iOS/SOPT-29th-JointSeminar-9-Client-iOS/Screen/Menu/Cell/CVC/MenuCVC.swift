//
//  MenuCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/18.
//

import UIKit

class MenuCVC: UICollectionViewCell {
    
    let label = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.AppleSDGothicSB(size: 14)
        $0.textColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setData(pageName: String) {
        label.text = "\(pageName)"
    }
    
    override var isSelected: Bool {
        didSet{
            self.label.textColor = isSelected ? .black : .gray2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
