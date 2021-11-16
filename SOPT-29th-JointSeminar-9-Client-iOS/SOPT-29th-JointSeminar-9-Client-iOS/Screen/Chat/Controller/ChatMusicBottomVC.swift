//
//  ChatMusicBottomVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/16.
//

import UIKit
import SnapKit
import Then

class ChatMusicBottomVC: UIViewController {
    
    private var bottomMusicView: BottomMusicBarView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initBottomMusicView()
        configureLayout()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        bottomMusicView?.addGestureRecognizer(tap)
    }
    
    func initBottomMusicView() {
        bottomMusicView = BottomMusicBarView(frame: self.view.frame, state: .chat)
    }
    
    func configureLayout() {
        self.view.addSubview(bottomMusicView ?? UIView())
        bottomMusicView?.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view).offset(0)
            $0.height.equalTo(70)
        }
    }
    
    //MARK: BottomMusicBarView에 Tap Gesture 발생 시 실행되는 함수
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
    
        // MusicPlayerVC로 이동하게끔 코드 변경 필요
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: Identifiers.heartVC) as? HeartVC else { return }
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
