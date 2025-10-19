import SwiftUI

struct ContentView: View {
    @AppStorage("locale") private var locale: UserLocale = .th

    var body: some View {
        MainView().environment(\.locale, Locale(identifier: locale.rawValue))
    }
}
