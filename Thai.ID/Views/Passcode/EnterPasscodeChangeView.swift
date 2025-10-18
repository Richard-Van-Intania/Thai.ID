import SwiftUI

struct EnterPasscodeChangeView: View {
    @AppStorage("passcode") private var passcode: String = ""

    @ObservedObject var passcodeModel: PasscodeModel

    @Binding var path: NavigationPath

    @State private var isInvalid = false
    @State private var shakeCount = 0
    @State private var verifyPasscodeFailedDialog: Bool = false

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}
