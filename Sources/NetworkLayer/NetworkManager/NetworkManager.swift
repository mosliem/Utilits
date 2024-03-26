


import Foundation
import Combine

class NetworkManager {
    
    public static let shared = NetworkManager()
    
    private var apiClient: APIExecuter!
    private init(){}
    
    public func executeRequest <ModelType: Codable> (
        with endpoint: Requsetable,
        model: ModelType.Type,
        body: [String: String]
    )  -> AnyPublisher<ModelType, APIError> {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        return apiClient.executeRequest(model: ModelType.self, body: body)
    }
    
    public func executeMultipart <ModelType: Codable>(
        with endpoint: Requsetable,
        fileName: String,
        fileData: Data,
        model: ModelType.Type
    ) -> AnyPublisher<ModelType, APIError>  {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        return apiClient.executeRequest(fileName: fileName, fileData: fileData, model: model)
    }
}
