


import Foundation
import Combine

public class NetworkManager {
    
    public static let shared = NetworkManager()
    
    private var apiClient: APIExecuter!
    private init(){}
    
    public func executeRequest <ModelType: Codable> (
        with endpoint: Requsetable,
        model: ModelType.Type,
        body: [String: Any]
    )  -> AnyPublisher<ModelType, APIError> {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        return apiClient.executeRequest(model: ModelType.self, body: body)
    }
    
    public func executeRequest<APIResponse: Codable>(
        endpoint: Requsetable,
        data: [String: (MultiPartFormDataType, Any)],
        model: APIResponse.Type
    ) -> AnyPublisher <APIResponse, APIError> {
        apiClient = Containter.shared.injectApiClient(with: endpoint)
        return apiClient.executeRequest(data: data, model: model)
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
