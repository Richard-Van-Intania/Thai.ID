import SwiftUI

struct CreateNewPasscodeView: View {
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false
    @AppStorage("usePasscode") private var usePasscode: Bool = false

    @EnvironmentObject private var settings: AppSettings
    @ObservedObject var passcodeModel: PasscodeModel

    @Binding var path: NavigationPath

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}
