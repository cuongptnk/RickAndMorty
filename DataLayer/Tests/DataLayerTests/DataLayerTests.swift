import XCTest
@testable import DataLayer

final class DataLayerTests: XCTestCase {
    func testExample() throws {
        let url: URL = Endpoint.getCharactersEndpoint().url!
        
        XCTAssertEqual(url.absoluteString, "https://rickandmortyapi.com/api/character?page=1")
        
    }
}
