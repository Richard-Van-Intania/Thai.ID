import SwiftUI

struct EnterPasscodeTurnOffView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("useBiometric") private var useBiometric: Bool = false

    @Binding var path: NavigationPath
    @Binding var passcodeList: [Int]

    @State private var isInvalid = false
    @State private var shakeCount = 0
    @State private var verifyPasscodeFailedDialog: Bool = false

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}
