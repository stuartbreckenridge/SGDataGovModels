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

|NEA|Implemented|
|---|---|
|PM 2.5|✅|
|PSI|✅|
|Real Time Weather - Air Temp||
|Real Time Weather - Rainfall||
|Real Time Weather - Humidity||
|Real Time Weather - Wind Direction||
|Real Time Weather - Wind Speed||
|Ultra-violet Index|✅|
|Weather Forecast - 2hour|✅|
|Weather Forecast - 24hour|✅|
|Weather Forecast - 4day|✅|
