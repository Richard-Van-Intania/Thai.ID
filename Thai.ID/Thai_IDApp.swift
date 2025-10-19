import Combine
import SwiftUI

@main
struct Thai_IDApp: App {
    @AppStorage("locale") private var locale: UserLocale = .th
    @StateObject private var settings = AppSettings()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.locale, Locale(identifier: locale.rawValue)).environmentObject(settings)
        }
    }
}

class AppSettings: ObservableObject {
    @Published var isLocalAuth: Bool = false
}
