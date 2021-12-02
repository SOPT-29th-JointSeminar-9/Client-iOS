//
//  MusicHugDetailData.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/30.
//

import Foundation
// MARK: - MusicHugDetailData
struct MusicHugDetailData: Codable {
    let id: Int
    let hugTitle, nickname: String
    let fanCount, listenerCount: Int
    let sentTime, musicTitle, artist: String
    let cover: String
}
