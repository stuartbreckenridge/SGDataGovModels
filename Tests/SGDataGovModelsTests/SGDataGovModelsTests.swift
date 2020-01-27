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
    
    func testPSIPublisher() {
        
        var sink: AnyCancellable!
        let expectation = XCTestExpectation(description: "PSI Publisher")
        
        sink = NEAPublishers.psi.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedPSIData) in
            XCTAssert(downloadedPSIData.items != nil)
            XCTAssert(downloadedPSIData.items![0].readings != nil)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
        
        sink.cancel()
    }
    
    func testUVIndexPublisher() {
        
        var sink: AnyCancellable!
        let expectation = XCTestExpectation(description: "UV Index Publisher")
        
        sink = NEAPublishers.uvindex.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedUVIndexData) in
            XCTAssert(downloadedUVIndexData.items != nil)
            XCTAssert(downloadedUVIndexData.items![0].readings != nil)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
        
        sink.cancel()
    }

    static var allTests = [
        ("testPM25Publisher", testPM25Publisher),
        ("testPSIPublisher", testPSIPublisher),
        ("testUVIndexPublisher", testUVIndexPublisher)
    ]
}
