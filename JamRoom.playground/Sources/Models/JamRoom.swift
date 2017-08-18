import Foundation

public struct JamRoom {
    let name: String
    let owner: String
    let phone: String
    let email: String
    let price: String
    let imageURL: String
    let address: JSONDictionary
    let availableSlots: [JSONDictionary]
}


extension JamRoom: JSONDeserializable {
    
    public init?(dictionary: JSONDictionary) {
        guard
            let name = dictionary["name"] as? String,
            let owner = dictionary["Owner"] as? String,
            let phone = dictionary["phone"] as? String,
            let email = dictionary["email"] as? String,
            let price = dictionary["Price"] as? String,
            let imageURL = dictionary["imageUrl"] as? String,
            let address = dictionary["address"] as? JSONDictionary,
            let availableSlots = dictionary["availableSlots"] as? [JSONDictionary]
            else {
                return nil
        }
        self.name = name
        self.owner = owner
        self.price = price
        self.phone = phone
        self.email = email
        self.imageURL = imageURL
        self.address = address
        self.availableSlots = availableSlots
    }
}

