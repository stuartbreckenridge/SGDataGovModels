# SGDataGovModels

This package contains the necessary structs and `Publisher`s for each of the NEA API endpoints supported by the [data.gov.sg](https://data.gov.sg/) portal.

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

