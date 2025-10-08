import SwiftUI

struct EnterPasscodeLoginView: View {
    @Binding var path: NavigationPath

    var body: some View {
        HStack {
            Text(String("EnterPasscodeLoginView"))
        }.navigationBarBackButtonHidden(true)
    }
}
