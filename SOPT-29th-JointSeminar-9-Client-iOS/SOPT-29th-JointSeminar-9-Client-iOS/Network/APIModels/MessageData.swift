//
//  MessageData.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/17.
//

import UIKit

enum ChatType {
    case music
    case counterpart
    case me
}

struct MessageData {
    var chatType: ChatType
    var albumCoverImageName: String
    var messageText: String
    var profileImageName: String
    var nickname: String
    var sendTime: String
    
    func makeImage(_ imageName: String) -> UIImage? {
        return UIImage(named: imageName)
    }
}

var musicHugChatData :[MessageData] = [
    MessageData(chatType: .music, albumCoverImageName: "chatImgMusic", messageText: "♫ '춤의왕_차세대' \n재생됩니다. ", profileImageName: "", nickname: "", sendTime: "오후 07:57"),
    MessageData(chatType: .counterpart, albumCoverImageName: "", messageText: "안녕하세요", profileImageName: "chatImgProfile", nickname: "mezinee", sendTime: "오후 07:57"),
    MessageData(chatType: .me, albumCoverImageName: "", messageText: "반갑습니다!!!", profileImageName: "", nickname: "", sendTime: "오후 07:58"),
    MessageData(chatType: .counterpart, albumCoverImageName: "", messageText: "들어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요 ㅎㅎ어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요 ㅎㅎ들어주셔서 감사해요들어주셔서 감사해요", profileImageName: "chatImgProfile", nickname: "mezinee", sendTime: "오후 07:59"),
    MessageData(chatType: .me, albumCoverImageName: "", messageText: "들어주셔서 감사해요 ㅎㅎ", profileImageName: "", nickname: "", sendTime: "오후 07:59"),
    MessageData(chatType: .me, albumCoverImageName: "", messageText: "들어주셔서 감사해요 ㅎㅎ", profileImageName: "", nickname: "", sendTime: "오후 07:59"),
    MessageData(chatType: .me, albumCoverImageName: "", messageText: "들어주셔서 감사해요 ㅎㅎ", profileImageName: "", nickname: "", sendTime: "오후 07:59")
]
