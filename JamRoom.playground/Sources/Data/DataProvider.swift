import Foundation

public protocol DataProvidingProtocol {
    func fetchData(fileName: String, dataList: @escaping (JSONDictionary) -> Void)
}

public class DataProvider: DataProvidingProtocol {
    
    public init() { }
    
    public func fetchData(fileName: String, dataList: @escaping (JSONDictionary) -> Void) {
        guard let data = dataSession(fileName) else { return }
        guard let jsonData = deserializeJSON(data: data) else { return }
        dataList(jsonData)
    }
    
    func dataSession(_ filename: String) -> Data? {
        let urlPath = Bundle.main.url(forResource: filename, withExtension: "json")
        guard let url = urlPath else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func deserializeJSON(data: Data) -> JSONDictionary? {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            return jsonData as? JSONDictionary
            
        } catch {
            print("error \(error.localizedDescription)")
        }
        return nil
    }
}
