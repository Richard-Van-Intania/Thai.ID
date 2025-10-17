import SwiftUI

struct MainView: View {
    @Environment(\.scenePhase) private var scenePhase
    @EnvironmentObject private var settings: AppSettings

    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("isSelectedNeverShowAgain") private var isSelectedNeverShowAgain: Bool = false
    @AppStorage("hideInstruction") private var hideInstruction: Bool = false
    @AppStorage("exportCount") private var exportCount: Int = 0
    @AppStorage("locale") private var locale: UserLocale = .th
    @AppStorage("useBiometric") private var useBiometric: Bool = false
    @AppStorage("homeViewLayout") private var homeViewLayout: ViewLayout = .list
    @AppStorage("historyViewLayout") private var historyViewLayout: ViewLayout = .list
    @AppStorage("isAcceptedAgreements") private var isAcceptedAgreements: Bool = false
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false
    @AppStorage("usePasscode") private var usePasscode: Bool = false

    @State private var selectedTab: Int = 0

    @State private var homePath = NavigationPath()
    @State private var historyPath = NavigationPath()
    @State private var profilePath = NavigationPath()

    @State private var passcodeList: [Int] = []
    @State private var passcodeConfirmList: [Int] = []

    @State private var biometricsAskDialog: Bool = false
    @State private var biometricsSuccessDialog: Bool = false
    @State private var biometricsFailedDialog: Bool = false

    var body: some View {
        ZStack {
            ZStack {
                NavigationStack(path: $homePath) {
                    HomeView(path: $homePath).navigationDestination(for: HomeRoute.self) { screen in
                        switch screen {
                        case .welcomeView:
                            WelcomeView(path: $homePath)
                        case .onboardingView:
                            OnboardingView(path: $homePath)
                        case .termsView:
                            TermsView(path: $homePath)
                        case .createPasscodeView:
                            CreatePasscodeView(path: $homePath, passcodeList: $passcodeList)
                        case .confirmPasscodeView:
                            ConfirmPasscodeView(
                                path: $homePath,
                                passcodeList: $passcodeList,
                                passcodeConfirmList: $passcodeConfirmList,
                            )
                        case .authenticationSuccessView:
                            AuthenticationSuccessView(path: $homePath, biometricsAskDialog: $biometricsAskDialog)
                        case .enterPasscodeLoginView:
                            EnterPasscodeLoginView(
                                path: $homePath,
                                passcodeList: $passcodeList,
                            )
                        case .profileDetailsView:
                            ProfileDetailsView(path: $homePath)
                        case .profileEditView:
                            ProfileEditView(path: $homePath)
                        }
                    }
                }
                .opacity(selectedTab == 0 ? 1 : 0)
                NavigationStack(path: $historyPath) {
                    HistoryView(path: $historyPath)
                }
                .opacity(selectedTab == 1 ? 1 : 0)
                NavigationStack(path: $profilePath) {
                    ProfileView(path: $profilePath).navigationDestination(for: ProfileRoute.self) { screen in
                        switch screen {
                        case .profileDetailsView:
                            ProfileDetailsView(path: $profilePath)
                        case .profileEditView:
                            ProfileEditView(path: $profilePath)
                        case .settingsView:
                            SettingsView(path: $profilePath)
                        case .enterPasscodeTurnOffView:
                            EnterPasscodeTurnOffView(path: $profilePath, passcodeList: $passcodeList)
                        case .localizationSettingsView:
                            LocalizationSettingsView(path: $profilePath)
                        case .policyAndSafetyView:
                            PolicyAndSafetyView(path: $profilePath)
                        case .termsView:
                            TermsView(path: $profilePath)
                        case .supportView:
                            SupportView(path: $profilePath)

                        }
                    }
                }
                .opacity(selectedTab == 2 ? 1 : 0)
            }.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    TabButton(icon: "house", selectedIcon: "house.fill", label: "home", tab: 0, selectedTab: $selectedTab)
                    TabButton(icon: "clock", selectedIcon: "clock.fill", label: "history", tab: 1, selectedTab: $selectedTab)
                    TabButton(icon: "person.circle", selectedIcon: "person.circle.fill", label: "profile", tab: 2, selectedTab: $selectedTab)
                }.ignoresSafeArea().background(.white)
            }.opacity((homePath.isEmpty && historyPath.isEmpty && profilePath.isEmpty) ? 1 : 0)
        }.alert(
            "use_biometrics",
            isPresented: $biometricsAskDialog,
            actions: {
                Button("enable", role: .none) {
                    authenticateWithBiometrics(completion: { success, _ in
                        useBiometric = success
                        if success {
                            biometricsSuccessDialog = true
                        } else {
                            biometricsFailedDialog = true
                        }
                    })
                }
                Button("not_now", role: .cancel) {
                    useBiometric = false
                }
            },
            message: {
                Text("enable_biometrics")
            },
        ).alert(
            "enable_biometrics_success",
            isPresented: $biometricsSuccessDialog,
            actions: {
                Button("ok", role: .none) {}
            },
        ).alert(
            "unable_use_biometrics",
            isPresented: $biometricsFailedDialog,
            actions: {
                Button("ok", role: .none) {}
            },
        ).onAppear {
            if !settings.isLocalAuth {
                if !isAcceptedAgreements {
                    homePath.append(HomeRoute.welcomeView)
                } else if !passcodeAsked {
                    homePath.append(HomeRoute.createPasscodeView)
                } else if usePasscode {
                    homePath.append(HomeRoute.enterPasscodeLoginView)
                }
            }
        }
        .onDisappear {
            // Invalidate the timer when the view disappears

        }.onChange(of: scenePhase) { old, new in
            //
        }
    }
}

struct TabButton: View {
    let icon: String
    let selectedIcon: String
    let label: String
    let tab: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button(
            action: {
                selectedTab = tab
            },
            label: {
                VStack {
                    Image(systemName: selectedTab == tab ? selectedIcon : icon)
                        .foregroundColor(selectedTab == tab ? primary_darkblue : neutral04)
                        .font(.title)
                    Text(LocalizedStringKey(label))
                        .font(.custom(selectedTab == tab ? "FCIconicBold" : "FCIconicRegular", size: 12)).foregroundColor(
                            selectedTab == tab ? primary_darkblue : neutral04,
                        ).frame(maxHeight: 8)
                }.frame(maxWidth: .infinity).padding(.top, 16).contentShape(Rectangle())
            },
        )
        .buttonStyle(.plain)
    }
}

#Preview {
    MainView().environment(\.locale, Locale(identifier: "th"))
}
