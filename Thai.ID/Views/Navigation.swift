import Foundation

enum HomeRoute: Hashable {
    case welcomeView
    case onboardingView
    case termsView
    case createPasscodeView
    case confirmPasscodeView
    case enterPasscodeLoginView
    case profileDetailsView
    case profileEditView
}

enum HistoryRoute: Hashable {
    case profileDetailsView
}

enum ProfileRoute: Hashable {
    case profileDetailsView
    case profileEditView
    case termsView
}
