import SwiftUI

struct CreateNewPasscodeView: View {
    @AppStorage("usePasscode") private var usePasscode: Bool = false

    @ObservedObject var passcodeModel: PasscodeModel

    @Binding var path: NavigationPath

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}
