//
//  ChatVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/14.
//

import UIKit

class ChatVC: UIViewController {
    
    private var bottomMusicView: BottomMusicBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func configureLayout() {
        guard let chatMusicPlayerVC = storyboard?.instantiateViewController(withIdentifier: Identifiers.chatMusicBottomVC) as? ChatMusicBottomVC else { return }
        
        addChild(chatMusicPlayerVC)
        chatMusicPlayerVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatMusicPlayerVC.view)
        
        chatMusicPlayerVC.view.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(180)
            $0.leading.trailing.bottom.equalTo(self.view)
        }
        chatMusicPlayerVC.didMove(toParent: self)
    }
}
