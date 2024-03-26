

import Foundation

class Containter {
    
    static let shared = Containter()
    
    private init(){}
    
    func injectApiClient(with endpoint: Requsetable) -> APIExecuter {
        
        let urlBuilder: URLBuildable = URLBuilder(
            endpoint: endpoint
        )
        let requestBuilder: RequestBuildable = RequestBuilder(endpoint: endpoint)
        
        let apiClient: APIExecuter = APIClient(
            endpoint: endpoint,
            urlBuilder: urlBuilder,
            requestBuilder: requestBuilder
        )
        
        return apiClient
    }
}
