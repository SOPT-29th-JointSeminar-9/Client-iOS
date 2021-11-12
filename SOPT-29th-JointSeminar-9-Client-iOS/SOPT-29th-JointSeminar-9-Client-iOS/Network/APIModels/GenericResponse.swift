//
//  GenericResponse.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/12.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
    
}
