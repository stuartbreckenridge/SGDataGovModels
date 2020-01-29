# SGDataGovModels

This package (will) contains `Codable` structs and Combine `Publisher`s for each of the API endpoints supported by the [data.gov.sg](https://data.gov.sg/) portal.

## Usage

Include this Package as a dependency: `File > Swift Packages > Add Package Dependency`.

Data provided by the **National Environmental Agency** is available via the `NEAPublishers` class.

### Example

```swift

var sink: AnyCancellable!

sink = NEAPublishers.pm25.receive(on: RunLoop.main).sink(receiveCompletion: { (result) in
    switch result {
    case .failure(let err):
        // handle error
    case .finished:
        // finished
    }
}, receiveValue: { (downloadedPM25Data) in
    // do something with the data
})

```

## Implementation Status

|NEA|Implemented|Publisher|
|---|---|---|
|PM 2.5|✅|```NEAPublishers.pm25```|
|PSI|✅|```NEAPublishers.psi```|
|Real Time Weather - Air Temp|✅|```NEAPublishers.airTemperature```|
|Real Time Weather - Rainfall|✅|```NEAPublishers.rainfall```|
|Real Time Weather - Humidity|✅|```NEAPublishers.humidity```|
|Real Time Weather - Wind Direction|✅|```NEAPublishers.windDirection```|
|Real Time Weather - Wind Speed|✅|```NEAPublishers.windSpeed```|
|Ultra-violet Index|✅|```NEAPublishers.uvi```|
|Weather Forecast - 2hour|✅|```NEAPublishers.twoHourForecast```|
|Weather Forecast - 24hour|✅|```NEAPublishers.twentyFourHourForecast```|
|Weather Forecast - 4day|✅|```NEAPublishers.fourDayForecast```|
