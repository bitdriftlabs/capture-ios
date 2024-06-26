import SwiftUI

/// Provide the your bitdrift Capture API key here.
private let kApiKey = ""

enum BenchmarkState {
    case initial(apiKey: String)
    case running
    case completed
}

extension BenchmarkState {
    var title: String {
        switch self {
        case let .initial(apiKey) where apiKey.isEmpty:
            "Enter your API Key in ContentView.swift"
        case .initial:
            "Run benchmark!"
        case .running:
            "Running..."
        case .completed:
            "Restart the app to run benchmark again"
        }
    }

    var isRunningBenchmarkEnabled: Bool {
        switch self {
        case let .initial(apiKey) where !apiKey.isEmpty:
            return true
        default:
            return false
        }
    }

    func createBenchmark() -> BenchmarkRunner? {
        switch self {
        case let .initial(apiKey) where !apiKey.isEmpty:
            return BenchmarkRunner(apiKey: apiKey)
        default:
            return nil
        }
    }
}

struct ContentView: View {
    @State var state: BenchmarkState = .initial(apiKey: kApiKey)

    var body: some View {
        VStack {
            Button(self.state.title) {
                guard self.state.isRunningBenchmarkEnabled else {
                    return
                }

                guard let benchmark = state.createBenchmark() else {
                    return print("unexpected state")
                }

                self.state = .running
                benchmark.run()
                self.state = .completed
            }
            .disabled(!self.state.isRunningBenchmarkEnabled)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
