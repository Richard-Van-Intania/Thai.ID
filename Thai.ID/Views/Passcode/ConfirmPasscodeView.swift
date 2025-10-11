import SwiftUI

struct ConfirmPasscodeView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("salt") private var salt: String = ""
    @AppStorage("useBiometric") private var useBiometric: Bool = false
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false
    @Binding var path: NavigationPath
    @Binding var isLocalAuth: Bool
    @Binding var passcodeList: [Int]
    @Binding var passcodeConfirmList: [Int]

    var body: some View {
        HStack {
            Text(String("ConfirmPasscodeView"))
        }.navigationBarBackButtonHidden(true)
    }
}
