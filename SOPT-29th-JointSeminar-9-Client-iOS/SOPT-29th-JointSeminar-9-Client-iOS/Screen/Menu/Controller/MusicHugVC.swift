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
        
        let backButton = UIButton().then {
            $0.setBackgroundImage(UIImage(named: "main_ic_back"), for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
            $0.tintColor = .black
        }
        let leftItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let titleLabel = UILabel().then {
          $0.textAlignment = .center
          $0.font = UIFont.AppleSDGothicSB(size: 19)
            $0.text = "뮤직허그"
        }
        self.navigationItem.titleView = titleLabel
        
        
        let profileButton = UIButton().then {
            $0.setBackgroundImage(UIImage(named: "main_img_profile"), for: .normal)
        }
        let rightItem = UIBarButtonItem(customView: profileButton)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    //MARK: - @objc Function Part
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
