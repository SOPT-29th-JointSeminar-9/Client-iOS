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
        $0.image = UIImage(named: "chatImgMusic")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
        $0.contentMode = .scaleAspectFit
    }
    
    private var musicTitleLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicSB(size: 16)
        $0.text = "춤의왕"
        $0.textColor = .black
        $0.letterSpacing = 0.14
    }
    
    private var singerLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicR(size: 12)
        $0.text = "차세대"
        $0.textColor = .gray3
        $0.letterSpacing = 0.12
    }
    
    private var previousMusicBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcPrevious"), for: .normal)
        $0.addTarget(self, action: #selector(previousMusicBtnDidTap), for: .touchUpInside)
    }
    
    private var playPauseMusicBtn = UIButton().then {
        $0.isSelected = false
        $0.setBackgroundImage(UIImage(named: "mainIcPause"), for: .normal)
        $0.setBackgroundImage(UIImage(named: "mainIcPlay"), for: .selected)
        $0.addTarget(self, action: #selector(playPauseMusicBtnDidTap), for: .touchUpInside)
    }
    
    private var nextMusicBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcNext"), for: .normal)
        $0.addTarget(self, action: #selector(nextMusicBtnDidTap), for: .touchUpInside)
    }
    
    private var playlistBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "mainIcPlaylist"), for: .normal)
        $0.addTarget(self, action: #selector(playlistBtnDidTap), for: .touchUpInside)
    }
    
    private var playProgressView = UIProgressView().then {
        $0.progress = 0.5
        $0.tintColor = .main
    }
    
    // MARK: init
    init(frame: CGRect, state: bottomMusicBarState) {
        super.init(frame: frame)
        
        switch state {
        case .normal:
            print("normal")
            configureLayoutWhenNormal()
        case .chat:
            print("chat")
        }
        self.backgroundColor = .gray6
    }
    
    init(frame: CGRect, state: bottomMusicBarState, model: MusicHugDetailData) {
        super.init(frame: frame)
        
        switch state {
        case .normal:
            print("normal")
            configureLayoutWhenNormal()
        case .chat:
            print("chat")
            bindChatData(data: model)
            configureLayoutWhenChat()
        }
        self.backgroundColor = .gray6
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bindChatData(data: MusicHugDetailData) {
        if let url = URL(string: data.cover ?? "") {
            if let imageData = try? Data(contentsOf: url) {
                albumCoverImageView.image = UIImage(data: imageData)
            }
        }
        musicTitleLabel.text = data.musicTitle
        singerLabel.text = data.artist
    }
}

//MARK: - Layout
extension BottomMusicBarView {
    //MARK: Normal BottomMusicBarView Layout
    func configureLayoutWhenNormal() {
        self.addSubviews([musicTitleLabel, singerLabel, previousMusicBtn, playPauseMusicBtn, nextMusicBtn, playlistBtn, playProgressView])
        
        musicTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(11)
            $0.leading.equalTo(self).offset(20)
            $0.width.equalTo(180)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(musicTitleLabel.snp.bottom).offset(2)
            $0.leading.width.equalTo(musicTitleLabel)
        }
        
        playlistBtn.snp.makeConstraints {
            $0.trailing.equalTo(self).offset(-18)
            $0.height.equalTo(12)
            $0.width.equalTo(16)
            $0.centerY.equalTo(self)
        }
        
        nextMusicBtn.snp.makeConstraints {
            $0.trailing.equalTo(playlistBtn.snp.leading).offset(-25)
            $0.height.equalTo(13)
            $0.width.equalTo(playlistBtn.snp.height).multipliedBy(13.0 / 14.0)
            $0.centerY.equalTo(self)
        }
        
        playPauseMusicBtn.snp.makeConstraints {
            $0.trailing.equalTo(nextMusicBtn.snp.leading).offset(-26)
            $0.height.equalTo(20)
            $0.centerY.equalTo(self)
        }
        
        previousMusicBtn.snp.makeConstraints {
            $0.trailing.equalTo(playPauseMusicBtn.snp.leading).offset(-26)
            $0.height.equalTo(13)
            $0.centerY.equalTo(self)
        }
        
        playProgressView.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.top)
            $0.leading.trailing.equalTo(self)
            $0.height.equalTo(1.2)
        }
    }
    
    //MARK: Chat BottomMusicBarView Layout
    func configureLayoutWhenChat() {
        self.addSubviews([albumCoverImageView, musicTitleLabel, singerLabel, playPauseMusicBtn, playlistBtn, playProgressView])
        albumCoverImageView.snp.makeConstraints {
            $0.top.equalTo(self).offset(9)
            $0.leading.equalTo(self).offset(25)
            $0.height.width.equalTo(49)
        }
        
        musicTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(13)
            $0.leading.equalTo(albumCoverImageView.snp.trailing).offset(12)
            $0.width.equalTo(180)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(musicTitleLabel.snp.bottom).offset(2)
            $0.leading.width.equalTo(musicTitleLabel)
        }
        
        playlistBtn.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailing).offset(-18)
            $0.height.equalTo(12)
            $0.width.equalTo(16)
            $0.centerY.equalTo(self)
        }
        
        playPauseMusicBtn.snp.makeConstraints {
            $0.trailing.equalTo(playlistBtn.snp.leading).offset(-26)
            $0.height.equalTo(20)
            $0.width.equalTo(18)
            $0.centerY.equalTo(self)
        }
        
        playProgressView.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.top).offset(0)
            $0.leading.trailing.equalTo(self)
            $0.height.equalTo(1.2)
        }
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
        print("previousMusicBtnDidTap")
    }
    @objc func playPauseMusicBtnDidTap() {
        if playPauseMusicBtn.isSelected {
            print("playMusicBtnDidTap")
        }
        else {
            print("pauseMusicBtnDidTap")
        }
        playPauseMusicBtn.isSelected = !playPauseMusicBtn.isSelected
    }
    @objc func nextMusicBtnDidTap() {
        print("nextMusicBtnDidTap")
    }
    @objc func playlistBtnDidTap() {
        print("playlistBtnDidTap")
    }
}
