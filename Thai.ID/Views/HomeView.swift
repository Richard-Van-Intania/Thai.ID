import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath

    @State private var showDialog = false

    var body: some View {
        VStack {
            Button(String("debugs")) {
                showDialog = true
            }
        }.alert(
            String("Unlock using Face ID or Touch ID?"),
            isPresented: $showDialog,
            actions: {
                Button("enable", role: .none) {
                    //
                }
                Button("not_now", role: .cancel) {
                    //
                }
            },
            message: {
                Text("enable_biometrics")
            }
        )
    }
}
