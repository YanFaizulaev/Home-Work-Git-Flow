//
//  ModelJSON.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import Foundation
// MARK: - Работа с моделью запросом JSON

struct APIResponse: Codable {
    let searchType: SearchTypeEnum
    let expression: String
    let results: [Results]
    let errorMessage: String
}
// MARK: - Result

struct Results: Codable {
    let id: String
    let resultType: SearchTypeEnum
    let image: String
    let title, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, resultType, image, title
        case resultDescription = "description"
    }
}

enum SearchTypeEnum: String, Codable {
    case title = "Title"
}
