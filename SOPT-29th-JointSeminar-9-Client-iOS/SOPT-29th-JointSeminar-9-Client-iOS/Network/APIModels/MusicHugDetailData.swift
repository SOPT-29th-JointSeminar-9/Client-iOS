//
//  MusicHugDetailData.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/30.
//

import Foundation
struct MusicHugDetailData: Codable {
    let id: Int
    let hugTitle, nickname: String
    let fanCount, listenerCount: Int
    let sentTime: String
    let musicTitle, artist: String
    let cover: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case hugTitle = "hugTitle"
        case nickname = "nickname"
        case fanCount = "fanCount"
        case listenerCount = "listenerCount"
        case sentTime = "sentTime"
        case musicTitle = "musicTitle"
        case artist = "artist"
        case cover = "cover"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(Int.self, forKey: .id)) ?? -1
        hugTitle = (try? values.decode(String.self, forKey: .hugTitle)) ?? ""
        nickname = (try? values.decode(String.self, forKey: .nickname)) ?? ""
        fanCount = (try? values.decode(Int.self, forKey: .fanCount)) ?? -1
        listenerCount = (try? values.decode(Int.self, forKey: .listenerCount)) ?? -1
        sentTime = (try? values.decode(String.self, forKey: .sentTime)) ?? ""
        musicTitle = (try? values.decode(String?.self, forKey: .musicTitle)) ?? "주민이 짱"
        artist = (try? values.decode(String?.self, forKey: .artist)) ?? "임주민"
        cover = (try? values.decode(String?.self, forKey: .cover)) ?? "https://firebasestorage.googleapis.com/v0/b/wesopt29-29f3e.appspot.com/o/image%2Fjoint-seminar%2Fwhy_akmu.jpg?alt=media&token=ebb64c21-638e-49b5-8c3c-d03c2f38654c"
    }
}
