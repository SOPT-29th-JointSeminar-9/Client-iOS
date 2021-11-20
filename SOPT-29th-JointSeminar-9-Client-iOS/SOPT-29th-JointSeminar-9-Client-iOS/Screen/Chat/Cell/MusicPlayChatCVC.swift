//
//  MusicPlayChatCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/17.
//

import UIKit
import SnapKit
import Then

class MusicPlayChatCVC: BaseCell {
    
    //MARK: Properties
    var chatBlueBackView = UIView().then {
        $0.backgroundColor = UIColor.main
    }
    
    private var musicAlbumCoverImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private var playingMusicTextLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicR(size: 14)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.letterSpacing = -0.39
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
    }
    
    private var sendTimeLabel = UILabel().then {
        $0.font = UIFont.AppleSDGothicM(size: 11)
        $0.textColor = .gray3
        $0.sizeToFit()
    }
    
    //MARK: init
    func setupViews(model: MessageData) {
        bind(data: model)
        configureLayout()
    }
    
    func bind(data: MessageData) {
        musicAlbumCoverImageView.image = UIImage(named: "chatImgMusic")
        playingMusicTextLabel.text = data.messageText
        sendTimeLabel.text = data.sendTime
    }
    
    //MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        chatBlueBackView.roundCorners(corners: [.topLeft, .bottomLeft, .bottomRight], radius: 10.0)
    }
}
//MARK: - Layout
extension MusicPlayChatCVC {
    func configureLayout() {
        self.addSubviews([chatBlueBackView, musicAlbumCoverImageView, playingMusicTextLabel, sendTimeLabel])
        
        chatBlueBackView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.lessThanOrEqualTo(self.snp.leading).offset(142)
            $0.trailing.equalTo(self.snp.trailing).offset(-17)
        }
        
        musicAlbumCoverImageView.snp.makeConstraints {
            $0.top.equalTo(chatBlueBackView.snp.top).offset(12)
            $0.leading.equalTo(chatBlueBackView.snp.leading).offset(15)
            $0.height.equalTo(49)
            $0.width.equalTo(musicAlbumCoverImageView.snp.height)
        }
        
        playingMusicTextLabel.snp.makeConstraints {
            $0.top.equalTo(chatBlueBackView.snp.top).offset(20)
            $0.leading.equalTo(musicAlbumCoverImageView.snp.trailing).offset(11)
            $0.trailing.equalTo(chatBlueBackView.snp.trailing).offset(-15)
            $0.bottom.equalTo(chatBlueBackView.snp.bottom).offset(-20)
        }
        
        sendTimeLabel.snp.makeConstraints {
            $0.trailing.equalTo(chatBlueBackView.snp.leading).offset(-8)
            $0.bottom.equalTo(chatBlueBackView.snp.bottom).offset(0)
        }
    }
}
