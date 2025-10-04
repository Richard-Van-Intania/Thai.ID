import SwiftUI

struct MainView: View {
    @State private var isAcceptAgreement: Bool = true
    @State private var selectedTab: Int = 0
    @State private var onboardingPath = NavigationPath()
    @State private var homePath = NavigationPath()
    @State private var historyPath = NavigationPath()
    @State private var profilePath = NavigationPath()

    var body: some View {
        ZStack {
            ZStack {
                NavigationStack(path: $homePath) {
                    HomeView()
                }
                .opacity(selectedTab == 0 ? 1 : 0)
                NavigationStack(path: $historyPath) {
                    HistoryView()
                }
                .opacity(selectedTab == 1 ? 1 : 0)
                NavigationStack(path: $profilePath) {
                    ProfileView()
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
            }
            NavigationStack(path: $onboardingPath) {
                WelcomeView(path: $onboardingPath).navigationDestination(for: OnboardingRoutes.self) { screen in
                    switch screen {
                    case .onboardingView:
                        OnboardingView(path: $onboardingPath)
                    case .termsView:
                        TermsView(path: $onboardingPath, isAcceptAgreement: $isAcceptAgreement)
                    }
                }
            }.opacity(isAcceptAgreement ? 0 : 1)
            NavigationStack {
                LoadingView()
            }.opacity(0)
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
