import SwiftUI

struct ProfileView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(
            spacing: 16,
        ) {
            HStack {
                Image("thai_id_app_icon").resizable()
                    .scaledToFit().frame(height: 64)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(secondary_gray, lineWidth: 1)
                    }
                Spacer().frame(width: 16)
                Text("my_account").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
                Spacer()
                Button(action: {
                    //
                }) {
                    Image(systemName: "pencil.line")
                        .font(.title2)
                        .foregroundColor(neutral05)
                }.buttonStyle(.plain)
                Spacer().frame(width: 8)
            }.padding(16).frame(maxWidth: .infinity).background(white)
                .cornerRadius(16).shadow(radius: 1).padding(.horizontal)
            VStack(alignment: .leading) {
                Spacer().frame(height: 32)
                Text("settings").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black).padding(.horizontal, 24)
                Spacer().frame(height: 24)
                SettingsMenu(label: "login_settings", onButtonTap: { path.append(ProfileRoute.settingsView) })
                SettingsMenu(label: "language", onButtonTap: { path.append(ProfileRoute.localizationSettingsView) })
                SettingsMenu(label: "privacy_policy", onButtonTap: { path.append(ProfileRoute.policyAndSafetyView) })
                SettingsMenu(label: "terms", onButtonTap: { path.append(ProfileRoute.termsView) })
                SettingsMenu(label: "help_support", onButtonTap: { path.append(ProfileRoute.supportView) })
                Spacer().frame(height: 24)
            }
            .frame(maxWidth: .infinity).background(white)
            .cornerRadius(16).shadow(radius: 1).padding(.horizontal)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).background(neutral01).toolbar {
            ToolbarItem(placement: .principal) {
                Text("my_profile").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(neutral01, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}

struct SettingsMenu: View {
    let label: String
    let onButtonTap: () -> Void

    var body: some View {
        Button(action: onButtonTap) {
            HStack {
                Text(LocalizedStringKey(label)).font(.custom("FCIconicRegular", size: 24)).foregroundColor(primary_black)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(primary_darkblue)
            }.padding(.vertical, 8).padding(.horizontal, 24).contentShape(Rectangle())
        }.buttonStyle(.plain)
    }
}
