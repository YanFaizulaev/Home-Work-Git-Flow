//
//  PostJSON.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import Foundation

/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */
public class Json4Swift_Base {
    public var birth : Int?
    public var occupation : String?
    public var name : String?
    public var lastname : String?
    public var country : String?
    
    // Создали инициализатор чтобы напрямую создавать такие объекты
    init(birth: Int, occupation: String, name: String, lastname: String, country: String) {
        self.birth = birth
        self.occupation = occupation
        self.name = name
        self.lastname = lastname
        self.country = country
    }

    public class func modelsFromDictionaryArray(array:NSArray) -> [Json4Swift_Base] {
        var models:[Json4Swift_Base] = []
        for item in array {
            models.append(Json4Swift_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        birth = dictionary["birth"] as? Int
        occupation = dictionary["occupation"] as? String
        name = dictionary["name"] as? String
        lastname = dictionary["lastname"] as? String
        country = dictionary["country"] as? String
    }

    public func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.birth, forKey: "birth")
        dictionary.setValue(self.occupation, forKey: "occupation")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.lastname, forKey: "lastname")
        dictionary.setValue(self.country, forKey: "country")
        return dictionary
    }
}
