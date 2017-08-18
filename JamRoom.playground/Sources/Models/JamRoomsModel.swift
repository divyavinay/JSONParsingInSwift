import Foundation

public typealias JSONDictionary = [String: AnyObject]

public protocol JSONDeserializable {
    init?(dictionary: JSONDictionary)
}

public struct JamRooms {
    public let jamRooms: [JSONDictionary]
}

extension JamRooms: JSONDeserializable {
    public init?(dictionary: JSONDictionary) {
        guard
            let jamRooms = dictionary["jamrooms"] as? [JSONDictionary]
            else {
                return nil
        }
        
        self.jamRooms = jamRooms
    }
}
