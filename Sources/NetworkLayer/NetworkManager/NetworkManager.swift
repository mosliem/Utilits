


import Foundation

class NetworkManager {
    
    public static let shared = NetworkManager()
    
    private var apiClient: APIExecuter!
    private init(){}
    
    func executeRequest <ModelType: Codable> (
        with endpoint: Requsetable,
        model: ModelType.Type
    ) async throws -> ModelType {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        let result = try await apiClient.executeRequest(model: ModelType.self)
        return result
    }
    
    func executeRequest <ModelType: Encodable> (
        with endpoint: Requsetable,
        model: ModelType
    ) async throws -> Bool {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        let result = try await apiClient.executeRequestWithBody(model: model)
        return result
    }
    
    func executeMultipart(
        with endpoint: Requsetable,
        fileName: String,
        fileData: Data
    ) async throws -> Bool {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        let result = try await apiClient.executeRequest(fileName: fileName, fileData: fileData)
        return result
    }
    
    func downloadData(from endpoint: Requsetable) async throws -> Data {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        let result = try await apiClient.executeRequest()
        return result
    }
    
}
