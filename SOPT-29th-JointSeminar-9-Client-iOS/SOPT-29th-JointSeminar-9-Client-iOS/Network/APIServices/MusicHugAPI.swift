//
//  MusicHugAPI.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/30.
//

import Foundation
import Moya

class MusicHugAPI {
    static let shared = MusicHugAPI()
    var userProvider = MoyaProvider<MusicHugService>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    //MARK: API
    /// [POST] 뮤직허그 방 생성
    func createMusicHugAPI(hugTitle: String, nickname: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        userProvider.request(.createMusigHugRoom(hugTitle: hugTitle, nickname: nickname)) { [self] result in
            switch result {
                
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                completion(createMusicHugJudgeData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    /// [GET] 뮤직허그 세부 정보 조회
    func getDetailMusicHugAPI(hugID: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        userProvider.request(.getDetailMusicHugData(hugID: hugID)) { [self] result in
            switch result {
            
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                completion(getDetailMusicHugJudgeData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
  /// [GET] 최신순
  func getDataNewAPI(completion: @escaping (NetworkResult<Any>) -> (Void)) {
    userProvider.request(.getMusicHugNewestData) { [self] result in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        completion(getHomeMusicHugJudgeData(status: statusCode, data: data))
      case .failure(let err):
        print(err)
      }
    }
  }
  
  /// [GET] 인기순
  func getDataNowPopularAPI(completion: @escaping (NetworkResult<Any>) -> (Void)) {
    userProvider.request(.getMusicHugPopularData) { [self] result in
      switch result {
      case .success(let response):
        let statusCode = response.statusCode
        let data = response.data
        completion(getHomeMusicHugJudgeData(status: statusCode, data: data))
      case .failure(let err):
        print(err)
      }
    }
  }
    
    //MARK: judgeData
    ///  뮤직허그 방 생성 JudgeData
    func createMusicHugJudgeData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<String>.self, from: data) else {
            return .pathErr }
        
        switch status {
        case 201:
            return .success(decodedData.data ?? "None-Data")
        case 400...500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    /// 뮤직허그 세부 정보 조회 JudgeData
    func getDetailMusicHugJudgeData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<MusicHugDetailData>.self, from: data) else {
            return .pathErr }
        
        switch status {
        case 200:
            return .success(decodedData.data ?? "None-Data")
        case 400...500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    /// 뮤직허그 홈 정보 조회 JudgeData
    func getHomeMusicHugJudgeData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[MusicHugDetailData]>.self, from: data) else {
            return .pathErr }
        
        switch status {
        case 200:
            return .success(decodedData.data ?? "None-Data")
        case 400...500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
