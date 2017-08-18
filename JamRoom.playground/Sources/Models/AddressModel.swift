import Foundation

public struct Address {
    let city: String
    let zip: String
}

extension Address: JSONDeserializable {
   public init?(dictionary: JSONDictionary) {
        guard
            let city =  dictionary["city"] as? String,
            let zip = dictionary["Zip"] as? String
            else {
                return nil
        }
        
        self.city = city
        self.zip = zip
    }
}
