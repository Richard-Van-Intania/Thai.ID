import SwiftUI

struct AuthenticationSuccessView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {}.navigationBarBackButtonHidden(true).onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                path = NavigationPath()
            }
        }
    }
}
