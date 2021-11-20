//
//  MyChatCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/17.
//

import UIKit
import SnapKit
import Then

class MyChatCVC: BaseCell {
    
    //MARK: Properties
    var chatBlueBackView = UIView().then {
        $0.backgroundColor = .main
    }
    
    private var myTextLabel = BasePaddingLabel().then {
        $0.font = UIFont.AppleSDGothicM(size: 14)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.letterSpacing = -0.39
        $0.paddingTop = 13
        $0.paddingLeft = 23
        $0.paddingRight = 23
        $0.paddingBottom = 13
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        myTextLabel.text = data.messageText
        sendTimeLabel.text = data.sendTime
    }
    
    //MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        chatBlueBackView.roundCorners(corners: [.topLeft, .bottomLeft, .bottomRight], radius: 10.0)
    }
}

extension MyChatCVC {
    func configureLayout() {
        self.addSubviews([chatBlueBackView, myTextLabel, sendTimeLabel])
        
        myTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(0)
            $0.trailing.equalTo(self.snp.trailing).offset(-23)
            $0.width.lessThanOrEqualTo(220)
        }
        
        chatBlueBackView.snp.makeConstraints {
            $0.top.equalTo(myTextLabel.snp.top)
            $0.leading.equalTo(myTextLabel.snp.leading)
            $0.trailing.equalTo(myTextLabel.snp.trailing)
            $0.bottom.equalTo(myTextLabel.snp.bottom)
        }
        sendTimeLabel.snp.makeConstraints {
            $0.trailing.equalTo(chatBlueBackView.snp.leading).offset(-8)
            $0.bottom.equalTo(chatBlueBackView.snp.bottom).offset(0)
        }
    }
}
