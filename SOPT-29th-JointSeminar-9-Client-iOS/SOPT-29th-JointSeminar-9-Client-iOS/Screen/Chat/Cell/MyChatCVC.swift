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
    
    private var myTextLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicM(size: 14)
        $0.textColor = .white
        $0.textAlignment = .left
        //        $0.letterSpacing = -0.39
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
        
        chatBlueBackView.snp.makeConstraints {
            let viewSize = myTextLabel.intrinsicContentSize
            $0.top.equalTo(self.snp.top)
            $0.trailing.equalTo(self.snp.trailing).offset(-17)
            if viewSize.width + 46 > 216 {
                $0.trailing.equalTo(self.snp.trailing).offset(-144)
            }
        }
        
        myTextLabel.snp.makeConstraints {
            $0.top.equalTo(chatBlueBackView.snp.top).offset(12)
            $0.leading.equalTo(chatBlueBackView.snp.leading).offset(23)
            $0.trailing.equalTo(chatBlueBackView.snp.trailing).offset(-23)
            $0.bottom.equalTo(chatBlueBackView.snp.bottom).offset(-12)
        }
        
        sendTimeLabel.snp.makeConstraints {
            $0.trailing.equalTo(chatBlueBackView.snp.leading).offset(-8)
            $0.bottom.equalTo(chatBlueBackView.snp.bottom).offset(0)
        }
    }
}
