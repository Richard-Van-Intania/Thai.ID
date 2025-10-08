import SwiftUI

struct ConfirmPasscodeView: View {
    @Binding var path: NavigationPath

    var body: some View {
        HStack {
            Text(String("ConfirmPasscodeView"))
        }.navigationBarBackButtonHidden(true)
    }
}
