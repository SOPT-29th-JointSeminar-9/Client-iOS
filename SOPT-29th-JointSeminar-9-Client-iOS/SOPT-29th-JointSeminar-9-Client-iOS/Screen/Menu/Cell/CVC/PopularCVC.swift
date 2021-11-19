//
//  PopularCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit

class PopularCVC: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var barUIView: UIView! //수정
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fanLabel: UILabel! //수정
    @IBOutlet weak var numofFanLabel: UILabel!
    @IBOutlet weak var listenersLabel: UILabel! //수정
    @IBOutlet weak var numofListenersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCell()
    }
    
    func setCell() {
        backView.layer.cornerRadius = 13.9
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.masksToBounds = false
        backView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backView.layer.shadowRadius = 12
        backView.layer.shadowOpacity = 0.1

        barUIView.backgroundColor = .gray1
        rankLabel.font = UIFont.AppleSDGothicB(size: 15)
        rankLabel.textColor = .main
        titleLabel.font = UIFont.AppleSDGothicM(size: 13)
        artistLabel.font = UIFont.AppleSDGothicM(size: 10)
        artistLabel.textColor = .gray3
        descriptionLabel.font = UIFont.AppleSDGothicM(size: 14)
        nameLabel.font = UIFont.AppleSDGothicM(size: 10)
        nameLabel.textColor = .gray5
        numofFanLabel.font = UIFont.AppleSDGothicB(size: 9)
        numofFanLabel.textColor = .main
        numofListenersLabel.font = UIFont.AppleSDGothicB(size: 9)
        numofListenersLabel.textColor = .main
        fanLabel.font = UIFont.AppleSDGothicM(size: 9)
        fanLabel.textColor = .gray3
        listenersLabel.font = UIFont.AppleSDGothicM(size: 9)
        listenersLabel.textColor = .gray3
    }
    
    func setData(rank: Int, data: ContentData) {
        rankLabel.text = "\(rank+1)"
        albumImageView.image = data.makeImage()
        titleLabel.text = data.title
        artistLabel.text = data.artist
        descriptionLabel.text = data.description
        nameLabel.text = data.DJname
        numofFanLabel.text = data.fans
        numofListenersLabel.text = data.listeners
    }
}
