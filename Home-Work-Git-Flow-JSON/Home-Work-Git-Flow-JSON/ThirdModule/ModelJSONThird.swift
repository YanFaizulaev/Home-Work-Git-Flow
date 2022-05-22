//
//  ModelJSONThird.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 17.05.2022.
//

import Foundation

// MARK: - GetElement
struct Comments: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Get = [Comments]
//   let get = try? newJSONDecoder().decode(Get.self, from: jsonData)


//struct Comments: Decodable {
//    var postId: Int
//    var id: Int
//    var name: String
//    var email: String
//    var body: String
//}
