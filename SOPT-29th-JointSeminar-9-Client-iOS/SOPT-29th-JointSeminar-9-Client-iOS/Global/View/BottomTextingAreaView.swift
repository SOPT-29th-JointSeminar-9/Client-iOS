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
    }
}
//MARK: - IBAction func
extension BottomTextingAreaView {
}
