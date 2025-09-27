import SwiftUI

struct ContentView: View {
    var body: some View {
        WelcomeView().environment(\.locale, Locale(identifier: "en"))
    }
}

#Preview {
    ContentView()
}
