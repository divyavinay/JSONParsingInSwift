import Foundation

public struct AvailableSlots {
    let from: Int
    let to: Int
}

extension AvailableSlots: JSONDeserializable {
    public init?(dictionary: JSONDictionary) {
        guard
            let from =  dictionary["from"] as? Int,
            let to = dictionary["to"] as? Int
            else {
                return nil
        }
        
        self.from = from
        self.to = to
    }
}


