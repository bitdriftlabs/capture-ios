import SwiftUI

struct ContentView: View {
    private let benchmark = BenchmarkRunner()

    var body: some View {
        VStack {
            Button("Run Benchmark!") {
                self.benchmark.run()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
