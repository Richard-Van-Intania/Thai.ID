import SwiftUI

struct MainView: View {
    @Environment(\.scenePhase) private var scenePhase

    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("salt") private var salt: String = ""
    @AppStorage("isSelectedNeverShowAgain") private var isSelectedNeverShowAgain: Bool = false
    @AppStorage("hideInstruction") private var hideInstruction: Bool = false
    @AppStorage("exportCount") private var exportCount: Int = 0
    @AppStorage("locale") private var locale: UserLocale = .th
    @AppStorage("useBiometric") private var useBiometric: Bool = false
    @AppStorage("homeViewLayout") private var homeViewLayout: ViewLayout = .list
    @AppStorage("historyViewLayout") private var historyViewLayout: ViewLayout = .list
    @AppStorage("isAcceptedAgreements") private var isAcceptedAgreements: Bool = false
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false

    @State private var onboardingPath = NavigationPath()
    @State private var homePath = NavigationPath()
    @State private var historyPath = NavigationPath()
    @State private var profilePath = NavigationPath()

    @State private var selectedTab: Int = 0
    @State private var isLocalAuth: Bool = false

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
                            CreatePasscodeView(path: $homePath)
                        case .confirmPasscodeView:
                            ConfirmPasscodeView(path: $homePath)
                        case .enterPasscodeLoginView:
                            EnterPasscodeLoginView(path: $homePath)
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
                        case .termsView:
                            TermsView(path: $profilePath)
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
        }.onChange(of: scenePhase) { oldPhase, newPhase in
            if newPhase == .active {
                if passcode.isEmpty && salt.isEmpty && !isAcceptedAgreements && !passcodeAsked {
                    homePath.append(HomeRoute.welcomeView)
                } else if passcode.isEmpty && salt.isEmpty && isAcceptedAgreements && !passcodeAsked {
                    homePath.append(HomeRoute.createPasscodeView)
                } else if !passcode.isEmpty && !salt.isEmpty && isAcceptedAgreements && passcodeAsked {
                    homePath.append(HomeRoute.enterPasscodeLoginView)
                }
            }
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
                        .font(.system(size: 24))
                    Text(LocalizedStringKey(label))
                        .font(.custom(selectedTab == tab ? "FCIconicBold" : "FCIconicRegular", size: 12)).foregroundColor(
                            selectedTab == tab ? primary_darkblue : neutral04
                        ).frame(maxHeight: 4)
                }
            }
        )
        .buttonStyle(.plain).frame(maxWidth: .infinity).padding(.top, 16)
    }
}

#Preview {
    MainView().environment(\.locale, Locale(identifier: "th"))
}
