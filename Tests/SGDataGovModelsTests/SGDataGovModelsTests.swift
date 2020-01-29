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
    
    func testRealTimeWeatherPublishers() {
        
        var air: AnyCancellable!
        var humidity: AnyCancellable!
        var rainfall: AnyCancellable!
        var windDirection: AnyCancellable!
        var windSpeed: AnyCancellable!
        
        let airExpection = XCTestExpectation(description: "air expectation")
        let humidityExpection = XCTestExpectation(description: "humidity expectation")
        let rainfallExpection = XCTestExpectation(description: "rainfall expectation")
        let wdExpection = XCTestExpectation(description: "wd expectation")
        let wsExpection = XCTestExpectation(description: "ws expectation")
        
        air = NEAPublishers.airTemperature.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            airExpection.fulfill()
        })
        
        humidity = NEAPublishers.humidity.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            humidityExpection.fulfill()
        })
        
        rainfall = NEAPublishers.rainfall.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            rainfallExpection.fulfill()
        })
        
        windDirection = NEAPublishers.windDirection.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            wdExpection.fulfill()
        })
        
        windSpeed = NEAPublishers.windSpeed.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
            switch result {
            case .failure(let err):
                XCTFail(err.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { (downloadedForecast) in
            XCTAssert(downloadedForecast.items != nil)
            XCTAssert(downloadedForecast.items!.count > 0)
            wsExpection.fulfill()
        })
        
        wait(for: [airExpection, humidityExpection, rainfallExpection, wdExpection, wsExpection], timeout: 10)
        
        air.cancel()
        humidity.cancel()
        rainfall.cancel()
        windDirection.cancel()
        windSpeed.cancel()
        
    }

    static var allTests = [
        ("testPM25Publisher", testPM25Publisher),
        ("testPSIPublisher", testPSIPublisher),
        ("testUVIndexPublisher", testUVIndexPublisher),
        ("testForecastPublisher", testForecastPublisher),
        ("testRealTimeWeatherPublishers", testRealTimeWeatherPublishers)
    ]
}
