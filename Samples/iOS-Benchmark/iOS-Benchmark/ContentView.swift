import SwiftUI

struct ContentView: View {
    private let benchmark = BenchmarkRunner()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
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
