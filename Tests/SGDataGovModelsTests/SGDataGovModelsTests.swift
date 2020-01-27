import XCTest
import Combine
@testable import SGDataGovModels

final class SGDataGovModelsTests: XCTestCase {

    func testPM25Publisher() {
        
        var sink: AnyCancellable!
        let expectation = XCTestExpectation(description: "PM2.5 Publisher")
        
        sink = NEAPublishers.pm25.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedPM25Data) in
            XCTAssert(downloadedPM25Data.items != nil)
            XCTAssert(downloadedPM25Data.items![0].readings != nil)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
        
        sink.cancel()
    }

    static var allTests = [
        ("testPM25Publisher", testPM25Publisher),
    ]
}
