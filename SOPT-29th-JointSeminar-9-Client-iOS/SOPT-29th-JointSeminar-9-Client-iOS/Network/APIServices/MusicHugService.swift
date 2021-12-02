//
//  MusicHugService.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/30.
//

import Foundation
import Moya

enum MusicHugService {
    case getMusicHugNewestData
    case getMusicHugPopularData
    case createMusigHugRoom(hugTitle: String, nickname: String)
    case getDetailMusicHugData(hugID: String)
}

extension MusicHugService: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getMusicHugNewestData, .createMusigHugRoom:
            return "/radio"
        case .getMusicHugPopularData:
            return "/radio/popular"
        case .getDetailMusicHugData(let hugID):
            print("/radio/\(hugID)")
            return "/radio/\(hugID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMusicHugNewestData, .getMusicHugPopularData, .getDetailMusicHugData:
            return .get
        case .createMusigHugRoom:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getMusicHugNewestData, .getMusicHugPopularData, .getDetailMusicHugData:
            return .requestPlain
        case .createMusigHugRoom(let hugTitle, let nickname):
            let body = [
                "hugTitle" : hugTitle,
                "nickname" : nickname
            ]
            return .requestJSONEncodable(body)
        }
        // ["Content-Type": "application/x-www-form-urlencoded"] -> .requestParameters(parameters: body, encoding: URLEncoding.httpBody)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
