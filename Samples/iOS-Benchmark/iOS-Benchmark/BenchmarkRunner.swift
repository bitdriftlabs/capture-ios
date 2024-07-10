import Benchmark
import Capture
import Foundation

private let kLogMessage = "50 characters long test message - 0123456789012345"

final class BenchmarkRunner {
    private(set) var runner: Benchmark.BenchmarkRunner

    init(apiKey: String) {
        let configurationSuite = BenchmarkSuite(name: "Configuration")
        configurationSuite.register(benchmark: ConfigurationBenchmark(apiKey: apiKey))

        let suites = [
            configurationSuite,
            makeLoggingBenchmark(),
        ]

        self.runner = Benchmark.BenchmarkRunner(
            suites: suites,
            settings: [],
            customDefaults: defaultSettings
        )
    }

    func run() {
        try? self.runner.run()
    }
}

final class ConfigurationBenchmark: AnyBenchmark {
    private var logger: Logger?

    private let apiKey: String

    // MARK: AnyBenchmark

    let name = "Configuration"
    let settings: [Benchmark.BenchmarkSetting] = [Iterations(1)]

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func setUp() {}

    func run(_: inout Benchmark.BenchmarkState) throws {
        Logger.configure(
            withAPIKey: self.apiKey,
            sessionStrategy: .fixed()
        )
    }

    func tearDown() {
        // Give the Logger time to fetch the remove configuration and enter it's "normal" operation mode
        // before moving to benchmarking logging performance.
        Thread.sleep(forTimeInterval: 5.0)
    }
}

private func makeLoggingBenchmark() -> BenchmarkSuite {
    BenchmarkSuite(name: "Logging") { suite in
        suite.benchmark("log without fields", settings: [Iterations(512)]) {
            Logger.log(
                level: .info,
                message: kLogMessage,
                file: nil,
                line: nil,
                function: nil,
                fields: nil,
                error: nil
            )
        }

        suite.benchmark("PAUSE - IGNORE", settings: [Iterations(1), Quiet(true)])
            { Thread.sleep(forTimeInterval: 1) }

        let fields5 = [
            "keykeykey0": "valvalval0",
            "keykeykey2": "valvalval1",
            "keykeykey3": "valvalval2",
            "keykeykey4": "valvalval3",
            "keykeykey5": "valvalval4",
        ]

        suite.benchmark("log with 5 fields", settings: [Iterations(512)]) {
            Logger.log(
                level: .info,
                message: kLogMessage,
                file: nil,
                line: nil,
                function: nil,
                fields: fields5,
                error: nil
            )
        }

        suite.benchmark("PAUSE - IGNORE", settings: [Iterations(1), Quiet(true)])
            { Thread.sleep(forTimeInterval: 1) }

        suite.benchmark("log with 10 fields", settings: [Iterations(512)]) {
            let fields10 = [
                "keykeykey0": "valvalval0",
                "keykeykey1": "valvalval1",
                "keykeykey2": "valvalval2",
                "keykeykey3": "valvalval3",
                "keykeykey4": "valvalval4",
                "keykeykey5": "valvalval5",
                "keykeykey6": "valvalval6",
                "keykeykey7": "valvalval7",
                "keykeykey8": "valvalval8",
                "keykeykey9": "valvalval9",
            ]

            Logger.log(
                level: .info,
                message: kLogMessage,
                file: nil,
                line: nil,
                function: nil,
                fields: fields10,
                error: nil
            )
        }
    }
}
