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
                Toggle(isOn: $enabledPasscode) {}.onChange(of: enabledPasscode) {
                    if enabledPasscode {
                        // open and create pass code
                    } else {
                        // open and off passcode
                        // open and off passcode
                    }
                    print(enabledPasscode)
                }
            }.padding(.vertical)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).padding(.horizontal).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("login_settings").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar).onAppear {
            enabledPasscode = !passcode.isEmpty && passcodeAsked
        }
    }
}

// here
