import Foundation

enum OnboardingRoute: Hashable {
    case onboardingView
    case termsView
}

enum HomeRoute: Hashable {
    case profileDetailsView
    case profileEditView
    case createPasscodeView

}

enum HistoryRoute: Hashable {
    case profileDetailsView

}

enum ProfileRoute: Hashable {
    case profileDetailsView
    case profileEditView
    case termsView

}
