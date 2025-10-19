import SwiftUI

struct SettingsView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("useBiometric") private var useBiometric: Bool = false
    @AppStorage("usePasscode") private var usePasscode: Bool = false

    @Binding var path: NavigationPath
    @Binding var biometricsAskDialog: Bool

    var body: some View {
        VStack {
            Spacer().frame(height: 24)
            HStack {
                Text("enable_pin")
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                Spacer()
                Toggle(isOn: $usePasscode) {}
            }.padding(.vertical)
            HStack {
                VStack(alignment: .leading) {
                    Text("biometrics")
                        .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                    Text("use_biometrics")
                        .font(.custom("FCIconicRegular", size: 20)).foregroundColor(neutral04)
                }
                Spacer()
                Toggle(isOn: $useBiometric) {}
            }.padding(.vertical)
            HStack {
                Text("once_you_enable")
                    .font(.custom("FCIconicRegular", size: 20)).foregroundColor(neutral04)
                Spacer()
                Spacer().frame(width: 72)
            }.padding(.bottom)
            if usePasscode {
                Divider()
                Button(action: {
                    path.append(ProfileRoute.enterPasscodeChangeView)
                }) {
                    HStack {
                        Text("change_pin")
                            .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                        Spacer()
                        Image(systemName: "chevron.right").font(.title2).foregroundColor(primary_darkblue)
                    }.padding(.vertical).contentShape(Rectangle())
                }.buttonStyle(.plain)
                Divider()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).padding(.horizontal).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("login_settings").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar).onChange(
            of: usePasscode
        ) { oldValue, newValue in
            Task {
                try? await Task.sleep(for: .milliseconds(500))
                if newValue && passcode.isEmpty {
                    path.append(ProfileRoute.createNewPasscodeView)
                } else if !newValue && !passcode.isEmpty {
                    path.append(ProfileRoute.enterPasscodeTurnOffView)
                }
            }
        }.onChange(of: useBiometric) { oldValue, newValue in
            Task {
                try? await Task.sleep(for: .milliseconds(500))
                if newValue && !oldValue {
                    biometricsAskDialog = true
                } else if !newValue && oldValue {
                    useBiometric = false
                }
            }
        }
    }
}
