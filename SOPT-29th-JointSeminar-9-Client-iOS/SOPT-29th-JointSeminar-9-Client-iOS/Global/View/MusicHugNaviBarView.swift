//
//  MusicHugNaviBarView.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/17.
//

import UIKit
import SnapKit
import Then

class MusicHugNaviBarView: UIView {
    
    // MARK: Properties
    private var chatDownBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chatIcDown"), for: .normal)
        $0.addTarget(self, action: #selector(chatDownBtnDidTap), for: .touchUpInside)
    }
    
    private var chatNaviTitleLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicM(size: 15)
        //        $0.text = "나만의 뮤직허그 방명"
        $0.textColor = .black
        $0.letterSpacing = 0.12
    }
    
    private var chatSearchBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chatIcSearch"), for: .normal)
    }
    
    private var chatHambugerBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chatIcHambuger"), for: .normal)
    }
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        self.backgroundColor = .chatBackgroundGray
    }
    
    func setNaviRoomTitle(roomTitle: String) {
        chatNaviTitleLabel.text = roomTitle
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
//MARK: - Layout
extension MusicHugNaviBarView {
    //MARK: MusicHugNaviBarView Layout
    func configureLayout() {
        self.addSubviews([chatDownBtn, chatNaviTitleLabel, chatSearchBtn, chatHambugerBtn])
        
        chatDownBtn.snp.makeConstraints {
            $0.top.equalTo(self).offset(67)
            $0.leading.equalTo(self).offset(20)
            $0.height.equalTo(9)
            $0.width.equalTo(chatDownBtn.snp.height).multipliedBy(18.0 / 9.0)
        }
        
        chatNaviTitleLabel.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.centerX.equalTo(self)
            $0.centerY.equalTo(chatDownBtn)
        }
        
        chatHambugerBtn.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerY.equalTo(chatDownBtn)
            $0.height.equalTo(12)
            $0.width.equalTo(chatHambugerBtn.snp.height).multipliedBy(17.0 / 12.0)
        }
        
        chatSearchBtn.snp.makeConstraints {
            $0.trailing.equalTo(chatHambugerBtn.snp.leading).offset(-22)
            $0.centerY.equalTo(chatDownBtn)
            $0.height.equalTo(18)
            $0.width.equalTo(chatSearchBtn.snp.height).multipliedBy(1.0 / 1.0)
        }
    }
}
//MARK: - IBAction func
extension MusicHugNaviBarView {
    @objc func chatDownBtnDidTap() {
        NotificationCenter.default.post(name: .pushedChatDown, object: nil)
    }
}
