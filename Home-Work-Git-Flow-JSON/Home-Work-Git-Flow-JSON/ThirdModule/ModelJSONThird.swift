//
//  ModelJSONThird.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 17.05.2022.
//

import Foundation

// MARK: - GetComments
struct Comments: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
