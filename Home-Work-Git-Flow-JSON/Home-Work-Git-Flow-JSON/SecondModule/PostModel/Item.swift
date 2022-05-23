//
//  Item.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import Foundation

struct Item : Codable {
    let birth: Int?
    let occupation: String?
    let name: String?
    let lastName: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case birth = "birth"
        case occupation = "occupation"
        case name = "name"
        case lastName = "lastName"
        case country = "country"
    }
    
    init(birth: Int, occupation: String, name: String, lastName: String, country: String) {
        self.birth = birth
        self.occupation = occupation
        self.name = name
        self.lastName = lastName
        self.country = country
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        birth = try values.decodeIfPresent(Int.self, forKey: .birth)
        occupation = try values.decodeIfPresent(String.self, forKey: .occupation)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        country = try values.decodeIfPresent(String.self, forKey: .country)
    }
}
