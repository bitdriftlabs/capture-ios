import Foundation
import Benchmark
import Capture

private let kLogMessage = "50 characters long test message - 0123456789012345"

final class BenchmarkRunner {
    private(set) var runner: Benchmark.BenchmarkRunner

    init() {
        let configurationSuite = BenchmarkSuite(name: "Configuration")
        configurationSuite.register(benchmark: ConfigurationBenchmark())

        let suites = [
            configurationSuite,
            kLogBenchmark,
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

    // MARK: AnyBenchmark

    let name = "Warm Configuration"
    let settings: [Benchmark.BenchmarkSetting] = [Iterations(1)]

    func setUp() {}

    func run(_: inout Benchmark.BenchmarkState) throws {
        Logger.configure(
            withAPIKey: "123",
            sessionStrategy: .fixed()
        )
    }

    func tearDown() {
        Thread.sleep(forTimeInterval: 5.0)
    }
}

private let kLogBenchmark = BenchmarkSuite(name: "Logging") { suite in
    suite.benchmark("log without fields", settings: [WarmupIterations(10), Iterations(120)]) {
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

    suite.benchmark("log with 5 fields", settings: [WarmupIterations(10), Iterations(120)]) {
        Logger.log(
            level: .info,
            message: kLogMessage,
            file: nil,
            line: nil,
            function: nil,
            fields: [
                "keykeykey0": "valvalval0",
                "keykeykey2": "valvalval1",
                "keykeykey3": "valvalval2",
                "keykeykey4": "valvalval3",
                "keykeykey5": "valvalval4",
            ],
            error: nil
        )
    }

    suite.benchmark("log with 10 fields", settings: [WarmupIterations(10), Iterations(120)]) {
        Logger.log(
            level: .info,
            message: kLogMessage,
            file: nil,
            line: nil,
            function: nil,
            fields: [
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
            ],
            error: nil
        )
    }
}
