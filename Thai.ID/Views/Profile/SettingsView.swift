import SwiftUI

struct SettingsView: View {
    @AppStorage("useBiometric") private var useBiometric: Bool = false
    @AppStorage("usePasscode") private var usePasscode: Bool = false

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Spacer().frame(height: 24)
            HStack {
                Text("enable_pin")
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                Spacer()
                Toggle(isOn: $usePasscode) {}
            }.padding(.vertical)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).padding(.horizontal).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("login_settings").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar).onAppear {
            //
        }.onChange(of: usePasscode) { oldValue, newValue in
            if newValue {
                // on
                //                path.append(ProfileRoute.enterPasscodeTurnOffView)
            } else {
                path.append(ProfileRoute.enterPasscodeTurnOffView)
            }

        }
    }
}
