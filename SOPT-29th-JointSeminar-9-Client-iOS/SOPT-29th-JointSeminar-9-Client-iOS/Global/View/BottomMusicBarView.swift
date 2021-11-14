//
//  BottomMusicBarView.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/15.
//

import UIKit
import SnapKit
import Then

enum bottomMusicBarState {
    case normal
    case chat
}

class BottomMusicBarView: UIView {
    
    // MARK: Properties
    private var albumCoverImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private var musicTitleLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicSB(size: 14)
        $0.textColor = .black
        $0.letterSpacing = 0.14
    }
    
    private var singerLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicR(size: 12)
        $0.textColor = .gray3
        $0.letterSpacing = 0.12
    }
    
    private var previousMusicBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcPrevious"), for: .normal)
    }
    
    private var playPauseMusicBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcPause"), for: .normal)
    }
    
    private var nextMusicBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcNext"), for: .normal)
    }
    
    private var playlistBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcPlaylist"), for: .normal)
    }
    
    private var playProgressView = UIProgressView().then {
        $0.tintColor = .main
    }
    
    // MARK: init
    init(frame: CGRect, state: bottomMusicBarState) {
        super.init(frame: frame)
        
        switch state {
        case .normal:
            print("normal")
            configureUIWhenNormal()
        case .chat:
            print("chat")
            configureUIWhenChat()
        }
        self.backgroundColor = .gray6
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Layout
extension BottomMusicBarView {
    func configureUIWhenNormal() {
        
    }
    
    func configureUIWhenChat() {
        
    }
}

//MARK: - Custom func
extension BottomMusicBarView {
    func musicLinkProgressView() {
        
    }
}

//MARK: - IBAction func
extension BottomMusicBarView {
    @objc func previousMusicBtnDidTap() {
        
    }
    @objc func playMusicBtnDidTap() {
        
    }
    @objc func pauseMusicBtnDidTap() {
        
    }
    @objc func nextMusicBtnDidTap() {
        
    }
    @objc func playlistBtnDidTap() {
        
    }
}
