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
    
    func testForecastPublisher() {
        
        var twoHourSink: AnyCancellable!
        var twentyFourHourSink: AnyCancellable!
        var fourDaySink: AnyCancellable!
        
        let expectation2h = XCTestExpectation(description: "2h expectation")
        let expectation24h = XCTestExpectation(description: "24h expectation")
        let expectation4d = XCTestExpectation(description: "4d expectation")
        
        twoHourSink = NEAPublishers.twoHourForecast.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            expectation2h.fulfill()
        })
        
        twentyFourHourSink = NEAPublishers.twentyFourHourForecast.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            expectation24h.fulfill()
        })
        
        fourDaySink = NEAPublishers.fourDayForecast.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            expectation4d.fulfill()
        })
        
        wait(for: [expectation2h, expectation4d, expectation24h], timeout: 10)
        
        twoHourSink.cancel()
        twentyFourHourSink.cancel()
        fourDaySink.cancel()
        
    }

    static var allTests = [
        ("testPM25Publisher", testPM25Publisher),
        ("testPSIPublisher", testPSIPublisher),
        ("testUVIndexPublisher", testUVIndexPublisher),
        ("testForecastPublisher", testForecastPublisher)
    ]
}
