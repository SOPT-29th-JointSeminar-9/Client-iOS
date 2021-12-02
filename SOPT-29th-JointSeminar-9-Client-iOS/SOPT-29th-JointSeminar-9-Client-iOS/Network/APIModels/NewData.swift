//
//  NewData.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/12/02.
//

import Foundation

struct NewData: Codable {
    let id: Int
    let hugTitle, nickname: String
    let fanCount, listenerCount: Int
    let sentTime, musicTitle, artist: String
    let cover: String
}

// MARK: - DataModel
struct DataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let images: [String]
    let todoLists: [TodoList]
}

// MARK: - TodoList
struct TodoList: Codable {
    let id, character: Int
    let todo: String
}
