import Combine
import SwiftUI

@main
struct Thai_IDApp: App {
    @StateObject private var settings = AppSettings()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}

class AppSettings: ObservableObject {
    @Published var isLocalAuth: Bool = false
}
