import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidData
    case errorEncountered(error: Error)
}

public protocol APIProviderInterface {
    func fetchCharacters() async -> Result<[Character], NetworkError>
}


public struct DataService: APIProviderInterface {
    public static let shared = DataService()
    

    public func fetchCharacters() async -> Result<[Character], NetworkError> {
        let url = Endpoint.getCharactersEndpoint().url
        
        guard let dataURL = url else {
            return .failure(.invalidURL)
        }
        
        do {
            let result = try await getRequest(withURL: dataURL)
            
            switch result {
            case .success(let data):
                let dataWithPagination = try JSONDecoder().decode(DataWithPagination.self, from: data)
                for character in dataWithPagination.results {
                    print(character)
                }
                return .success(dataWithPagination.results)
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(.errorEncountered(error: error))
        }
    }
}

extension DataService {
    func getRequest(withURL url: URL) async throws -> Result<Data, NetworkError> {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return .success(data)
        } catch {
            return .failure(.errorEncountered(error: error))
        }
    }
}
