//
//  ChatHeaderCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/18.
//

import UIKit
import SnapKit
import Then

class ChatHeaderCVC: BaseCell {
    
    //MARK: Properties
    private var musichugBeginLabel = UILabel().then {
        $0.text = "지니의 재생목록으로 뮤직허그가 시작되었습니다."
        $0.textColor = .gray3
        $0.font = UIFont.AppleSDGothicM(size: 12)
        $0.sizeToFit()
        $0.letterSpacing = -0.36
    }
    private var musichugWarningLabel = UILabel().then {
        $0.text = "채팅 내용은 별도 저장되지 않으며,\n욕설·혐오·비방 표현은 제재될 수 있습니다."
        $0.textColor = .gray3
        $0.font = UIFont.AppleSDGothicM(size: 12)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.sizeToFit()
        $0.letterSpacing = -0.36
    }

    //MARK: init
    override func setupViews() {
        configureLayout()
    }
}
//MARK: - Layout
extension ChatHeaderCVC {
    func configureLayout() {
        self.addSubviews([musichugBeginLabel, musichugWarningLabel])
        
        musichugBeginLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(30)
            $0.centerX.equalTo(self)
        }
        
        musichugWarningLabel.snp.makeConstraints {
            $0.top.equalTo(musichugBeginLabel.snp.bottom).offset(15)
            $0.centerX.equalTo(self)
        }
    }
}
