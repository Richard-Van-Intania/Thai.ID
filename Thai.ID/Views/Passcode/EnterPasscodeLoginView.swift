import SwiftUI

struct EnterPasscodeLoginView: View {
    @Binding var path: NavigationPath

    var body: some View {
        HStack {
            Text("EnterPasscodeLoginView")
        }.navigationBarBackButtonHidden(true)
    }
}
