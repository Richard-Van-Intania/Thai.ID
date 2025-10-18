import Foundation

enum HomeRoute: Hashable {
    case welcomeView
    case onboardingView
    case termsView
    case createPasscodeView
    case confirmPasscodeView
    case enterPasscodeLoginView
    case authenticationSuccessView
    case profileDetailsView
    case profileEditView

}

enum HistoryRoute: Hashable {
    case profileDetailsView
}

enum ProfileRoute: Hashable {
    case profileDetailsView
    case profileEditView
    case settingsView
    case enterPasscodeTurnOffView
    case createNewPasscodeView
    case confirmNewPasscodeView

    //
    case localizationSettingsView
    case policyAndSafetyView
    case termsView
    case supportView
}

// authenticationSuccessView  case enterPasscodeTurnOffView
