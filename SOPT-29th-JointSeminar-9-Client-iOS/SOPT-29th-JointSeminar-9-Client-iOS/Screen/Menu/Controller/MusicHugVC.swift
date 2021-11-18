//
//  MusicHugVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/15.
//

import UIKit
import Then

class MusicHugVC: UIViewController {
 
    //MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setNC()
    }
    
    //MARK: - UI Component Part
    
    //MARK: Navigation Tabbar
    func setNC() {
        
        //MARK: 왼쪽 버튼
        let backButton = UIButton().then {
            $0.setBackgroundImage(UIImage(named: "main_ic_back"), for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
            $0.tintColor = .black
        }
        let leftItem = UIBarButtonItem(customView: backButton)
        let leftSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                         target: nil, action: nil).then {
            $0.width = 21
        }
        navigationItem.setLeftBarButtonItems([leftSpacer, leftItem], animated: false)
        
        //MARK: 가운데 타이틀 라벨
        let titleLabel = UILabel().then {
            $0.textAlignment = .center
            $0.font = UIFont.AppleSDGothicSB(size: 19)
            $0.text = "뮤직허그"
        }
        navigationItem.titleView = titleLabel
        
        //MARK: 오른쪽 버튼
        let profileButton = UIButton().then {
            $0.setBackgroundImage(UIImage(named: "main_img_profile"), for: .normal)
        }
        let rightItem = UIBarButtonItem(customView: profileButton)
        let rightSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                          target: nil, action: nil).then {
            $0.width = 19
        }
        navigationItem.setRightBarButtonItems([rightSpacer, rightItem], animated: false)
    }
    
    //MARK: - @objc Function Part
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}
