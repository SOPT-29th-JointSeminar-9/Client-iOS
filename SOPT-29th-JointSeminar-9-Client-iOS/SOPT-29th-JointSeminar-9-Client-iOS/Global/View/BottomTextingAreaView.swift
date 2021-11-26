//
//  BottomTextingAreaView.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/18.
//

import UIKit
import SnapKit
import Then

class BottomTextingAreaView: UIView {
   
    // MARK: Properties
    private var chatShareBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chatIcShare"), for: .normal)
    }
    
    private var chatTextField = UITextField().then {
        $0.placeholder = "대화를 입력해주세요."
    }

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        self.backgroundColor = .chatBackgroundGray
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Layout
extension BottomTextingAreaView {
    //MARK: BottomTextingAreaView Layout
    func configureLayout() {
        self.addSubviews([chatShareBtn, chatTextField])
        
        chatShareBtn.snp.makeConstraints {
            $0.leading.equalTo(self).offset(25)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
            $0.centerY.equalTo(self)
        }
        
        chatTextField.snp.makeConstraints {
            $0.leading.equalTo(chatShareBtn.snp.trailing).offset(30)
            $0.width.equalTo(150)
        }
    }
}
//MARK: - IBAction func
extension BottomTextingAreaView {
}
