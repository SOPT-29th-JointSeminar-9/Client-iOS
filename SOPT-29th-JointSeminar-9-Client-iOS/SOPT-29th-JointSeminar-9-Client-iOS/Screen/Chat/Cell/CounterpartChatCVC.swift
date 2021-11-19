//
//  CounterpartChatCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/17.
//

import UIKit
import SnapKit
import Then

class CounterpartChatCVC: BaseCell {
    
    //MARK: Properties
    private var profileBorderView = UIImageView().then {
        $0.layer.cornerRadius = 22
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.main.cgColor
    }
    
    private var profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private var nicknameLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicSB(size: 14)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var chatWhiteBackView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var couterpartTextLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicM(size: 14)
        $0.textColor = .chatTextGray
        $0.textAlignment = .left
        //        $0.letterSpacing = -0.39
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
    }
    
    private var sendTimeLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicM(size: 11)
        $0.textColor = .gray3
        $0.sizeToFit()
    }
    
    //MARK: init
    func setupViews(model: MessageData) {
        bind(data: model)
        configureLayout()
    }
    
    func bind(data: MessageData) {
        profileImageView.image = UIImage(named: "chatImgProfile")
        nicknameLabel.text = data.nickname
        couterpartTextLabel.text = data.messageText
        sendTimeLabel.text = data.sendTime
    }
    
    //MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        chatWhiteBackView.roundCorners(corners: [.topRight, .bottomLeft, .bottomRight], radius: 10.0)
    }
}
//MARK: - Layout
extension CounterpartChatCVC {
    func configureLayout() {
        self.addSubviews([profileBorderView, profileImageView, nicknameLabel, chatWhiteBackView, couterpartTextLabel, sendTimeLabel])
        
        profileBorderView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading).offset(17)
            $0.height.equalTo(44)
            $0.width.equalTo(profileBorderView.snp.height).multipliedBy(1.0 / 1.0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(34)
            $0.width.equalTo(profileImageView.snp.height).multipliedBy(1.0 / 1.0)
            $0.centerX.equalTo(profileBorderView)
            $0.centerY.equalTo(profileBorderView)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileBorderView.snp.top).offset(10)
            $0.leading.equalTo(profileBorderView.snp.trailing).offset(7)
        }
        
        chatWhiteBackView.snp.makeConstraints {
            let viewSize = couterpartTextLabel.intrinsicContentSize
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nicknameLabel.snp.leading)
            if viewSize.width + 46 > 216 {
                $0.trailing.equalTo(self.snp.trailing).offset(-144)
            }
        }
        
        couterpartTextLabel.snp.makeConstraints {
            $0.top.equalTo(chatWhiteBackView.snp.top).offset(12)
            $0.leading.equalTo(chatWhiteBackView.snp.leading).offset(23)
            $0.trailing.equalTo(chatWhiteBackView.snp.trailing).offset(-23)
            $0.bottom.equalTo(chatWhiteBackView.snp.bottom).offset(-12)
        }
        
        sendTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(chatWhiteBackView.snp.trailing).offset(8)
            $0.bottom.equalTo(chatWhiteBackView.snp.bottom).offset(0)
        }
    }
}