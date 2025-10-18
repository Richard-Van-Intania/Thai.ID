import SwiftUI

struct SettingsView: View {
    @Binding var path: NavigationPath
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false
    @State private var enabledPasscode = false

    var body: some View {
        VStack {
            Spacer().frame(height: 24)
            HStack {
                Text("enable_pin")
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                Spacer()
                Toggle(isOn: $enabledPasscode) {}
            }.padding(.vertical)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).padding(.horizontal).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("login_settings").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar).onAppear {
            enabledPasscode = !passcode.isEmpty && passcodeAsked
        }.onChange(of: enabledPasscode) { old, new in
            if new {
                // on
                path.append(ProfileRoute.enterPasscodeTurnOffView)
            } else {
                path.append(ProfileRoute.enterPasscodeTurnOffView)
            }

            print(enabledPasscode)

            if new && !old && passcode.isEmpty {}

        }
    }
}
