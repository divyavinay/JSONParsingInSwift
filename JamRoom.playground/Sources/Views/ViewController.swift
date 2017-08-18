import Foundation

public class ViewController {
    let dataProvider: DataProvidingProtocol
    
  public init(dataProvider: DataProvidingProtocol = DataProvider()) {
        self.dataProvider = dataProvider
    }
    
   public func display() {
        dataProvider.fetchData(fileName: "jamRoom") { (dictionary) in
            let jamRoomDictionary = JamRooms(dictionary: dictionary)
            guard let jamRooms = jamRoomDictionary?.jamRooms else { return }
            for jamRoom in jamRooms {
                let jR = JamRoom(dictionary: jamRoom)
                print(jR ?? "No value")
                print(" ")
            }
        }
    }
}
